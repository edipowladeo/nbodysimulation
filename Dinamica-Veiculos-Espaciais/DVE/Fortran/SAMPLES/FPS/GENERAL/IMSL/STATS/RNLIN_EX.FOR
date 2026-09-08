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
      USE MSIMSLSS
C
      INTERFACE 
	   SUBROUTINE EXAMPL (NPARM, THETA, IOPT, IOBS, FRQ, 
     &                        WT, E, DE, IEND)
   	       INTEGER    NPARM, IOPT, IOBS, IEND
	       REAL       THETA(NPARM), FRQ, WT, E, DE(1)
	   END SUBROUTINE
      END INTERFACE
C
      INTEGER    LDR, NOBS, NPARM
      PARAMETER  (NOBS=15, NPARM=2, LDR=NPARM)
C
      INTEGER    IDERIV, IRANK, NOUT
      REAL       DFE, R(LDR,NPARM), SSE, THETA(NPARM)
C
      DATA THETA/60.0, -0.03/
C
      CALL UMACH (2, NOUT)
C
      IDERIV = 0
      CALL RNLIN (EXAMPL, NPARM, IDERIV, THETA, R, LDR, IRANK, DFE,
     &            SSE)
      WRITE (NOUT,*) 'THETA = ', THETA
      WRITE (NOUT,*) 'IRANK = ', IRANK, '  DFE = ', DFE, '  SSE = ',
     &              SSE
      CALL WRRRN ('R', NPARM, NPARM, R, LDR, 0)
      END
C
      SUBROUTINE EXAMPL (NPARM, THETA, IOPT, IOBS, FRQ, WT, E, DE,
     &                   IEND)
      INTEGER    NPARM, IOPT, IOBS, IEND
      REAL       THETA(NPARM), FRQ, WT, E, DE(1)
C
      INTEGER    NOBS
      PARAMETER  (NOBS=15)
C
      REAL       EXP, XDATA(NOBS), YDATA(NOBS)
      INTRINSIC  EXP
C
      DATA YDATA/54.0, 50.0, 45.0, 37.0, 35.0, 25.0, 20.0, 16.0, 18.0,
     &     13.0, 8.0, 11.0, 8.0, 4.0, 6.0/
      DATA XDATA/2.0, 5.0, 7.0, 10.0, 14.0, 19.0, 26.0, 31.0, 34.0,
     &     38.0, 45.0, 52.0, 53.0, 60.0, 65.0/
C
      IF (IOBS .LE. NOBS) THEN
         WT   = 1.0E0
         FRQ  = 1.0E0
         IEND = 0
         E    = YDATA(IOBS) - THETA(1)*EXP(THETA(2)*XDATA(IOBS))
      ELSE
         IEND = 1
      END IF
      RETURN
      END
