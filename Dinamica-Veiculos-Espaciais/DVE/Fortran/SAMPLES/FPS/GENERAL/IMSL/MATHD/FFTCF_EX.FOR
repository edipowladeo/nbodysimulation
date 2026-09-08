C
C Compute the Fourier coefficients of a complex periodic sequence.
C
C In this example, we input a pure exponential data vector and recover
C its Fourier series, which is a vector with all components zero
C except at the appropriate frequency where it has an N.  Notice that
C the norm of the input vector is SQRT(N), but the norm of the output
C vector is N.
C
C Output:
C
C          INDEX        SEQ               COEF
C            1     ( 1.00, 0.00)     ( 0.00, 0.00)
C            2     (-0.90, 0.43)     ( 0.00, 0.00)
C            3     ( 0.62,-0.78)     ( 0.00, 0.00)
C            4     (-0.22, 0.97)     ( 7.00, 0.00)
C            5     (-0.22,-0.97)     ( 0.00, 0.00)
C            6     ( 0.62, 0.78)     ( 0.00, 0.00)
C            7     (-0.90,-0.43)     ( 0.00, 0.00)
C
      USE MSIMSLMD
C
      INTEGER    N
      PARAMETER  (N=7)
C
      INTEGER    I, NOUT
      DOUBLE PRECISION TWOPI
      COMPLEX*16 C, CEXP, COEF(N), H, SEQ(N)
      INTRINSIC  CDEXP

C
      C     = (0.0D0,1.0D0)
      TWOPI = 2.0D0*DCONST('PI')
C                                  Here we compute (2*pi*i/N)*3.
      H = (TWOPI*C/N)*3.0D0
C                                  This loop fills out the data vector
C                                  with a pure exponential signal of
C                                  frequency 3.
      DO 10  I=1, N
         SEQ(I) = CDEXP((I-1)*H)
   10 CONTINUE
C                                  Compute the Fourier transform of SEQ
      CALL DFFTCF (N, SEQ, COEF)
C                                  Get output unit number and print
C                                  results
      CALL UMACH (2, NOUT)
      WRITE (NOUT,99998)
99998 FORMAT (9X, 'INDEX', 8X, 'SEQ', 15X, 'COEF')
      WRITE (NOUT,99999) (I, SEQ(I), COEF(I), I=1,N)
99999 FORMAT (1X, I11, 5X,'(',F5.2,',',F5.2,')',
     &                 5X,'(',F5.2,',',F5.2,')')
      END
