module fspline
use msflib
implicit none

integer, parameter :: maxpoints = 1000
real(4) px(maxpoints), py(maxpoints)
integer :: numpoints

contains

subroutine FsplineGo()
integer i
type(qwinfo) qwi

numpoints = 0

i = setbkcolor(15)
call ClearScreen( $GCLEARSCREEN )
qwi.type = QWIN$MAX
i = SetWSizeQQ( 0, qwi )

i =  registermouseevent( 0, MOUSE$LBUTTONDOWN.or.MOUSE$RBUTTONDOWN, PointEvent )

do while (.true.)
	call sleepqq( 100000000 )
end do

end subroutine

subroutine PointEvent( unit, me, ks, x, y )
integer unit, me, ks, x, y

	select case( me )
		case( MOUSE$LBUTTONDOWN )
			if( numpoints > 0 .and. numpoints < maxpoints ) then
				if( x > px(numpoints) ) then
					numpoints = numpoints + 1
					px(numpoints) = x
					py(numpoints) = y
					call redraw()
				else
					call beepqq( 100, 100 )
				endif
			else if( numpoints == 0 ) then
				numpoints = numpoints + 1
				px(numpoints) = x
				py(numpoints) = y			
				call redraw()
			else
				call beepqq( 100, 100 )
			endif
		case( MOUSE$RBUTTONDOWN )
			if( numpoints > 0 ) then
				numpoints = numpoints - 1
				call redraw()
			else
				call beepqq( 100, 100 )
			endif
	end select
end subroutine

subroutine Redraw()
type(xycoord) s
integer i, j
real evaly

call ClearScreen( $GCLEARSCREEN )

if( numpoints > 1 ) then
	j = setcolor(0_2)
	call moveto( int2(px(1)), int2(py(1)), s )
	do i = 2, numpoints
		j = lineto( int2(px(i)), int2(py(i)) )
	end do
endif 

if( numpoints > 2 ) then
	j = setcolor(12_2)
	call SplineCalculate( px, py, numpoints )
	call SplineEvaluate( px(1), evaly )
	call moveto( int2(px(1)), int2(evaly+0.5), s )
	do i = int(px(1)), int(px(numpoints))-1
		call SplineEvaluate( real(i), evaly ) 
		j = lineto( int2(i), int2(evaly+0.5) )
	end do
endif

end subroutine

end module

program go
use fspline
call FsplineGo()
end

