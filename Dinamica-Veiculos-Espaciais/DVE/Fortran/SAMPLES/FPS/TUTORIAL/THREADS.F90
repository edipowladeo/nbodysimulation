!======================================================================
!
! Program Bounce
! 
! Illustrates a basic multi-threaded application written in QuickWin.
!

module BounceModule

use msflib
use mt

implicit none

integer, parameter :: MAXTHREADS = 24

integer, parameter :: WINX = 153
integer, parameter :: WINY = 153

type ThreadInfo
	logical Used
	logical Close
	integer	ThreadHandle
end type

type(RTL_CRITICAL_SECTION) DrawLock

integer i

type(ThreadInfo) :: Threads( MAXTHREADS ) = &
		(/ (ThreadInfo( .false., .false., 0 ), i = 1, MAXTHREADS ) /)

contains

subroutine BounceStart()
integer(2) i2

call InitializeCriticalSection( loc(DrawLock) )

i2 = SetExitQQ( QWIN$EXITNOPERSIST )

i2 = ClickQQ( QWIN$STATUS )

call seed( RND$TIMESEED )

call BounceCreate(.false.)
call BounceCreate(.false.)
call BounceCreate(.false.)

call sleepqq( 1000000000 )

end subroutine

subroutine BounceCreate( l )
type(windowconfig) wc
logical l, m
integer i, j
character*20 tstr

do i = 1, MAXTHREADS 
	if( .not. Threads(i)%Used ) exit
end do
if( i > MAXTHREADS ) return

Threads(i)%Used = .true.
Threads(i)%Close = .false.
write(tstr,*) i
tstr = adjustl(tstr)
open( unit=i, file='user' )
wc.numxpixels = WINX
wc.numypixels = WINY
wc.numtextcols = -1
wc.numtextrows = -1
wc.numcolors = -1
wc.fontsize = -1
wc.title = 'Thread '//tstr(1:len_trim(tstr))//char(0)
if( .not. setwindowconfig( wc ) ) stop
Threads(i)%ThreadHandle = CreateThread( 0, 0, BounceProc, %val(i), &
					CREATE_SUSPENDED, j )
m = SetThreadPriority( Threads(i)%ThreadHandle, THREAD_PRIORITY_BELOW_NORMAL )
m = ResumeThread( Threads(i)%ThreadHandle )
return; call unusedqq( l )
end subroutine

recursive subroutine BounceProc( i )
integer i
!ms$attributes value :: i
!automatic
integer, parameter :: SIZE = 15
integer :: x, y, color 
integer(2) i2
integer :: dx, dy, vy, vx, ax, ay

x = 0
y = 0
if( GetRandomVector() <= 3 ) then
	if( GetRandomVector() >= 4 ) then
		vx = 4
	else
		vx = 1
	end if
	vy = GetRandomVector()
else
	if( GetRandomVector() >= 4 ) then
		vy = 4
	else
		vy = 1
	end if
	vx = GetRandomVector()
end if
dx = vx; dy = vy
ax = GetRandomVector() + 3
ay = GetRandomVector() + 3

color = 1
do while( .true. )
	call EnterCriticalSection( loc(DrawLock) )
	if( Threads(i)%Close ) then
		Threads(i)%Used = .FALSE.
		close( i )
		call LeaveCriticalSection( loc(DrawLock) )
		exit
	end if
	i2 = SetActiveQQ( i )
	i2 = setcolor( color )
	i2 = rectangle( $GFILLINTERIOR, x, y, x+SIZE, y+SIZE )
	call LeaveCriticalSection( loc(DrawLock) )
	color = mod( color, 15 )+1

	dx = dx - 1
	if( dx == 0 ) then
		x = x - ax
		dx = vx
	else if( dx == 3 ) then
		x = x + ax
		dx = vx
	end if

	dy = dy - 1
	if( dy == 0 ) then
		y = y - ay
		dy = vy
	else if( dy == 3 ) then
		y = y + ay
		dy = vy
	end if

	if( x < 0 ) then
		x = 0
		if( vx >= 4 ) then
			vx = vx - 3
		else
			vx = vx + 3
		end if
		dx = vx
	end if

	if( x > WINX - SIZE ) then
		x = WINX - SIZE
		if( vx >= 4 ) then
			vx = vx - 3
		else 
			vx = vx + 3
		end if
		dx = vx
	end if

	if( y < 0 ) then
		y = 0
		if( vy >= 4 ) then
			vy = vy - 3
		else
			vy = vy + 3
		end if
		dy = vy
	end if

	if( y > WINY - SIZE ) then
		y = WINY - SIZE
		if( vy >= 4 ) then
			vy = vy - 3
		else
			vy = vy + 3
		end if
		dy = vy
	end if			
end do

contains
	integer function GetRandomVector()
		automatic
		real rand
		call random( rand )
		GetRandomVector = int((rand * 6.0) + 1.0)
	end function
end subroutine

subroutine BounceExit( l )
logical l
call exit(0)
return; call unusedqq(l)
end subroutine

subroutine BounceDelete( l )
logical l
integer :: i, j, last
last = -1

call EnterCriticalSection( loc(DrawLock) )
j = InQFocusQQ( i )
if( j == 0 ) then
	do j = 1, MAXTHREADS 
		if( Threads(j)%Used .and. j /= i ) last = j
	end do
	if( last /= -1 ) Threads(i)%Close = .TRUE.
end if
call LeaveCriticalSection( loc(DrawLock) )
return; call unusedqq(l,i)
end subroutine

end module

program Bounce
use BounceModule
call BounceStart()
end 

logical function InitialSettings()
use BounceModule
logical result

result = AppendMenuQQ( 1, $MENUENABLED, '&Exit'C, BounceExit )

result = AppendMenuQQ( 2, $MENUENABLED, '&CreateThread'C, BounceCreate )

result = AppendMenuQQ( 3, $MENUENABLED, '&DeleteThread'C, BounceDelete )

result = AppendMenuQQ( 4, $MENUENABLED, '&Window'C, NUL )
result = AppendMenuQQ( 4, $MENUENABLED, '&Cascade'C, WINCASCADE )
result = AppendMenuQQ( 4, $MENUENABLED, '&Tile'C, WINTILE )
result = SetWindowMenuQQ( 4 )

InitialSettings = .true.

end function
