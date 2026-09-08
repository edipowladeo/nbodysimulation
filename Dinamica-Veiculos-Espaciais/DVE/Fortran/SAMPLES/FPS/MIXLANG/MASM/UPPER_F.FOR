CC    UPPER_F.FOR     FORTRAN Main Program
CC    Test the UPPER subroutine
C
      INTERFACE TO SUBROUTINE UPPER( text )
      CHARACTER*(*) text
      END

      PROGRAM tupper

      CHARACTER*20 stuff /' This is some text'/

      WRITE (*,*) 'Mixed case: ', stuff
      CALL upper( stuff )
      WRITE (*,*) 'Upper case: ', stuff

      END

