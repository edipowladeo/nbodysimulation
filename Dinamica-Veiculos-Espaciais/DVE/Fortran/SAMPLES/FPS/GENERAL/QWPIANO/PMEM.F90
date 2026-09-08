!-----------------------------------------------------------------------
!
!  PMEM.F90 - Memory I/O subroutines for QWPIANO
!
!  Routines in this source file:
!    Load        = Read a data file into memory
!    SaveNotes   = Write the notes in memory into a data file
!    RecordNotes = Record in memory the notes played manually
!    Playback    = Play the notes in memory
!
!-----------------------------------------------------------------------
!
!  Here is how notes are saved in the text files.
!  This information is stored one note per line.
!
!  Any nonblank in column 1 = comment
!  Columns  3-7  = Time (/ in col. 5)
!  Columns 11-39 = Note
!
!  The duration is given as a fraction of a whole note whose numerator
!  is in columns 3 and 4, and whose denominator is in columns 6 and 7.
!  The fraction slash must be in column 5.
!
!  The tone is given by its position.  The first legal character marks
!  the note under which it is aligned.  Only naturals are listed; to
!  mark a sharp or flat, a special character is used under the natural.
!
!         Here is a sample of the file format.
!         Consider these lines to begin in column 1.
!
!         !-------------------------------------------
!         !
!         !  QWPiano input file.
!         !
!         !  "The Entertainer" by Scott Joplin
!         !
!         !  Time: 4/4
!         !  Key:  C major
!         !
!         !-------------------------------------------
!         !
!         !  Input code:
!         !
!         !    Any nonblank in column 1 = comment
!         !    Columns  3-7  = Time (/ in col. 5)
!         !    Columns 11-39 = Note
!         !
!         !    Time = nn/nn
!         !    # = sharp ; % = flat ; A-G,X = natural
!         !    any other character = rest
!         !
!         !-------------------------------------------
!         !
!         !  Time   ABCDEFGABCDEFGABcDEFGABCDEFGA
!         ! =====   =============================
!            1/8              D                  
!            1/8              #                  
!            1/8               E                 
!            1/4                    C            
!
!-----------------------------------------------------------------------

SUBROUTINE Load(checked)

USE MSFLIB
USE PIANOMOD

LOGICAL(4)    checked
INTEGER(4)    num, denom, i4
CHARACTER(29) str29
CHARACTER(40) str40

! This routine reads a text file in the format described above.  The
! data is read and interpreted all at once and stored in the global
! array MemNotes.

! Suppress "unused dummy argument" warnings.
checked = .TRUE.

! Initialize note counter.
NumNotes = 0

! Let the user select the data file to load.
! Open a file with a blank filename.  Under QuickWin, this automatically
! brings up a Select File dialog box that is used to connect a file to
! the unit number.
open(RecUnit, file=' ')

! Read a line of data from the file.
100 continue
read(RecUnit, '(A40)', end=999, err=901) str40

! If the first character is nonblank, then the line is a comment, so
! skip the line by jumping back to the "Read a line" label.
if (str40(1:1) /= ' ') goto 100

! Parse out the duration numerator and denominator, and the scale.
read(str40, '(2X,I2,1X,I2)', err=902) num, denom
str29 = str40(11:39)

! Increment note counter.
NumNotes = NumNotes + 1

! Find the first legal note marker in the scale.
i4 = scan(str29, 'ABCDEFGabcdefg#%Xx')

! If no legal note marker was found, the note is a rest.  Otherwise, the
! position of the marker in the scale corresponds to the position of the
! note's tone in the frequency arrays.  Black keys are stored as 100 plus
! the position, to differentiate them from naturals.
if (i4 == 0) then
  MemNotes(NumNotes, 1) = 30000
else
  select case (str29(i4:i4))
    case ('%')
      MemNotes(NumNotes, 1) = i4 + 99
    case ('#')
      MemNotes(NumNotes, 1) = i4 + 100
    case default
      MemNotes(NumNotes, 1) = i4
  end select
end if

! Check for illegal duration values.  If either of the values is illegal,
! halt the program with an error.  If the values are good, convert them
! to a duration in milliseconds.
if ((num == 0) .OR. (denom == 0)) then
  i4 = messageboxqq('Time data of zero in input file.'C, &
                    'QWPiano Error'C, MB$ICONSTOP)
  close(RecUnit)
  stop 3
else
  MemNotes(NumNotes, 2) = int(real(num)/real(denom)*1024.0)
end if

! If the note limit is reached, give a warning but allow the program to
! continue with the notes that were read.
if (NumNotes == NoteLimit) then
  i4 = messageboxqq('Note limit reached.'C, &
                    'QWPiano Warning'C, MB$ICONINFORMATION)
  goto 999
end if

! Keep reading lines until the file is exhausted or the note limit is
! reached.
goto 100

! Error during read from data file.
901 continue
i4 = messageboxqq('Error reading from input file.'C, &
                  'QWPiano Error'C, MB$ICONSTOP)
close(RecUnit)
stop 1

! Error during internal read of numerator and denominator.
902 continue
i4 = messageboxqq('Bad data in input file.'C, &
                  'QWPiano Error'C, MB$ICONSTOP)
close(RecUnit)
stop 2

! Successful loading.  Close input file and return to main program.
999 continue
i4 = messageboxqq('Data successfully loaded.'C, &
                  'QWPiano Message'C, MB$ICONINFORMATION)
close(RecUnit)
return
end

!-----------------------------------------------------------------------

SUBROUTINE SaveNotes(checked)

USE MSFLIB
USE PIANOMOD

LOGICAL(4)    checked
CHARACTER(1)  char
CHARACTER(29) str29
INTEGER(4)    i4, pos, num

! This routine saves a text file in the format described above.  All of
! the notes that are currently in memory are converted and written.  A
! standard header of comments is included at the start of the file.

! Suppress "unused dummy argument" warnings.
checked = .TRUE.

! Let the user enter a name for the data file to save.
! Open a file with a blank filename.  Under QuickWin, this automatically
! brings up a Select File dialog box that is used to connect a file to
! the unit number.
open(RecUnit, file=' ')

! Write the standard header.
100 continue
write(RecUnit, '(A)') "!" // repeat('-', 43)
write(RecUnit, '(A)') "!"
write(RecUnit, '(A)') "!  QWPiano input file."
write(RecUnit, '(A)') "!"
write(RecUnit, '(A)') "!" // repeat('-', 43)
write(RecUnit, '(A)') "!"
write(RecUnit, '(A)') "!  Input code:"
write(RecUnit, '(A)') "!"
write(RecUnit, '(A)') "!    Any nonblank in column 1 = comment"
write(RecUnit, '(A)') "!    Columns  3-7  = Time (/ in col. 5)"
write(RecUnit, '(A)') "!    Columns 11-39 = Note"
write(RecUnit, '(A)') "!"
write(RecUnit, '(A)') "!    Time = nn/nn"
write(RecUnit, '(A)') "!    # = sharp ; % = flat ; A-G,X = natural"
write(RecUnit, '(A)') "!    any other character = rest"
write(RecUnit, '(A)') "!"
write(RecUnit, '(A)') "!" // repeat('-', 43)
write(RecUnit, '(A)') "!"
write(RecUnit, '(A)') "!  Time   ABCDEFGABCDEFGABcDEFGABCDEFGA"
write(RecUnit, '(A)') "! =====   ============================="

! Cycle through all the notes in memory.
do i4 = 1, NumNotes

  ! The "duration granularity" for this program is 1/64 of a whole note.
  ! Using a duration granularity evens out the timing of manually entered
  ! notes, and ensures that the numbers fit in the designed format.
  
  ! All durations are stored as multiples of the duration granularity.
  ! The duration of a whole note is 1024 milliseconds.
  ! 1024/64=16, so the real time is divided by 16 to get the numerator.
  num = MemNotes(i4,2)/16

  ! If the duration of the note is less than the duration granularity,
  ! then it is too short to save.  Most likely, such notes are manual
  ! accidents anyway.
  if (num == 0) cycle
  
  ! Find the appropriate position for the rest or note marker.
  if (MemNotes(i4,1) == 30000) then
    char = ' '
    pos  = 1
  else
    if (MemNotes(i4,1) < 100) then
      char = 'X'
      pos  = MemNotes(i4,1)
    else
      char = '#'
      pos  = MemNotes(i4,1)-100
    end if
  end if
  
  ! Write the note to the output file.
  str29 = repeat(' ', pos-1) // char // repeat(' ', 29-pos)
  write(RecUnit, '(2X,I2,A1,A2,3X,A29)', err=901) num, '/', '64', str29
end do

goto 999

! Error during write to data file.
901 continue
i4 = messageboxqq('Error writing to output file.'C, &
                  'QWPiano Error'C, MB$ICONSTOP)
close(RecUnit)
stop 1

! Successful saving.  Close output file and return to main program.
999 continue
i4 = messageboxqq('Data successfully saved.'C, &
                  'QWPiano'C, MB$ICONINFORMATION)
close(RecUnit)
return
end

!-----------------------------------------------------------------------

SUBROUTINE RecordNotes(checked)

USE MSFLIB
USE PIANOMOD

LOGICAL(4)  checked

! This routine toggles the global recording variable each time the
! Record menu item is selected, and checks or unchecks the menu item
! appropriately.

if (checked) then
  checked   = modifymenuflagsqq(1, 4, $MENUUNCHECKED)
  recording = .FALSE.
  NumNotes  = NumNotes - 1
  ! Allow Playback mode to be entered now that recording is over.
  checked   = modifymenuflagsqq(1, 1, $MENUENABLED)
else
  checked   = modifymenuflagsqq(1, 4, $MENUCHECKED)
  recording = .TRUE.
  NumNotes  = 0
  ! Do not allow Playback mode to be entered while recording.
  checked   = modifymenuflagsqq(1, 1, $MENUGRAYED)
end if

return
end

!-----------------------------------------------------------------------

SUBROUTINE Playback(checked)

USE MSFLIB
USE MT
USE PIANOMOD

LOGICAL(4)  checked, l
INTEGER(4)  i4, note, handle
EXTERNAL    ThreadPlay
SAVE        handle

! This routine starts a playback of the notes in memory.  The
! playback is done in a thread so that other actions can be done
! while the playback is occurring.

! We do not want to allow two playbacks at the same time, so if
! the Playback menu item is selected while a playback is occurring,
! we will simply stop the current playback by terminating its thread.

if (checked) then
  checked = modifymenuflagsqq(1, 1, $MENUUNCHECKED)
  playing = .FALSE.
  ! Allow Record mode to be entered now that playback is over.
  checked = modifymenuflagsqq(1, 4, $MENUENABLED)
  ! Kill any playback thread.
  l = TerminateThread (handle, 0)
  l = CloseHandle(handle)
  ! In case a key was highlighted when we killed the playback thread,
  ! redraw the keyboard.
  call DrawKeyboard()
  return
end if

! The Playback menu item was not checked when it was selected, so
! start a playback, but only if there are notes in memory.
  
if (NumNotes == 0) then
  i4 = messageboxqq('No notes are currently in memory.'C, &
                    'QWPiano Warning'C, MB$ICONINFORMATION)
  return
end if

checked = modifymenuflagsqq(1, 1, $MENUCHECKED)
playing = .TRUE.

! Do not allow Record mode to be entered during playback.
checked = modifymenuflagsqq(1, 4, $MENUGRAYED)

note = -1 ! tell the thread to use the notes in memory
handle = CreateThread (0, 0, ThreadPlay, note, 0, i4)

return
end

!-----------------------------------------------------------------------
