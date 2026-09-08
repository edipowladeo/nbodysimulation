C
C Print Kaplan-Meier estimates of survival probabilities in stratified
C samples.
C
C This example issustrates the typical use of KTBLE.  First, routine
C KAPMR is used to compute the survival probabilities.  This is
C followed by a call to KTBLE that performs the printing.  The input
C data is given as:
C
C 143,164,188(2),190,192,206,209,213,216,220,227,230,234,,246,265,
C 304,216*,244*,142,156,163,198,205,232(2),233(4),239,240,261,280(2),
C 296(2),323,204,344
C
C where items marked with an * are right censored; and the frequency
C of each failure time, if different from 1, is given in parenthesis.
C
C Output:
C                     Kaplan Meier Survival Probabilities
C                        For Group Value =      5.00000
C      Number      Number                 Survival     Estimated
C     at risk     Failing        Time  Probability    Std. Error
C          19           1         143      0.94737       0.05123
C          18           1         164      0.89474       0.07041
C          17           2         188      0.78947       0.09353
C          15           1         190      0.73684       0.10102
C          14           1         192      0.68421       0.10664
C          13           1         206      0.63158       0.11066
C          12           1         209      0.57895       0.11327
C          11           1         213      0.52632       0.11455
C          10           1         216      0.47368       0.11455
C           8           1         220      0.41447       0.11452
C           7           1         227      0.35526       0.11243
C           6           1         230      0.29605       0.10816
C           5           1         234      0.23684       0.10145
C           3           1         246      0.15789       0.09343
C           2           1         265      0.07895       0.07279
C           1           1         304      0.00000           NaN
C
C
C
C  Total number in group    =       19
C  Total number failing     =       17
C  Product Limit Likelihood =      -49.1692
C
C
C
C                     Kaplan Meier Survival Probabilities
C                        For Group Value =      7.00000
C      Number      Number                 Survival     Estimated
C     at risk     Failing        Time  Probability    Std. Error
C          21           1         142      0.95238       0.04647
C          20           1         156      0.90476       0.06406
C          19           1         163      0.85714       0.07636
C          18           1         198      0.80952       0.08569
C          16           1         205      0.75893       0.09409
C          15           2         232      0.65774       0.10529
C          13           4         233      0.45536       0.11137
C           9           1         239      0.40476       0.10989
C           8           1         240      0.35417       0.10717
C           7           1         261      0.30357       0.10311
C           6           2         280      0.20238       0.09021
C           4           2         296      0.10119       0.06778
C           2           1         323      0.05060       0.04928
C
C
C
C  Total number in group    =       21
C  Total number failing     =       19
C  Product Limit Likelihood =      -50.4277
C
      USE MSIMSLSD
C
      INTEGER    ICEN, IFRQ, IGRP, IRT, ISRT, LDSPRO, LDX, NCOL, NOBS
      PARAMETER  (ICEN=3, IFRQ=4, IGRP=2, IRT=1, ISRT=0, LDSPRO=33,
     &           LDX=33, NCOL=4, NOBS=33)
C
      INTEGER    NRMISS
      DOUBLE PRECISION SPROB(LDSPRO,2), X(LDX,NCOL)
C
      DATA X/143, 164, 188, 190, 192, 206, 209, 213, 216, 220, 227,
     &     230, 234, 246, 265, 304, 216, 244, 142, 156, 163, 198, 205,
     &     232, 233, 239, 240, 261, 280, 296, 323, 204, 344, 18*5,
     &     15*7, 16*0, 2*1, 13*0, 4*1, 2, 20*1, 2, 4, 3*1, 2*2, 3*1/
C
      CALL DKAPMR (NOBS, NCOL, X, LDX, IRT, IFRQ, ICEN, IGRP, ISRT,
     &             SPROB, LDSPRO, NRMISS)
C
      CALL DKTBLE (NOBS, NCOL, X, LDX, IRT, IFRQ, ICEN, IGRP, ISRT,
     &             SPROB, LDSPRO)
      END
