C
C Compute basic univariate statistics.
C
C This example uses data from Draper and Smith (1981).  There are 5
C variables and 13 observations.
C
C Output:
C
C                         Univariate Statistics from UVSTA
C
C  Variable          Mean      Variance     Std. Dev.      Skewness      Kurtosis
C      1           7.4615       34.6026        5.8824       0.68768       0.07472
C      2          48.1538      242.1410       15.5609      -0.04726      -1.32257
C      3          11.7692       41.0256        6.4051       0.61064      -1.07916
C      4          30.0000      280.1667       16.7382       0.32960      -1.01406
C      5          95.4231      226.3136       15.0437      -0.19486      -1.34244
C
C  Variable       Minimum       Maximum         Range    Coef. Var.         Count
C      1           1.0000       21.0000       20.0000        0.7884       13.0000
C      2          26.0000       71.0000       45.0000        0.3231       13.0000
C      3           4.0000       23.0000       19.0000        0.5442       13.0000
C      4           6.0000       60.0000       54.0000        0.5579       13.0000
C      5          72.5000      115.9000       43.4000        0.1577       13.0000
C
C  Variable     Lower CLM     Upper CLM     Lower CLV     Upper CLV
C      1           3.9068       11.0162       17.7930       94.2894
C      2          38.7505       57.5572      124.5113      659.8163
C      3           7.8987       15.6398       21.0958      111.7918
C      4          19.8852       40.1148      144.0645      763.4335
C      5          86.3322      104.5139      116.3726      616.6877
C
      USE MSIMSLSD
C
      INTEGER    LDSTAT, LDX, NVAR
      PARAMETER  (LDSTAT=15, LDX=13, NVAR=5)
C
      INTEGER    IDO, IFRQ, IPRINT, IWT, MOPT, NR, NRMISS, NROW, NV
      DOUBLE PRECISION CONPRM, CONPRV, STAT(LDSTAT,NVAR), X(LDX,NVAR)
C                                  Get data for example.
      CALL DGDATA (5, 0, NR, NV, X, LDX, NVAR)
C                                  All data are input at once.
      IDO  = 0
      NROW = NR
C                                  No unequal frequencies or weights
C                                  are used.
      IFRQ = 0
      IWT  = 0
C                                  Get 95% confidence limits.
      CONPRM = 95.0D0
      CONPRV = 95.0D0
C                                  Delete any row containing a missing
C                                  value.
      MOPT = 0
C                                  Print results.
      IPRINT = 1
      CALL DUVSTA (IDO, NROW, NVAR, X, LDX, IFRQ, IWT, MOPT, CONPRM,
     &             CONPRV, IPRINT, STAT, LDSTAT, NRMISS)
      END
