C    POWER2_F.FOR     FORTRAN Main Program
CC   Test the power2 function
C
      INTERFACE TO INTEGER*4 FUNCTION power2( value, exponent ) 
      INTEGER*4 value
      INTEGER*1 exponent
      END

c    PROGRAM tpower2
      
      INTEGER*4 power2
      INTEGER*4 value
      INTEGER*1 exponent
      
C     exponent <= 32
C
      value = 3
      exponent = 5
      WRITE (*, *) '3 times 2 to the 5 is ',
     +               power2( value, exponent )
      
      END


