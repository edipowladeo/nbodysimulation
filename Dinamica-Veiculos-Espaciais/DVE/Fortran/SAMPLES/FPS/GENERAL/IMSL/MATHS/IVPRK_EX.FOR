C
C Solve an initial-value problem for ordinary differential equations
C using the Runge-Kutta-Verner fifth-order and sixth-order method.
C
C Consider a predator-prey problem with rabbits and foxes.  Let r be
C the density of rabbits and let f be the density of foxes.  In the
C absence of any predator-prey interaction, the rabbits would increase
C at a rate proportional to their number, and the foxes would die of
C starvation at a rate proportional to their number.  Mathematically,
C
C                     r' = 2r
C                     f' = -f
C
C The rate at which the rabbits are eaten by the foxes is 2rf, and the
C rate at which the foxes increase, because they are eating the rabbits,
C is rf.  So, the model to be solved is
C
C                     r' = 2r - 2rf
C                     f' = -f + rf
C
C The initial conditions are r(0) = 1 and f(0) = 3 over the interval
C 0 <= t <= 10.
C
C In the program Y(1) = r and Y(2) = f.  Note that the parameter vector
C PARAM is first set to zero with IMSL routine SSET.  Then, absolute
C error control is selected by setting PARAM(10) = 1.0.
C
C The last call to IVPRK with IDO = 3 deallocates IMSL workspace
C allocated on the first call to IVPRK.
C
C Output:
C
C     ISTEP     Time         Y1           Y2
C      1       1.000       0.078       1.465
C      2       2.000       0.085       0.578
C      3       3.000       0.292       0.250
C      4       4.000       1.449       0.187
C      5       5.000       4.046       1.444
C      6       6.000       0.176       2.256
C      7       7.000       0.066       0.908
C      8       8.000       0.148       0.367
C      9       9.000       0.655       0.188
C     10      10.000       3.157       0.352
C
      USE MSIMSLMS
C
      INTERFACE 
	  SUBROUTINE FCN (N, T, Y, YPRIME)
	      INTEGER    N
	      REAL       T, Y(N), YPRIME(N)
	  END SUBROUTINE
      END INTERFACE
C
      INTEGER    MXPARM, N
      PARAMETER  (MXPARM=50, N=2)
C                                  SPECIFICATIONS FOR LOCAL VARIABLES
      INTEGER    IDO, ISTEP, NOUT
      REAL       PARAM(MXPARM), T, TEND, TOL, Y(N)
C                                  SPECIFICATIONS FOR SUBROUTINES
      CALL UMACH (2, NOUT)
C                                  Set initial conditions
      T = 0.0
      Y(1) = 1.0
      Y(2) = 3.0
C                                  Set error tolerance
      TOL = 0.0005
C                                  Set PARAM to default
      CALL SSET (MXPARM, 0.0, PARAM, 1)
C                                  Select absolute error control
      PARAM(10) = 1.0
C                                  Print header
      WRITE (NOUT,99999)
      IDO = 1
      ISTEP = 0
   10 CONTINUE
      ISTEP = ISTEP + 1
      TEND = ISTEP
      CALL IVPRK (IDO, N, FCN, T, TEND, TOL, PARAM, Y)
      IF (ISTEP .LE. 10) THEN
         WRITE (NOUT,'(I6,3F12.3)') ISTEP, T, Y
C                                  Final call to release workspace
         IF (ISTEP .EQ. 10) IDO = 3
         GO TO 10
      END IF
99999 FORMAT (4X, 'ISTEP', 5X, 'Time', 9X, 'Y1', 11X, 'Y2')
      END
      SUBROUTINE FCN (N, T, Y, YPRIME)
C                                  SPECIFICATIONS FOR ARGUMENTS
      INTEGER    N
      REAL       T, Y(N), YPRIME(N)
C
      YPRIME(1) = 2.0*Y(1) - 2.0*Y(1)*Y(2)
      YPRIME(2) = -Y(2) + Y(1)*Y(2)
      RETURN
      END
