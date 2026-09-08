C
C Perform a linear or a quadratic discriminant function analysis among
C several known groups.
C
C This example uses linear discrimination with equal prior probabilities
C on Fisher's (1936) iris data.  This example illustrates the execution
C of DSCRM when one call is made.
C
C Output:
C
C  PRIOR, the prior probabilities
C           1        2        3
C      0.3333   0.3333   0.3333
C
C  NI, the number in each group
C            1    2    3
C           50   50   50
C
C       XMEAN, the group means
C          1       2       3       4
C  1   5.006   3.428   1.462   0.246
C  2   5.936   2.770   4.260   1.326
C  3   6.588   2.974   5.552   2.026
C
C  The pooled within-groups covariance matrix
C              1        2        3        4
C     1   0.2650   0.0927   0.1675   0.0384
C     2   0.0927   0.1154   0.0552   0.0327
C     3   0.1675   0.0552   0.1852   0.0427
C     4   0.0384   0.0327   0.0427   0.0419
C
C  COEF, the discriminant function coefficients
C            1       2       3       4       5
C    1   -86.3    23.5    23.6   -16.4   -17.4
C    2   -72.9    15.7     7.1     5.2     6.4
C    3  -104.4    12.4     3.7    12.8    21.1
C
C ICLASS, the classifications
C
C   Obs.  Class
C
C      1     1
C      2     1
C      3     1
C      4     1
C      5     1
C      6     1
C         .
C         .
C         .
C    145     3
C    146     3
C    147     3
C    148     3
C    149     3
C    150     3
C
C  PROB, the posterior probabilities
C               1       2       3
C       1   1.000   0.000   0.000
C       2   1.000   0.000   0.000
C       3   1.000   0.000   0.000
C       4   1.000   0.000   0.000
C       5   1.000   0.000   0.000
C       6   1.000   0.000   0.000
C                 .
C                 .
C                 .
C     145   0.000   0.000   1.000
C     146   0.000   0.000   1.000
C     147   0.000   0.006   0.994
C     148   0.000   0.003   0.997
C     149   0.000   0.000   1.000
C     150   0.000   0.018   0.982
C
C  CLASS, the classification table
C             1       2       3
C     1   50.00    0.00    0.00
C     2    0.00   48.00    2.00
C     3    0.00    1.00   49.00
C
C  D2, the distances between group means
C                1       2       3
C        1     0.0    89.9   179.4
C        2    89.9     0.0    17.2
C        3   179.4    17.2     0.0
C
C                                       STAT
C       1       2       3       4       5       6       7       8       9      10
C   147.0     NaN     NaN     NaN     NaN     NaN     NaN   -10.0    50.0    50.0
C
C      11      12
C    50.0   150.0
C
C  NRMISS, number of missing observations =   0
C
      USE MSIMSLSD
C
      INTEGER    IDO, IFRQ, IGRP, IMTH, IPRINT, IWT, LDCLAS, LDCOEF,
     &           LDCOV, LDD2, LDPROB, LDX, LDXMEA, NCOL, NGROUP, NROW,
     &           NVAR
      PARAMETER  (IDO=0, IFRQ=0, IGRP=1, IMTH=3, IPRINT=1, IWT=0,
     &           LDCOV=4, NCOL=5, NGROUP=3, NROW=150, NVAR=4,
     &           LDCLAS=NGROUP, LDCOEF=NGROUP, LDD2=NGROUP,
     &           LDPROB=NROW, LDX=NROW, LDXMEA=NGROUP)
C
      INTEGER    ICLASS(NROW), IND(4), NI(NGROUP), NOBS, NRMISS, NV
      DOUBLE PRECISION CLASS(LDCLAS,NGROUP), COEF(LDCOEF,NVAR+1),
     &           COV(LDCOV,LDCOV,1), D2(LDD2,NGROUP), PRIOR(3),
     &           PROB(LDPROB,NGROUP), STAT(6+2*NGROUP), X(LDX,5),
     &           XMEAN(LDXMEA,NVAR)
C
      DATA IND/2, 3, 4, 5/, PRIOR/0.3333333D0, 0.3333333D0, 0.3333333D0/
C
      CALL DGDATA (3, 0, NOBS, NV, X, LDX, 5)
C
      CALL DDSCRM (IDO, NROW, NVAR, NCOL, X, LDX, IND, IFRQ, IWT, IGRP,
     &             NGROUP, IMTH, IPRINT, PRIOR, NI, XMEAN, LDXMEA, COV,
     &             LDCOV, COEF, LDCOEF, ICLASS, PROB, LDPROB, CLASS,
     &             LDCLAS, D2, LDD2, STAT, NRMISS)
C
      END
