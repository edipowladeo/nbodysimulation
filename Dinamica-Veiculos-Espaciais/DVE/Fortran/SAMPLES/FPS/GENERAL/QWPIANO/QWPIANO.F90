!-----------------------------------------------------------------------
!
!  QWPIANO.F90 - QuickWin Four-Octave Piano Sample Program
!
!  This program demonstrates using mouse callbacks and menu callbacks in
!  a QuickWin application.  It draws a graphical piano keyboard on the
!  screen that you can play using the mouse.  You can also record and
!  play back tones, and compose data files that can be loaded and played
!  back too.  Sample music data files are included.
!
!  Routines in this source file:
!    Main (QWPiano)  = Set up display and mouse events
!    KeyboardControl = Respond to mouse action on the keyboard
!    ThreadPlay      = Play a note in a thread (to allow termination)
!    InitialSettings = Set up menus
!    Instructions    = Display a message box with program instructions
!
!  Other source files:
!    PIANOMOD.F90 = Module file for global data
!    PDRAW.F90    = Drawing and Keyboard menu subroutines
!    PMEM.F90     = Piano menu subroutines (Memory I/O)
!    PTEMPO.F90   = Tempo menu subroutines
!
!  Sample music data files:
!    ENTERTNR.TXT = "The Entertainer" by Scott Joplin
!    FIGURINE.TXT = "Chinese Figurine" by Vladimir Rebikoff
!    GNOME.TXT    = "Dancing Gnome" by Vladimir Rebikoff
!    MENUET.TXT   = "Menuet in G" by Ludwig van Beethoven
!    MUSICBOX.TXT = "Music Box" by Vladimir Rebikoff
!    POLONAIS.TXT = "Polonaise in C" by Leopold Mozart
!
!-----------------------------------------------------------------------

PROGRAM QWPiano

USE MSFLIB
USE PIANOMOD

INTEGER(4)  i4, event, ix, iy
EXTERNAL    KeyboardControl

! Set up the display.
i4 = clickmenuqq(QWIN$STATUS)
i4 = aboutboxqq('QuickWin Piano\rVersion 1.0'C)
OPEN(KeyUnit, file='user', title='QWPiano')
call DrawKeyboard()

! Register the mouse events.  Each time the mouse is moved, or the left
! mouse button is used in the QWPiano application window, the routine
! KeyboardControl will be called.
event = MOUSE$MOVE
event = IOR (event, MOUSE$LBUTTONUP)
event = IOR (event, MOUSE$LBUTTONDOWN)
event = IOR (event, MOUSE$LBUTTONDBLCLK)
i4 = registermouseevent(KeyUnit, event, KeyboardControl)

! Wait forever to allow event-driven action.
do while (.TRUE.)
  i4 = waitonmouseevent(MOUSE$RBUTTONDOWN, i4, ix, iy)
end do
end

!-----------------------------------------------------------------------

SUBROUTINE KeyboardControl(iunit, ievent, ikeystate, ixpos, iypos)

USE MSFLIB
USE MT
USE PIANOMOD

INTEGER(4)  iunit, ievent, ikeystate, ixpos, iypos
INTEGER(2)  color, hour, minute, second, hund
INTEGER(4)  time, lasttime / 0 /, duration
INTEGER(4)  note, lastnote / 30000 /
INTEGER(4)  handle, i4
LOGICAL     l
EXTERNAL    ThreadPlay
SAVE        lasttime, lastnote, handle

! This is a statement function to create a single time number out of the
! time information returned by the library routine gettim.
BigTime(hour, minute, second, hund) = (((hour*60+minute)*60+second)*100)+hund

! Suppress "unused dummy argument" warnings.  Callback routines such as
! this one must all have the same argument list.  This means you will get
! warnings for any of the arguments that you don't use.  This statement
! eliminates such warnings by "using" any leftover arguments.  Make very
! certain that the variable on the left is one you don't need!
iunit = iunit + ievent

! Set l to true if the left mouse button is down.  It does not matter
! whether the event that sent us to this routine is a button click or a
! mouse movement.  If the left button is down and the cursor is over a
! piano key, then we want to play a note.
l = (IAND(MOUSE$KS_LBUTTON, ikeystate) == MOUSE$KS_LBUTTON)

! Identify the color of the pixel to which the mouse points.
! The color is used to decide whether a black key or white key should be
! played.  Or, if the color is the background color, then any current
! note should be terminated, since the mouse is off of the keyboard.
color = getpixel(ixpos, iypos)

if ((.NOT.l) .OR. (color == BackColor)) then
  note = 30000 ! too high to hear simulates speaker off
else ! determine the key by the x position of the mouse
  if ((color == Ivory) .OR. (color == Ivorydown)) then
    note = ixpos/scale
  else
    note = (ixpos-third-1)/scale+100
  end if
  call Highlight(note, .TRUE.)
end if

! If this note is the same as the last note, then the user has only moved
! the mouse over the same key without releasing the button, so we should
! just continue playing the current note.
if (note == lastnote) return

! Unless the last note was a rest, turn off its highlighting.
if (lastnote /= 30000) call Highlight(lastnote, .FALSE.)

! If we are in Record mode, save each new note and its duration.
if (recording) then
  if (NumNotes == 0) then
    call gettim(hour, minute, second, hund)
    lasttime = BigTime(hour, minute, second, hund)
  else
    call gettim(hour, minute, second, hund)
    time = BigTime(hour, minute, second, hund)
    duration = (time-lasttime)*10/tempo
    lasttime = time
    MemNotes(NumNotes, 1) = lastnote
    MemNotes(NumNotes, 2) = duration
  end if

  NumNotes = NumNotes + 1
  if (NumNotes == NoteLimit) then
    i4 = messageboxqq('Note limit reached.  Exiting Record mode.'C, &
                      'QWPiano Warning'C, MB$ICONINFORMATION)
    ! Since we know we are in Record mode presently, to exit Record
    ! mode we just simulate the user selecting the Record menu item
    ! by invoking its callback routine directly.
    call RecordNotes(.TRUE.)
  end if
end if

! The current note now becomes the last note and is played via the beepqq
! library routine in a thread subroutine.
lastnote = note
if (note /= 30000) then
  if (note < 100) then
    note = IvoryNotes(note)
  else
    note = EbonyNotes(note-100)
  end if
end if

! Every note is actually set to play for several seconds initially,
! since we have to start playing it without knowing how long it may last.

! Whenever the next note comes along, we simply kill the thread playing
! the current note and start a thread for the next one.  When each new
! thread begins to beep, the beep of the terminated thread is replaced
! with the beep of the new thread.

! This is another reason why an ultra-high frequency beep is used to
! simulate a rest.  Without a new beep to replace it, the beep of the
! terminated thread would linger on even though its thread is gone.

! The same thread handle is used over and over, since we only ever have
! one thread active at a time.
l = TerminateThread (handle, 0)
l = CloseHandle(handle)
handle = CreateThread (0, 0, ThreadPlay, note, 0, i4)

return
end

!-----------------------------------------------------------------------

SUBROUTINE ThreadPlay (freq)

USE MSFLIB
USE MT
USE PIANOMOD

INTEGER(4)  freq, i4

! If freq is not -1, we are being called by subroutine KeyboardControl.
! As described above (in the KeyboardControl comments), all that this
! does is start a long beep at the required frequency.

if (freq /= -1) then
  call beepqq(freq, 5000)
  call ExitThread(0)
  return
end if

! If freq is -1, we are being called by subroutine Playback.

! This line makes sure that the Highlight calls operate on the QWPiano
! window.  Without this, the thread would by default open a new window.
i4 = focusqq(KeyUnit)

! This loop runs through the array of notes in memory.  During a
! playback, we know how long each note is to be, so we don't need to
! bother with the thread trick described in KeyboardControl.  Instead,
! we just beep or sleep for the appropriate amount of time.

do i4 = 1, NumNotes
  if (MemNotes(i4,1) == 30000) then
    call sleepqq(MemNotes(i4,2)*tempo)
  else
    if (MemNotes(i4,1) < 100) then
      note = IvoryNotes(MemNotes(i4,1))
    else
      note = EbonyNotes(MemNotes(i4,1)-100)
    end if
    call Highlight(MemNotes(i4,1), .TRUE.)
    call beepqq(note, MemNotes(i4,2)*tempo)
    call Highlight(MemNotes(i4,1), .FALSE.)
  end if
end do

! Since we know we are in Playback mode presently, to exit Playback
! mode we just simulate the user selecting the Playback menu item
! by invoking its callback routine directly.
call Playback(.TRUE.)

return
end

!-----------------------------------------------------------------------

LOGICAL(4) FUNCTION InitialSettings()

USE MSFLIB

LOGICAL(4)  l4
EXTERNAL    Load, SaveNotes, RecordNotes, Playback
EXTERNAL    Bigger, Smaller
EXTERNAL    Andante, Moderato, Allegro
EXTERNAL    Instructions

! This routine is called automatically when the program begins.  It sets
! up the menu structure for the program, and connects "callback" routines
! with each menu item.

l4 = appendmenuqq(1, $MENUENABLED,   'Piano'C,          NUL)
l4 = appendmenuqq(1, $MENUENABLED,   'Playback'C,       Playback)
l4 = appendmenuqq(1, $MENUENABLED,   'Load'C,           Load)
l4 = appendmenuqq(1, $MENUSEPARATOR, 'sep'C,            NUL)
l4 = appendmenuqq(1, $MENUENABLED,   'Record'C,         RecordNotes)
l4 = appendmenuqq(1, $MENUENABLED,   'Save'C,           SaveNotes)
l4 = appendmenuqq(1, $MENUSEPARATOR, 'sep'C,            NUL)
l4 = appendmenuqq(1, $MENUENABLED,   'Exit'C,           WINEXIT)

l4 = appendmenuqq(2, $MENUENABLED,   'Keyboard'C,       NUL)
l4 = appendmenuqq(2, $MENUENABLED,   'Bigger'C,         Bigger)
l4 = appendmenuqq(2, $MENUENABLED,   'Smaller'C,        Smaller)
l4 = appendmenuqq(2, $MENUENABLED,   'Full Screen'C,    WINFULLSCREEN)

l4 = appendmenuqq(3, $MENUENABLED,   'Tempo'C,          NUL)
l4 = appendmenuqq(3, $MENUENABLED,   'Andante'C,        Andante)
l4 = appendmenuqq(3, $MENUCHECKED,   'Moderato'C,       Moderato)
l4 = appendmenuqq(3, $MENUENABLED,   'Allegr&o'C,       Allegro)

l4 = appendmenuqq(4, $MENUENABLED,   'Help'C,           NUL)
l4 = appendmenuqq(4, $MENUENABLED,   'Instructions'C,   Instructions)
l4 = appendmenuqq(4, $MENUENABLED,   'About Piano...'C, WINABOUT)

InitialSettings = l4

return
end

!-----------------------------------------------------------------------

SUBROUTINE Instructions(checked)

USE MSFLIB
USE PIANOMOD

LOGICAL(4)      checked
INTEGER(4)      i4

! Suppress "unused dummy argument" warnings.
checked = .TRUE.

! Display a message box with program instructions.
i4 = messageboxqq('QuickWin Four-Octave Piano Sample Program\r&
&\r&
&QWPiano draws a graphical piano keyboard on the &
&screen that you can play using the mouse.  You can also record and &
&play back tones, and compose data files that can be loaded and played &
&back too.  Sample music data files are included.\r&
&\r&
&The Piano Menu has these options:\r&
&Playback\tPlays all notes in memory (must Record or Load first).\r&
&Load\t\tReads a data file of notes into memory.\r&
&Record\t\tWhen checked, all notes played manually are saved\r&
&\t\t    in memory.  Any notes previously in memory are lost.\r&
&Save\t\tSaves the notes in memory to a data file.\r&
&\r&
&The Keyboard Menu has options to resize the keyboard, or to &
&display it Full Screen.\r&
&\r&
&The Tempo Menu has options that control the speed of Playback:\r&
&Andante\t\tSlow (0.5 times normal speed)\r&
&Moderato\tNormal speed (whole note = 1024 milliseconds)\r&
&Allegro\t\tFast (1.5 times normal speed)\r&
&\r&
&The format of the music data files is described in the comments at the &
&top of each file, and further details can be found in the comments of &
&this program''s code.  The music data files can be viewed and edited &
&with any text editor.'C, &
&'QWPiano Instructions'C, MB$OK)

return
end

!-----------------------------------------------------------------------
