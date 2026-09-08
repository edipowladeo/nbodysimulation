C
C Fit a nonlinear regression model.
C
C This example uses data discussed by Neter, Wasserman, and Kutner
C (1983, pages 475-478).  A nonlinear model is fitted.  The option
C IDERIV = 0 is used.
C
C The user must supply a SUBROUTINE to return the residual, weight,
C and frequency for a single observation at the given value of the
C regression parameter vector.  This subroutine, called EXAMPL here,
C must be declared EXTERNAL in the calling program and must have the
C specified calling sequence.
C
C Output:
C
C THETA =     58.6045   -3.95835E-02
C IRANK =   2  DFE =     13.0000  SSE =     49.4593
C
C           R
C           1        2
C  1      1.9   1139.8
C  2      0.0   1139.7
C
      USE MSIMSLSD
C
      INTERFACE 
	  SUBROUTINE EXAMPL (NPARM, THETA, IOPT, IOBS, FRQ,
     &                   WT, E, DE, IEND)
	      INTEGER    NPARM, IOPT, IOBS, IEND
	      DOUBLE PRECISION THETA(NPARM), FRQ, WT, E, DE(1)
	  END SUBROUTINE
      END INTERFACE
C
      INTEGER    LDR, NOBS, NPARM
      PARAMETER  (NOBS=15, NPARM=2, LDR=NPARM)
C
      INTEGER    IDERIV, IRANK, NOUT
      DOUBLE PRECISION DFE, R(LDR,NPARM), SSE, THETA(NPARM)
C
      DATA THETA/60.0D0, -0.03D0/
C
      CALL UMACH (2, NOUT)
C
      IDERIV = 0
      CALL DRNLIN (EXAMPL, NPARM, IDERIV, THETA, R, LDR, IRANK, DFE,
     &             SSE)
      WRITE (NOUT,*) 'THETA = ', THETA
      WRITE (NOUT,*) 'IRANK = ', IRANK, '  DFE = ', DFE, '  SSE = ',
     &              SSE
      CALL DWRRRN ('R', NPARM, NPARM, R, LDR, 0)
      END
C
      SUBROUTINE EXAMPL (NPARM, THETA, IOPT, IOBS, FRQ, WT, E, DE,
     &                   IEND)
      INTEGER    NPARM, IOPT, IOBS, IEND
      DOUBLE PRECISION THETA(NPARM), FRQ, WT, E, DE(1)
C
      INTEGER    NOBS
      PARAMETER  (NOBS=15)
C
      DOUBLE PRECISION DEXP, XDATA(NOBS), YDATA(NOBS)
      INTRINSIC  DEXP
C
      DATA YDATA/54.0D0, 50.0D0, 45.0D0, 37.0D0, 35.0D0, 25.0D0,
     &     20.0D0, 16.0D0, 18.0D0, 13.0D0, 8.0D0, 11.0D0, 8.0D0, 4.0D0,
     &     6.0D0/
      DATA XDATA/2.0D0, 5.0D0, 7.0D0, 10.0D0, 14.0D0, 19.0D0, 26.0D0,
     &     31.0D0, 34.0D0, 38.0D0, 45.0D0, 52.0D0, 53.0D0, 60.0D0,
     &     65.0D0/
C
      IF (IOBS .LE. NOBS) THEN
         WT   = 1.0D0
         FRQ  = 1.0D0
         IEND = 0
         E    = YDATA(IOBS) - THETA(1)*DEXP(THETA(2)*XDATA(IOBS))
      ELSE
         IEND = 1
      END IF
      RETURN
      END
