CC    POWR2C_F.FOR     FORTRAN Main Program
CC    Test the power2c function
C
      INTERFACE TO INTEGER*4 FUNCTION
     +             power2c [C,ALIAS:'_Power2c'] ( value, exponent ) 
      INTEGER*4 value
      INTEGER*1 exponent
      END

c     PROGRAM tpower2c

      INTEGER*4 power2c
      INTEGER*4 value
      INTEGER*1 exponent
C     exponent <= 32
C
      value = 3
      exponent= 5
      WRITE (*, *) '3 times 2 to the 5 is ',
     +               power2c( value, exponent )

      END

