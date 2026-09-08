C
C Build multiple linear regression models using forward selection,
C backward selection, or stepwise selection.
C
C This example uses a data set from Draper and Smith (1981, pages
C 629-630).  A corrected sum of squares and crossproducts matrix for
C this data is given in the DATA statement and can be computed using
C routine CORVC.  The first four columns are for the independent
C variables and the last column is for the dependent variable.  Here,
C RSTEP is invoked using the backward stepping option.
C
C Output:
C
C  BACKWARD ELIMINATION
C  STEP 0:  4 variable(s) entered.
C
C  Dependent  R-squared   Adjusted  Est. Std. Dev.
C  Variable   (percent)  R-squared  of Model Error
C         5      98.238     97.356           2.446
C
C                  * * * Analysis of Variance * * *
C                           Sum of        Mean             Prob. of
C  Source           DF     Squares      Square  Overall F  Larger F
C  Regression        4      2667.9       667.0    111.480    0.0000
C  Error             8        47.9         6.0
C  Total            12      2715.8
C
C                   * * * Inference on Coefficients * * *
C                    (Conditional on the Selected Model)
C                   Coef.    Standard                Prob. of    Variance
C    Variable    Estimate       Error  t-statistic   Larger t   Inflation
C           1       1.551      0.7448        2.082     0.0709        38.5
C           2       0.510      0.7238        0.704     0.5012       254.4
C           3       0.102      0.7547        0.135     0.8963        46.9
C           4      -0.144      0.7091       -0.204     0.8437       282.5
C
C
C
C
C  STEP 1 :  Variable 3 removed.
C
C  Dependent  R-squared   Adjusted  Est. Std. Dev.
C  Variable   (percent)  R-squared  of Model Error
C         5      98.234     97.645           2.309
C
C                  * * * Analysis of Variance * * *
C                           Sum of        Mean             Prob. of
C  Source           DF     Squares      Square  Overall F  Larger F
C  Regression        3      2667.8       889.3    166.835    0.0000
C  Error             9        48.0         5.3
C  Total            12      2715.8
C
C                   * * * Inference on Coefficients * * *
C                    (Conditional on the Selected Model)
C                   Coef.    Standard                Prob. of    Variance
C    Variable    Estimate       Error  t-statistic   Larger t   Inflation
C           1       1.452      0.1170       12.410     0.0000        1.07
C           2       0.416      0.1856        2.242     0.0517       18.78
C           4      -0.237      0.1733       -1.365     0.2054       18.94
C
C           * * * Statistics for Variables Not in the Model * * *
C                   Coef.    Standard  t-statistic   Prob. of    Variance
C    Variable    Estimate       Error     to enter   Larger t   Inflation
C           3       0.102      0.7547        0.135     0.8963       46.87
C
C  STEP 2 :  Variable 4 removed.
C
C  Dependent  R-squared   Adjusted  Est. Std. Dev.
C  Variable   (percent)  R-squared  of Model Error
C         5      97.868     97.441           2.406
C
C                  * * * Analysis of Variance * * *
C                           Sum of        Mean             Prob. of
C  Source           DF     Squares      Square  Overall F  Larger F
C  Regression        2      2657.9      1328.9    229.502    0.0000
C  Error            10        57.9         5.8
C  Total            12      2715.8
C
C                   * * * Inference on Coefficients * * *
C                    (Conditional on the Selected Model)
C                   Coef.    Standard                Prob. of    Variance
C    Variable    Estimate       Error  t-statistic   Larger t   Inflation
C           1       1.468      0.1213       12.105     0.0000        1.06
C           2       0.662      0.0459       14.442     0.0000        1.06
C
C           * * * Statistics for Variables Not in the Model * * *
C                   Coef.    Standard  t-statistic   Prob. of    Variance
C    Variable    Estimate       Error     to enter   Larger t   Inflation
C           3       0.250      0.1847        1.354     0.2089        3.14
C           4      -0.237      0.1733       -1.365     0.2054       18.94
C
C  * * * Backward Elimination Summary * * *
C          Variable    Step Removed
C                 3             1
C                 4             2
C
      USE MSIMSLSS
C
      INTEGER    LDCOEF, LDCOV, LDCOVS, NVAR
      PARAMETER  (NVAR=5, LDCOEF=NVAR, LDCOV=NVAR, LDCOVS=NVAR)
C
      INTEGER    IEND, INVOKE, IPRINT, ISTEP, LEVEL(NVAR), NFORCE,
     &           NOBS, NSTEP
      REAL       AOV(13), COEF(LDCOEF,5), COV(LDCOV,NVAR),
     &           COVS(LDCOVS,NVAR), HIST(NVAR), PIN, POUT,
     &           SCALE(NVAR), TOL
C
      DATA COV/415.231, 251.077, -372.615, -290.000, 775.962, 251.077,
     &     2905.69, -166.538, -3041.00, 2292.95, -372.615, -166.538,
     &     492.308, 38.0000, -618.231, -290.000, -3041.00, 38.0000,
     &     3362.00, -2481.70, 775.962, 2292.95, -618.231, -2481.70,
     &     2715.76/
      DATA LEVEL/4*1, -1/
C
      INVOKE = 0
      NFORCE = 0
      NSTEP  = -1
      ISTEP  = -1
      NOBS   = 13
      PIN    = 0.05
      POUT   = 0.10
      TOL    = 100.0*AMACH(4)
      IPRINT = 2
      CALL RSTEP (INVOKE, NVAR, COV, LDCOV, LEVEL, NFORCE, NSTEP,
     &            ISTEP, NOBS, PIN, POUT, TOL, IPRINT, SCALE, HIST,
     &            IEND, AOV, COEF, LDCOEF, COVS, LDCOVS)
C
      END
