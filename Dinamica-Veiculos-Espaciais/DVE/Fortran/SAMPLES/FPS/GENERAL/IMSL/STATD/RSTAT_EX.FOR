C
C Compute statistics related to a regression fit given the coefficient
C estimates and the R matrix.
C
C This example uses a data set discussed by Draper and Smith (1981,
C pages 629-630).  This data set is put into the matrix X by routine
C GDATA.  There are 4 independent variables and 1 dependent variable.
C Routine RGIVN is invoked to fit the regression model and RSTAT is
C invoked to compute summary statistics.
C
C Output:
C
C  R-squared   Adjusted  Est. Std. Dev.              Coefficient of
C  (percent)  R-squared  of Model Error        Mean  Var. (percent)
C     98.238     97.356           2.446       95.42           2.563
C
C                    * * * Analysis of Variance * * *
C                                Sum of        Mean             Prob. of
C  Source                DF     Squares      Square  Overall F  Larger F
C  Regression             4      2667.9       667.0    111.479    0.0000
C  Residual               8        47.9         6.0
C  Corrected Total       12      2715.8
C
C              * * * Sequential Statistics * * *
C  Indep.    Degrees of     Sum of                Prob. of
C  Variable     Freedom     Squares  F-statistic   Larger F
C         1           1      1450.1      242.368     0.0000
C         2           1      1207.8      201.870     0.0000
C         3           1         9.8        1.637     0.2366
C         4           1         0.2        0.041     0.8441
C
C                 * * * Inference on Coefficients * * *
C                       Standard                 Prob. of    Variance
C  Coef.    Estimate       Error  t-statistic  Larger |t|   Inflation
C      1       62.41       70.07        0.891      0.3991     10668.5
C      2        1.55        0.74        2.083      0.0708        38.5
C      3        0.51        0.72        0.705      0.5009       254.4
C      4        0.10        0.75        0.135      0.8959        46.9
C      5       -0.14        0.71       -0.203      0.8441       282.5
C
C   * * * Variance-Covariance Matrix for the Coefficient Estimates * * *
C                1             2             3             4             5
C  1       4909.95        -50.51        -50.60        -51.66        -49.60
C  2                        0.55          0.51          0.55          0.51
C  3                                      0.52          0.53          0.51
C  4                                                    0.57          0.52
C  5                                                                  0.50
C
      USE MSIMSLSD, MSIMSLSD_ISUB => ISUB
C                                  SPECIFICATIONS FOR LOCAL VARIABLES
      INTEGER    INTCEP, LDB, LDCOEF, LDCOVB, LDR, LDSCPE, LDSQSS,
     &           LDX, NCOEF, NDEP, NDX, NIND
      PARAMETER  (INTCEP=1, LDX=13, NDEP=1, NDX=5, NIND=4,
     &           LDSCPE=NDEP, LDSQSS=NIND, NCOEF=INTCEP+NIND,
     &           LDB=NCOEF, LDCOEF=NCOEF, LDCOVB=NCOEF, LDR=NCOEF)
C
      INTEGER    IDEP, IDO, IEF, IFRQ, IIND, INDDEP(1), INDIND(1),
     &           IRANK, IRBEF(1), ISUB, IWT, NCOL, NRMISS, NROW
      DOUBLE PRECISION AOV(15), B(LDB,NDEP), COEF(LDCOEF,5),
     &           COVB(LDCOVB,5), D(NCOEF), DFE, R(LDR,NCOEF),
     &           SCPE(LDSCPE,NDEP), SQSS(LDSQSS,4), SSE, TOL,
     &           X(LDX,NDX), XMAX(NCOEF), XMIN(NCOEF)
      CHARACTER  PRINT*5
C
      CALL DGDATA (5, 0, NROW, NCOL, X, LDX, NDX)
      IDO  = 0
      IIND = -NIND
      IDEP = -NDEP
      IFRQ = 0
      IWT  = 0
      ISUB = 1
      TOL  = DMACH(4)*100.0D0
      CALL DRGIVN (IDO, NROW, NCOL, X, LDX, INTCEP, IIND, INDIND, IDEP,
     &             INDDEP, IFRQ, IWT, ISUB, TOL, B, LDB, R, LDR, D,
     &             IRANK, DFE, SCPE, LDSCPE, NRMISS, XMIN, XMAX)
      PRINT = 'A'
      IEF   = -NIND
      SSE   = SCPE(1,1)
C
      CALL DRSTAT (INTCEP, IEF, IRBEF, B, R, LDR, DFE, SSE, PRINT, AOV,
     &             SQSS, LDSQSS, COEF, LDCOEF, COVB, LDCOVB)
C
      END
