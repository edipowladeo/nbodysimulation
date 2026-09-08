!
! Program Celsius Table: Prints simple Fahrenheit-Celsius table
!
	program celsius_table
	implicit none
	real Fahrenheit, Celsius

	print *,'  Fahrenheit     Celsius'	
	print *,'--------------------------'
	do Fahrenheit = 30, 220, 10
		Celsius = (5.0/9.0) * (Fahrenheit-32.0)
		print '(F13.0,F12.3)',Fahrenheit,Celsius
	end do
	end
