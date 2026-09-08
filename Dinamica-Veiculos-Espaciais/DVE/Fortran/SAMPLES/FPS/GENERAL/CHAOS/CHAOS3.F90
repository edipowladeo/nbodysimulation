SUBROUTINE CHAOS3(A, B, C, D, X1, Y1, X, Y)
!*******************************************************************************
!*																			   *
!*  DESCRIPTION FOR SUBROUTINE CHAOS(A, B, C, D, X1, Y1, X, Y)				   *
!*																			   *
!*	THIS SUBROUTINE CALCULATES POINTS FOR A CHAOTIC EQUATION WITH THREE FOLD   *
!*  SYMETRY TO USE PICK THE COEFFICIENTS A, B, C, D, AND THE INITIAL STARTING  *
!*  POINTS X1 AND Y1.  TO CALCULATE THE NEXT POINT USE X AND Y FROM THE CURRENT*
!*  CALCULATION FOR X1 AND Y1 FOR THE NEXT CALCUATION.  ANY NUMBERS CAN BE USED*
!*  FOR A, B, C, AND D BUT EXPERIMATION IS NEEDED TO PICK THE ONES THAT WILL   *
!*  PRODUCE INTERESTINT IMAGES AND NOT BLOW UP.  THE FOLOWING IS A GOOD 	   *
!*  STARTING PLACE:															   *
!*     A = -1.701															   *
!*     B =  0.910															   *
!*     C = -0.129															   *
!*     D =  0.713															   *
!*     X1 = 0.0106															   *
!*     Y1 =-0.0102															   *
!*																			   *
!*  THE EQUATIONS HAVE BEEN BROKEN UP FOR DEBUGGING PURPOSES.  BE PREPARED TO  *
!*  CALCULATE SEVERAL THOUSANDS TO HUNDREDS OF THOUSANDS OF POINTS TO GENERATE *
!*  GOOD IMAGE. THIS PROGRAM WAS INSPIRED BY THE "MATHEMATICAL RECREATIONS"    *
!*  ARTICAL IN THE DECEMBER 1992 ISSUE OF "SCIENTIFIC AMERICAN"				   *
!*                                                                             *
!*  INPUTS:																	   *
!*			A - CHAOS COEFFICIENT											   *
!*			B - CHAOS COEFFICIENT											   *
!*			C - CHAOS COEFFICIENT											   *
!*			D - CHAOS COEFFICIENT											   *
!*       																	   *
!*  INPUT/OUTPUT:															   *
!*																			   *
!*			X1 - INITIAL/INTERMEDIATE X VALUE								   *
!*			Y1 - INITIAL/INTERMEDIARE Y VALUE								   *
!*			X - X VALUE														   *
!*			Y - Y VALUE														   *
!*																			   *
!*******************************************************************************
  IMPLICIT NONE



  REAL(KIND=4)XA, XB, XC, XD, X1, X, YA, YB, YC, YD, Y1, Y, A, B, C, D
!* CALCULATE X
  XA = A * X1
  XB = B * X1 * (X1**2 + Y1**2)
  XC = C * (X1**3 - (3.00E+00 * X1 * Y1**2))
  XD = D * (X1**2 - Y1**2)
  X = XA + XB + XC + XD

!* CALCUALTE Y
  YA = A * Y1
  YB = B * Y1 * (X1**2 + Y1**2)
  YC = C * ((4.00E+00 * X1**3 * Y1) - Y1**3)
  YD = 2.00E+00 * D * X1 * Y1
  Y = YA + YB + YC - YD

  RETURN
END SUBROUTINE CHAOS3
