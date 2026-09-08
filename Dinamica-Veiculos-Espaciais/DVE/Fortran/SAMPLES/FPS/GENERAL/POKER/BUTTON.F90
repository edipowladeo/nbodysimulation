!**********************************************************************
!
! POKER -- Video Poker in Fortran 90 with QuickWin
!
! Copyright (C) 1995 Microsoft Corporation, All Rights Reserved.
!

module ButtonMod

use msflib
implicit none

private
type button
	private
	integer :: buttonx, buttony
	integer :: buttonxsize, buttonysize
end type
public Button, ButtonInit, ButtonWord, ButtonHit, ButtonPress

contains

subroutine ButtonInit(btn,x,y,sx,sy,str)
type(button) btn
integer x, y, sx, sy
type(xycoord) s
character*(*), optional :: str
integer i

btn%buttonx = x; btn%buttony = y
btn%buttonxsize = sx; btn%buttonysize = sy

i = setcolor(7)
i = rectangle( $GFILLINTERIOR, btn%buttonx, btn%buttony, &
	       btn%buttonx+btn%buttonxsize, btn%buttony+btn%buttonysize )
call ButtonPress( btn, .false. )
i = setcolor(0)
call moveto( btn%buttonx-2, btn%buttony-3, s )
i = lineto( btn%buttonx+btn%buttonxsize+2, btn%buttony-3 )
call moveto( btn%buttonx-3, btn%buttony-2, s )
i = lineto( btn%buttonx-3, btn%buttony+btn%buttonysize+2 )
call moveto( btn%buttonx-2, btn%buttony+btn%buttonysize+3, s )
i = lineto( btn%buttonx+btn%buttonxsize+2, btn%buttony+btn%buttonysize+3 )
call moveto( btn%buttonx+btn%buttonxsize+3, btn%buttony-2, s )
i = lineto( btn%buttonx+btn%buttonxsize+3, btn%buttony+btn%buttonysize+2 )
if( present( str ) ) then
	call ButtonWord(btn, str)
end if

end subroutine

subroutine ButtonWord( btn, str )
type( button ) btn
character*(*) str
type(xycoord) s
integer i

i = setcolor(7)
i = rectangle( $GFILLINTERIOR, btn%buttonx, btn%buttony, &
	       btn%buttonx+btn%buttonxsize, btn%buttony+btn%buttonysize )
i = setfont("t'Arial'h16be")
i = setcolor(0)
call moveto( btn%buttonx+(btn%buttonxsize/2)- &
		(getgtextextent(str(1:len_trim(str)))/2), &
	     btn%buttony+1, s )
call outgtext( str(1:len_trim(str)) )

end subroutine

logical function ButtonHit( btn, x, y )
type( button ) btn
integer x, y
ButtonHit = (x >= btn%buttonx-3 .and. x <= btn%buttonx+btn%buttonxsize+3 .and. &
	     y >= btn%buttony-3 .and. y <= btn%buttony+btn%buttonysize+3)
end function

subroutine ButtonPress( btn, InLogical )
type( button ) btn
logical InLogical
integer In, i
integer, parameter :: Color(0:1) = (/ 15, 8 /)
record /xycoord/ s

In = InLogical
i = setcolor(Color(In))
call moveto( btn%buttonx-1, btn%buttony-1, s )
i = lineto( btn%buttonx-1, btn%buttony+btn%buttonysize )
call moveto( btn%buttonx-1, btn%buttony-1, s )
i = lineto( btn%buttonx+btn%buttonxsize, btn%buttony-1 )
call moveto( btn%buttonx-2, btn%buttony-2, s )
i = lineto( btn%buttonx-2, btn%buttony+btn%buttonysize+1 )
call moveto( btn%buttonx-2, btn%buttony-2, s )
i = lineto( btn%buttonx+btn%buttonxsize+1, btn%buttony-2 )
i = setcolor(Color(ieor(In,1)))
call moveto( btn%buttonx-1, btn%buttony+btn%buttonysize+1, s )
i = lineto( btn%buttonx+btn%buttonxsize, btn%buttony+btn%buttonysize+1 )
call moveto( btn%buttonx-2, btn%buttony+btn%buttonysize+2, s )
i = lineto( btn%buttonx+btn%buttonxsize, btn%buttony+btn%buttonysize+2 )
call moveto( btn%buttonx+btn%buttonxsize+1, btn%buttony-1, s )
i = lineto( btn%buttonx+btn%buttonxsize+1, btn%buttony+btn%buttonysize+2 )
call moveto( btn%buttonx+btn%buttonxsize+2, btn%buttony-2, s )
i = lineto( btn%buttonx+btn%buttonxsize+2, btn%buttony+btn%buttonysize+2 )

end subroutine

end module ButtonMod


