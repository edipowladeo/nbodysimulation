C
C Perform a chi-squared goodness-of-fit test.
C
C In this example, a discrete binomial random sample of size 1000 with
C binomial parameter p = 0.3 and binomial sample size 5 is generated
C via routine RNBIN.  Routine RNSET is first used to set the seed.
C One call to CHIGF is made.  Routine BINDF is used to compute the CDF.
C
C Output:
C
C  *** WARNING  ERROR 7 from CHIGF.  An expected value is less than 5.
C
C                      Counts
C       1       2       3       4       5       6
C   170.0   331.0   320.0   148.0    28.0     3.0
C
C                      Expect
C       1       2       3       4       5       6
C   168.1   360.2   308.7   132.3    28.3     2.4
C
C           Contributions to Chi-squared
C       1       2       3       4       5       6
C   0.022   2.359   0.414   1.863   0.004   0.134
C
C
C
C  Chi-squared         4.7963
C  P-value             0.4412
C  Degrees of freedom  5.0000
C
      USE MSIMSLSS, MSIMSL_FREQ => FREQ
C
      INTERFACE 
	  REAL FUNCTION CDF (Y)
	      REAL       Y
	  END FUNCTION
      END INTERFACE
C
      INTEGER    ISEED, NCAT, NDFEST, NELM
      PARAMETER  (ISEED=123457, NCAT=6, NDFEST=0, NELM=1000)
C
      INTEGER    I, IDO, IX(NELM), NOUT
      REAL       CHISQ(NCAT+1), COUNTS(NCAT), CUTP(NCAT-1), DF,
     &           EXPECT(NCAT), FREQ(1), P, RNGE(2), X(NELM)
C
      DATA FREQ/-1.0/, RNGE/0.0, 0.0/
      DATA CUTP/.5, 1.5, 2.5, 3.5, 4.5/
C
      CALL RNSET (ISEED)
C                                  Generate the data
      CALL RNBIN (NELM, 5, 0.3, IX)
      DO 10  I=1, NELM
         X(I) = IX(I)
   10 CONTINUE
C
      IDO = 0
      CALL CHIGF (IDO, CDF, NELM, X, FREQ, NCAT, RNGE, NDFEST, CUTP,
     &            COUNTS, EXPECT, CHISQ, P, DF)
C                                  Print results
      CALL WRRRN ('Counts', 1, NCAT, COUNTS, 1, 0)
      CALL WRRRN ('Expect', 1, NCAT, EXPECT, 1, 0)
      CALL WRRRN ('Contributions to Chi-squared', 1, NCAT, CHISQ, 1, 0)
      CALL UMACH (2, NOUT)
      WRITE (NOUT,99999) CHISQ(NCAT+1), P, DF
99999 FORMAT (///'0Chi-squared       ', F8.4, /, ' P-value           '
     &       , F8.4, /, ' Degrees of freedom', F8.4)
      END
C
      REAL FUNCTION CDF (Y)
      REAL       Y
C
      INTEGER    I
      REAL       BINDF
      EXTERNAL   BINDF
C
      I   = Y
      CDF = BINDF(I,5,0.3)
      RETURN
      END
