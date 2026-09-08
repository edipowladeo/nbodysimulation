SUBROUTINE WASTEPTS(A, B, C, D, X1, Y1, X, Y, IWASTE, ICHAOS)
!******************************************************************************
!*                                                                            *
!*  DESCRIPTION FOR SUBROUTINE WASTEPTS(A, B, C, D, X1, Y1, X, Y, IWASTE,     *
!*                                                             ICHAOS)        *
!*                                                                            *
!*  THIS SUBROUTINE IS USED TO WASTE A GIVEN NUMBER OF POINTS BEFORE THE      *
!*  PLOTTING OF THE CHAOS EQUATION IS STARTED.                                *
!*																			  *
!*  INPUTS:																	  *
!*          A - CHAOS COEFFICIENT											  *
!*          B - CHAOS COEFFICIENT											  *
!*          C - CHAOS COEFFICIENT											  *
!*			D - CHAOS COEFFICIENT											  *
!*			IWASTE - NUMBER OF POINTS TO WASTE								  *
!*			ICHAOS - CHAOS EQUATION NUMBER									  *
!*																			  *
!*  INPUT/OUTPUT:															  *
!*			X1 - INITIAL/INTERMEDIATE X VALUE								  *																			  *
!*			Y1 - INITIAL/INTERMEDIATE Y VALUE								  *
!*			X - X VALUE														  *
!*			Y - Y VALUE														  *
!*																			  *
!*  CALLED BY:																  *
!*																			  *
!*  CALLS:																	  *
!*			CHAOS3, CHAOS4, CHAOS5											  *
!*																			  *
!******************************************************************************
  USE MSFLIB
  IMPLICIT NONE


  REAL(KIND=4)A, B, C, D, X1, Y1, X, Y
  INTEGER(KIND=4)IWASTE, ICHAOS, I, IRET
  CHARACTER(LEN=50)MESSAGE, CAPTION
  CHARACTER(LEN=2)CNUM

  CAPTION = 'CHAOS'C
  WRITE(CNUM,'(A2)')ICHAOS
  MESSAGE =' INVALID CHAOS EQUATION SELECTION '//CNUM//''C 

!* LOOP THRU DESIRED EQUATIONS TO THROW AWAY SOME POINTS
  DO I = 1, IWASTE
!* CHOOSE DESIRED EQUATIONS
    SELECT CASE (ICHAOS)
      CASE (3)
        CALL CHAOS3(A, B, C, D, X1, Y1, X, Y)
      CASE (4)
        CALL CHAOS4(A, B, C, D, X1, Y1, X, Y)
      CASE (5)
        CALL CHAOS5(A, B, C, D, X1, Y1, X, Y)
      CASE DEFAULT
        IRET = MESSAGEBOXQQ(MESSAGE, CAPTION, MB$IDOK)
        RETURN
    END SELECT
    X1 = X
    Y1 = Y
  ENDDO
  RETURN
END SUBROUTINE WASTEPTS
