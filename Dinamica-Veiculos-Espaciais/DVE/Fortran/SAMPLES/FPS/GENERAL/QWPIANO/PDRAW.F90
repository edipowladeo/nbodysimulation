!-----------------------------------------------------------------------
!
!  PDRAW.F90 - Drawing and Keyboard menu subroutines for QWPIANO
!
!  Routines in this source file:
!    DrawKeyboard = Draw the keyboard
!    Bigger       = Increase scale and redraw the keyboard
!    Smaller      = Decrease scale and redraw the keyboard
!    Highlight    = Color a key to show if it is pressed or released
!
!-----------------------------------------------------------------------

SUBROUTINE DrawKeyboard()

USE MSFLIB
USE PIANOMOD

INTEGER(2)     i2, x1, x2
INTEGER(4)     i4, key, EbonyKeys(20)
TYPE (qwinfo)  qw

! This array indicates which white keys have black keys between them.
DATA EbonyKeys /  1,  3,  4,  6,  7,  8, 10, 11, 13, 14, &
                 15, 17, 18, 20, 21, 22, 24, 25, 27, 28 /

! Clear the screen to the background color.
i4 = setbkcolor(BackColor)
call clearscreen($GCLEARSCREEN)

! Set the size of the application's frame window.
qw.type = QWIN$SET
qw.x    = 0
qw.y    = 0
qw.h    = 10*scale+70
qw.w    = 31*scale+35
i4 = setwsizeqq(QWIN$FRAMEWINDOW, qw)

! Since this program only uses one child window, maximize it.
qw.type = QWIN$MAX
i4 = setwsizeqq(KeyUnit, qw)

! Draw a single big block for the white keys.
i2 = setcolor(Ivory)
i4 = rectangle($GFILLINTERIOR, scale-1, scale-1, 30*scale+1, 8*scale+1)

! Delimit the white keys using the background color.
i2 = setcolor(BackColor)
do key = 1,29
  i4 = rectangle($GBORDER, key*scale, scale, (key+1)*scale, 8*scale)
end do

! Draw the black keys over the white ones where appropriate.
i2 = setcolor(Ebony)
do key = 1, 20
  x1 = (EbonyKeys(key)+1) * scale - third
  x2 = (EbonyKeys(key)+1) * scale + third
  i4 = rectangle($GFILLINTERIOR, x1, scale, x2, 5*scale)
end do

return
end

!-----------------------------------------------------------------------

SUBROUTINE Bigger(checked)

USE MSFLIB
USE PIANOMOD

LOGICAL(4)  checked

! This routine simply increases the global size variables and redraws
! the keyboard.  You can change the amount of increase by changing the
! constant values in the following equations.

scale = scale + 3
third = scale / 3

! Just in case the Smaller routine's menu item had been grayed out,
! enable it, since we know that because we're getting one size bigger
! here, we can always go at least one size smaller.
checked = modifymenuflagsqq(2, 2, $MENUENABLED)

! Then, if we're now at the maximum size limit, gray out this routine's
! menu item so that it can't be called again until the Smaller routine
! is called at least once.
if (scale >= 30) checked = modifymenuflagsqq(2, 1, $MENUGRAYED)

! Redraw the keyboard.
call DrawKeyboard()

return
end

!-----------------------------------------------------------------------

SUBROUTINE Smaller(checked)

USE MSFLIB
USE PIANOMOD

LOGICAL(4)  checked

! This routine simply decreases the global size variables and redraws
! the keyboard.  You can change the amount of decrease by changing the
! constant values in the following equations.

scale = scale - 3
third = scale / 3

! Just in case the Bigger routine's menu item had been grayed out,
! enable it, since we know that because we're getting one size smaller
! here, we can always go at least one size bigger.
checked = modifymenuflagsqq(2, 1, $MENUENABLED)

! Then, if we're now at the minimum size limit, gray out this routine's
! menu item so that it can't be called again until the Bigger routine
! is called at least once.
if (scale <= 9) checked = modifymenuflagsqq(2, 2, $MENUGRAYED)

! Redraw the keyboard.
call DrawKeyboard()

return
end

!-----------------------------------------------------------------------

SUBROUTINE Highlight(note, pressed)

USE MSFLIB
USE PIANOMOD

LOGICAL(4)    pressed
INTEGER(4)    note, i4, hold
INTEGER(2)    i2

! This routine colors the interior of a key.  The color is determined by
! the color of the key, and whether it is being pressed or not (in which
! case we are actually cancelling a previous highlight).

! Highlight is called from either KeyboardControl or Playback.

hold = note

if (pressed) then
  if (note < 100) then
    i2 = setcolor(Ivorydown)
  else
    i2 = setcolor(Ebonydown)
  end if
else
  if (note < 100) then
    i2 = setcolor(Ivory)
  else
    i2 = setcolor(Ebony)
  end if
end if

if (note < 100) then
  i4 = rectangle($GFILLINTERIOR, scale* note   +2,   scale*5+2, &
                                 scale*(note+1)-2,   scale*8-2)
else
  note = note - 99
  i4 = rectangle($GFILLINTERIOR, scale*note-third+2, scale  +2, &
                                 scale*note+third-2, scale*5-2)
end if

note = hold

return
end

!-----------------------------------------------------------------------
