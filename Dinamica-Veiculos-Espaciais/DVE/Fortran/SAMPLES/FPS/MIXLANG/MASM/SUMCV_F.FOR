CC    SUMCV_F.FOR     FORTRAN Main Program
CC    Test the sumcv function
C     Use the C parameter and VARYING parameter
C
      INTERFACE TO INTEGER FUNCTION sumcv [C, VARYING] (nterms, term)
      INTEGER nterms, term
      END

C
      PROGRAM tsumcv

      INTEGER sumcv
      INTEGER nterms
      INTEGER a, b, c
      DATA a, b, c / 1, 2, 3 /
C
      nterms = 0
      WRITE (*, *) 'Sum of 0 terms is ', sumcv( nterms )
      nterms = 1
      WRITE (*, *) 'Sum of 1 terms is ', sumcv( nterms, a )
      nterms = 2
      WRITE (*, *) 'Sum of 2 terms is ', sumcv( nterms, a, b )
      nterms = 3
      WRITE (*, *) 'Sum of 3 terms is ', sumcv( nterms, a, b, c )
C
      END

