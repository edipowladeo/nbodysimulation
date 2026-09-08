C
C Integrate a function using a globally adaptive scheme based on
C Gauss-Kronrod rules.
C
C The value of
C                       2
C                      /    x      2
C                      |  xe dx = e +1
C                     /
C                      0
C
C is estimated.  Since the integrand is not oscillatory, IRULE = 1 is
C used.  The values of the actual and estimated error are machine
C dependent.
C
C Output:
C
C  Computed =   8.389              Exact =   8.389
C
C  Error estimate = 5.000E-05      Error = 9.537E-07
C
      USE MSIMSLMS
C
      INTERFACE 
	  REAL FUNCTION F (X)
	      REAL       X
	  END FUNCTION
      END INTERFACE
C
      INTEGER    IRULE, NOUT
      REAL       A, ABS, B, ERRABS, ERREST, ERROR, ERRREL, EXACT, EXP, RESULT
      INTRINSIC  ABS, EXP

C                                  Get output unit number
      CALL UMACH (2, NOUT)
C                                  Set limits of integration
      A = 0.0
      B = 2.0
C                                  Set error tolerances
      ERRABS = 0.0
      ERRREL = 0.001
C                                  Parameter for non-oscillatory
C                                  function
      IRULE = 1
      CALL QDAG (F, A, B, ERRABS, ERRREL, IRULE, RESULT, ERREST)
C                                  Print results
      EXACT = 1.0 + EXP(2.0)
      ERROR = ABS(RESULT-EXACT)
      WRITE (NOUT,99999) RESULT, EXACT, ERREST, ERROR
99999 FORMAT (' Computed =', F8.3, 13X, ' Exact =', F8.3, /, /,
     &       ' Error estimate =', 1PE10.3, 6X, 'Error =', 1PE10.3)
      END
C
      REAL FUNCTION F (X)
      REAL       X
      REAL       EXP
      INTRINSIC  EXP
      F = X*EXP(X)
      RETURN
      END
