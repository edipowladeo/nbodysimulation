C
C Solve a real general system of linear equations with iterative
C refinement.
C
C A system of three linear equations is solved.  The coefficient
C matrix has real general form and the right-hand-side vector b has
C three elements.
C
C Output:
C
C             X
C       1       2       3
C   1.000   1.500   1.000
C
      USE MSIMSLMS
C                                  Declare variables
      PARAMETER  (IPATH=1, LDA=3, N=3)
      REAL       A(LDA,LDA), B(N), X(N)
C
C                                  Set values for A and B
C
C                                  A = ( 33.0  16.0  72.0)
C                                      (-24.0 -10.0 -57.0)
C                                      ( 18.0 -11.0   7.0)
C
C                                  B = (129.0 -96.0   8.5)
C
      DATA A/33.0, -24.0, 18.0, 16.0, -10.0, -11.0, 72.0, -57.0, 7.0/
      DATA B/129.0, -96.0, 8.5/
C
      CALL LSARG (N, A, LDA, B, IPATH, X)
C                                  Print results
      CALL WRRRN ('X', 1, N, X, 1, 0)
      END
