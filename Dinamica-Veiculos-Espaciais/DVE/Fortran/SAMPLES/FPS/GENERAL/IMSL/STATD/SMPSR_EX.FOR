C
C Compute statistics for inferences regarding the population mean and
C total, given data from a simple random sample.
C
C This example uses artificial data to illustrate a simple use of
C SMPSR to compute point and interval estimates of the population mean
C and total.  The sample size is 15, from a population of size 150.
C
C Output:
C
C  Mean estimate =   19.667      Total estimate =   2950.0
C  Within-sample variance estimate =   13.238
C  VHAT of mean  =  0.79429      VHAT of total  =  17871.4
C  Confidence limits for mean    17.755,  21.578
C  Confidence limits for total   2663.3,  3236.7
C  Sample size =     15.0      Number missing =       0.
C
      USE MSIMSLSD
C
      INTEGER    NROW
      PARAMETER  (NROW=15)
C
      INTEGER    IDO, IOPT, NOUT, NPOP, NSAMPO
      DOUBLE PRECISION CONPER, STAT(11), Y(NROW)
C
      DATA Y/21.0D0, 14.0D0, 17.0D0, 22.0D0, 19.0D0, 21.0D0, 20.0D0,
     &     15.0D0, 24.0D0, 28.0D0, 20.0D0, 17.0D0, 16.0D0, 22.0D0,
     &     19.0D0/
C
      NPOP   = 150
      CONPER = 95.0D0
C                                  All data are input at once.
      IDO = 0
C                                  No subpopulation is assumed.
      IOPT = 0
      CALL DSMPSR (IDO, NROW, Y, NPOP, IOPT, NSAMPO, CONPER, STAT)
C                                  Print results
      CALL UMACH (2, NOUT)
      WRITE (NOUT,99999) STAT
99999 FORMAT (' Mean estimate = ', F8.3, '      Total estimate = ',
     &       F8.1, /, ' Within-sample variance estimate = ', F8.3, /,
     &       ' VHAT of mean  = ', F8.5, '      VHAT of total  = ',
     &       F8.1, /, ' Confidence limits for mean  ', F8.3,
     &       ',', F8.3, /, ' Confidence limits for total ', F8.1,
     &       ',', F8.1, /, ' Sample size = ', F8.1, '      Number ',
     &       'missing = ', F8.0)
      END
