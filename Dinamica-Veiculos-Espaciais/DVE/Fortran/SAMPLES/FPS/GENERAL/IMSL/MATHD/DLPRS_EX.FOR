C
C Solve a linear programming problem via the revised simplex algorithm.
C
C Output:
C
C    Objective       =    3.5000
C
C    Primal Solution =   0.5000   1.0000
C
C    Dual solution   =   1.0000   0.0000
C
      USE MSIMSLMD
C
      INTEGER    LDA, M, NVAR
      PARAMETER  (M=2, NVAR=2, LDA=M)
C                                  M = number of constraints
C                                  NVAR = number of variables
C
      INTEGER    I, IRTYPE(M), NOUT
      DOUBLE PRECISION A(LDA,NVAR), B(M), C(NVAR), DSOL(M), OBJ,
     &           XLB(NVAR), XSOL(NVAR), XUB(NVAR)

C
C                                  Set values for the following problem
C
C                                  Max 1.0*XSOL(1) + 3.0*XSOL(2)
C
C                                  XSOL(1) + XSOL(2) .LE. 1.5
C                                  XSOL(1) + XSOL(2) .GE. 0.5
C
C                                  0 .LE. XSOL(1) .LE. 1
C                                  0 .LE. XSOL(2) .LE. 1
C
      DATA XLB/2*0.0D0/, XUB/2*1.0D0/
      DATA A/4*1.0D0/, B/1.5D0, .5D0/, C/1.0D0, 3.0D0/
      DATA IRTYPE/1, 2/
C                                  To maximize, C must be multiplied by
C                                  -1.
      CALL DSCAL (NVAR, -1.0D0, C, 1)
C                                  Solve the LP problem.  Since there is
C                                  no range constraint, only B is
C                                  needed.
      CALL DDLPRS (M, NVAR, A, LDA, B, B, C, IRTYPE, XLB, XUB, OBJ,
     &             XSOL, DSOL)
C                                  OBJ must be multiplied by -1 to get
C                                  the true maximum.
      OBJ = -OBJ
C                                  DSOL must be multiplied by -1 for
C                                  maximization.
      CALL DSCAL (M, -1.0D0, DSOL, 1)
C                                  Print results
      CALL UMACH (2, NOUT)
      WRITE (NOUT,99999) OBJ, (XSOL(I),I=1,NVAR), (DSOL(I),I=1,M)
C
99999 FORMAT (//, '   Objective       = ', F9.4, //, '   Primal ',
     &       'Solution =', 2F9.4, //, '   Dual solution   =', 2F9.4)
C
      END
