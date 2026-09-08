	program fspline
	integer numpoints, maxpoints
	parameter( maxpoints = 1000 )
	real px(maxpoints), py(maxpoints)

!ms$if defined(FILEFROMUSER)
	open( 1, file=' ' )
!ms$else
	open( 1, file='fspline.dat' )
!ms$endif
	read(1,*) numpoints
	print *,'>> Input: (number of points=',numpoints,')'
	do i = 1, numpoints 
		read(1,*) px(i), py(i)
		print *,px(i),py(i)
	end do
	close( 1 )

	print *,'>> Output Spline:'
	call SplineCalculate( px, py, numpoints )
	do i = px(1), px(numpoints)
		call SplineEvaluate( real(i), evaly )
		print *,i,evaly
	end do

	! Pause and let the user read the output
	pause

	end
