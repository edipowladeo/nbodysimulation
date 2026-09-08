SUBROUTINE CHAOS5(A, B, C, D, X1, Y1, X, Y)
!*******************************************************************************
!*																			   *
!*  DESCRIPTION FOR SUBROUITINE CHAOS5(A, B, C, D, X1, Y1, X, Y)               *
!*																			   *
!*  THIS SUBROUTINE CALCULATES POINTS FOR A CHAOTIC EQUATION WITH FIVE FOLD    *
!*  SYMETRY TO USE PICK THE COEFFICIENTS A, B, C, D, AND THE INITIAL STARTING  *
!*  POINTS X1 AND Y1.  TO CALCULATE THE NEXT POINT USE X AND Y FROM THE CURRENT*
!*  CALCULATION FOR X1 AND Y1 FOR THE NEXT CALCUATION.  ANY NUMBERS CAN BE USED*
!*  FOR A, B, C, AND D BUT EXPERIMATION IS NEEDED TO PICK THE ONES THAT WILL   *
!*  PRODUCE INTERESTINT IMAGES AND NOT BLOW UP.  THE FOLOWING IS A GOOD        *
!*  STARTING PLACE:															   *
!*																			   *
!*     A = -1.61															   *
!*     B =  0.93															   *
!*     C =  0.25															   *
!*     D =  0.713															   *
!*     X1 = 0.0106															   *
!*     Y1 =-0.0102															   *
!*																			   *
!*  THE EQUATIONS HAVE BEEN BROKEN UP FOR DEBUGGING PURPOSES.  BE PREPARED TO  *
!*  CALCULATE SEVERAL THOUSANDS TO HUNDREDS OF THOUSANDS OF POINTS TO GENERATE *
!*  A GOOD IMAGE. THIS PROGRAM WAS INSPIRED BY THE "MATHEMATICAL RECREATIONS"  *
!*  ARTICAL IN THE DECEMBER 1992 ISSUE OF "SCIENTIFIC AMERICAN"                *
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


  REAL(KIND=4)A, B, C, D, XA, XB, XC, XD, YA, YB, YC, YD, X1, Y1, X, Y

! CALCUALTE X
  XA = A*X1
  XB = B*X1*(X1**2+Y1**2)
  XC = C*(X1**5 - (10.00E+00*X1**3*Y1**2) + (5.00E+00*X1*Y1**4))
  XD = D*(X1**4 - (6.00E+00*X1**2*Y1**2) + Y1**4)
  X = XA + XB + XC + XD

! CALCULATE Y
  YA = A*Y1
  YB = B*Y1*(X1**2+Y1**2)
  YC = C*((5.00E+00*X1**4*Y1) - (10.00E+00*X1**2*Y1**3) + Y1**5)
  YD = D*((-4.00E+00*X1**3*Y1) + (4.00E+00*X1*Y1**3))
  Y = YA + YB + YC + YD

  RETURN
END SUBROUTINE CHAOS5
