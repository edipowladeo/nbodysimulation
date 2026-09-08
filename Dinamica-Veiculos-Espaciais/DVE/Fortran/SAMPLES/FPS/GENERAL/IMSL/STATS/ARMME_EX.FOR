C
C Compute method of moments estimates of the autoregressive parameters
C of an ARMA model.
C
C Consider the Wolfer Sunspot Data (Anderson 1971, page 660) consisting
C of the number of sunspots observed each year from 1749 through 1924.
C The data set for this example consists of the number of sunspots
C observed from 1770 through 1869.  Routine ARMME is invoked first to
C compute the method of moments estimates for the autoregressive
C parameters of an ARMA(2,0) model given the sample autocovariances
C computed from routine ACF.  Then, ARMME is invoked a second time to
C compute estimated autoregressive parameters for an ARMA(2,1) model.
C
C Output:
C
C ARMA(2,0) Model
C
C    Output PAR
C       1       2
C   1.318  -0.635
C
C ARMA(2,1) Model
C
C    Output PAR
C       1       2
C   1.244  -0.575
C
      USE MSIMSLSS
C
      INTEGER    IMEAN, IPRINT, ISEOPT, MAXLAG, NOBS
      PARAMETER  (IMEAN=1, IPRINT=1, ISEOPT=0, MAXLAG=4, NOBS=100)
C
      INTEGER    NCOL, NOUT, NPAR, NPMA, NROW
      REAL       AC(0:MAXLAG), ACV(0:MAXLAG), PAR(2), RDATA(176,2),
     &           SEAC(1), W(100), WMEAN
C
      EQUIVALENCE (W(1), RDATA(22,2))
C
      CALL UMACH (2, NOUT)
C                                  Wolfer Sunspot Data for
C                                  years 1770 through 1869
      CALL GDATA (2, 0, NROW, NCOL, RDATA, 176, 2)
C                                  Compute sample ACV
      CALL ACF (NOBS, W, 0, ISEOPT, IMEAN, WMEAN, MAXLAG, ACV, AC,
     &          SEAC)
C                                  Compute estimates of autoregressive
C                                  parameters for ARMA(2,0) model
C                                  (Box and Jenkins, page 83)
      WRITE (NOUT,*) 'ARMA(2,0) Model'
      NPAR = 2
      NPMA = 0
      CALL ARMME (MAXLAG, ACV, IPRINT, NPMA, NPAR, PAR)
C                                  Compute estimates of autoregressive
C                                  parameters for ARMA(2,1) model
      WRITE (NOUT,*) ' '
      WRITE (NOUT,*) 'ARMA(2,1) Model'
      NPMA = 1
      CALL ARMME (MAXLAG, ACV, IPRINT, NPMA, NPAR, PAR)
C
      END
