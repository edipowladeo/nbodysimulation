C
C Compute the spline interpolant, returning the B-spline coefficients.
C
C In this example, a spline interpolant S, to F(X) = SQRT(X), is
C computed. The interpolated values are then compared with the exact
C function values using the IMSL routine BSVAL.
C
C Output:
C
C       X                   S(X)                  Error
C
C  0.0000                 0.0000               0.000000
C  0.1250                 0.2918               0.061781
C  0.2500                 0.5000               0.000000
C  0.3750                 0.6247              -0.012311
C  0.5000                 0.7071               0.000000
C  0.6250                 0.7886               0.002013
C  0.7500                 0.8660               0.000000
C  0.8750                 0.9365              -0.001092
C  1.0000                 1.0000               0.000000
C
      USE MSIMSLMS
C
      INTEGER    KORDER, NDATA, NKNOT
      PARAMETER  (KORDER=3, NDATA=5, NKNOT=NDATA+KORDER)
C
      INTEGER    I, NCOEF, NOUT
      REAL       BSCOEF(NDATA), BT, F, FDATA(NDATA), FLOAT,
     &           SQRT, X, XDATA(NDATA), XKNOT(NKNOT), XT
      INTRINSIC  FLOAT, SQRT
C                                  Define function
      F(X) = SQRT(X)
C                                  Set up interpolation points
      DO 10  I=1, NDATA
         XDATA(I) = FLOAT(I-1)/FLOAT(NDATA-1)
         FDATA(I) = F(XDATA(I))
   10 CONTINUE
C                                  Generate knot sequence
      CALL BSNAK (NDATA, XDATA, KORDER, XKNOT)
C                                  Interpolate
      CALL BSINT (NDATA, XDATA, FDATA, KORDER, XKNOT, BSCOEF)
C                                  Get output unit number
      CALL UMACH (2, NOUT)
C                                  Write heading
      WRITE (NOUT,99999)
C                                  Print on a finer grid
      NCOEF = NDATA
      XT    = XDATA(1)
C                                  Evaluate spline
      BT    = BSVAL(XT,KORDER,XKNOT,NCOEF,BSCOEF)
      WRITE (NOUT,99998) XT, BT, F(XT) - BT
      DO 20  I=2, NDATA
         XT = (XDATA(I-1)+XDATA(I))/2.0
C                                  Evaluate spline
         BT = BSVAL(XT,KORDER,XKNOT,NCOEF,BSCOEF)
         WRITE (NOUT,99998) XT, BT, F(XT) - BT
         XT = XDATA(I)
C                                  Evaluate spline
         BT = BSVAL(XT,KORDER,XKNOT,NCOEF,BSCOEF)
         WRITE (NOUT,99998) XT, BT, F(XT) - BT
   20 CONTINUE
99998 FORMAT (' ', F6.4, 15X, F8.4, 12X, F11.6)
99999 FORMAT (/, 6X, 'X', 19X, 'S(X)', 18X, 'Error', /)
      END
