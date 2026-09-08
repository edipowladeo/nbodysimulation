SUBROUTINE MINMAXC(A, B, C, D, X1, Y1, X, Y, IMINMAX, SCALMM, LROTAT, XMINA, XMAXA, YMINA, YMAXA,    &
                   ICHAOS, YTEMP, XMAX, XMIN, YMAX, YMIN)
!******************************************************************************
!*                                                                            *
!*  DESCRIPTION FOR SUBROUTINE MINMAXC(A, B, C, D, X1, Y1, X, Y, IMINMAX,     *
!*                                        SCALMM, LROTAT, XMINA, XMAXA, YMINA,*
!*                                        YMAXA, ICHAOS, YTEMP, XMAX, XMIN,   *
!*                                        YMAX, YMIN)                         *
!*                                                                            *
!*  THIS SUBROUTINE IS USED TO CALCULATE A PREDERMINED NUMBWER OF POINTS FOR  *
!*  THE PURPOSE OF DETERMININF MIN AND MAX VALUES FOR PLOTTING                *
!*                                                                            *
!******************************************************************************



  IMPLICIT NONE


  REAL(KIND=4)A, B, C, D, X1, Y1, X, Y, SCALMM, XMINA, XMAXA, YMINA, YMAXA, XMAX, XMIN, YMIN, YMAX, &
              YTEMP, XMINB, XMAXB, YMAXB, YMINB
  INTEGER(KIND=4)I, IMINMAX, ICHAOS
  LOGICAL(KIND=4) LROTAT

!* INITIALIZE MIN AND MAX VARIABLES
!* INITIALIZE MIN AND MAX VARIABLES
  XMAX = -100000.00E+00
  XMIN = 100000.00D+00
  YMAX = -100000.00E+00
  YMIN = 100000.00D+00

!* CALCULATE THE NEXT IMINMAX POINTS TO DETERMINE MINIMUM AND MAXIMUM OF FUNCTION
  DO I = 1, IMINMAX
!* CHOSE DESIRED EQUATIONS
    SELECT CASE (ICHAOS)
      CASE (3)
        CALL CHAOS3(A, B, C, D, X1, Y1, X, Y)
      CASE (4)
        CALL CHAOS4(A, B, C, D, X1, Y1, X, Y)
      CASE (5)
        CALL CHAOS5(A, B, C, D, X1, Y1, X, Y)
      CASE DEFAULT
        WRITE(*,*)' INVALID EQUATION CHOISE ',ICHAOS
        RETURN
    END SELECT
    IF(X .GT. XMAX) XMAX = X
    IF(X .LT. XMIN) XMIN = X
    IF(Y .GT. YMAX) YMAX = Y
    IF(Y .LT. YMIN) YMIN = Y
    X1 = X
    Y1 = Y
  ENDDO

!* SCAL MAX AND MIN VALUES TO MAKE SURE THAT THEY ARNT EXCEEDED\
  XMAX = XMAX * SCALMM
  XMIN = XMIN * SCALMM
  YMAX = YMAX * SCALMM
  YMIN = YMIN * SCALMM
  IF(LROTAT)THEN
!* MAKE XMAX 0.00 AND XMIN DIFFERENT
    XMINB = XMIN - XMAX
    XMAXB = -XMINB
!* CHANGE Y
    YTEMP = (YMAX + YMIN)/2.00E+00
    YMINB = YMIN - YTEMP
    YMAXB = YMAX - YTEMP

    YMAXA = MAX(YMAXB, XMAXB) * SCALMM
    XMAXA = MAX(YMAXB, XMAXB) * SCALMM
    YMINA = -MAX(YMAXB, XMAXB) * SCALMM
    XMINA = -MAX(YMAXB, XMAXB) * SCALMM
  ELSE
    XMINA = XMIN
    YMINA = YMIN
    XMAXA = XMAX
    YMAXA = YMAX
  ENDIF

  RETURN
END



