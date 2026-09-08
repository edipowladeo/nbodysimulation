CC    RETURN_F.FOR     FORTRAN Main Program
CC    Test the return{r,c} funtions
C
      INTERFACE TO REAL*4 FUNCTION returnr()
      END

      INTERFACE TO COMPLEX*8 FUNCTION returnc()
      END

      PROGRAM treturn

      REAL*4 returnr, r
      COMPLEX*8 returnc, c

      r = returnr()
      c = returnc()

      WRITE (*,*) ' Real    = ', r
      WRITE (*,*) ' Complex = ', c

      END

