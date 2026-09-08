C
C Generate pseudorandom numbers from a standard exponential
C distribution.
C
C In this example, RNEXP is used to generate five pseudorandom deviates
C from a standard exponential distribution.
C
C Output:
C
C     Exponential random deviates:   0.0344  1.3443  0.2662  0.5633  0.1686
C
      USE MSIMSLSD
C
      INTEGER    ISEED, NOUT, NR
      DOUBLE PRECISION R(5)
C
      CALL UMACH (2, NOUT)
      NR    = 5
      ISEED = 123457
      CALL RNSET (ISEED)
      CALL DRNEXP (NR, R)
      WRITE (NOUT,99999) R
99999 FORMAT ('    Exponential random deviates: ', 5F8.4)
      END
