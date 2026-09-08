CC    UPERFN_F.FOR     FORTRAN Main Program
CC    Test the upperfn function
C
      INTERFACE TO CHARACTER*(*) FUNCTION upperfn( text )
      CHARACTER*(*) text
      END

      PROGRAM tupperfn

      CHARACTER*20 sorig
      CHARACTER*30 lorig
      CHARACTER*25 upperfn, scopy, lcopy
      DATA sorig /'This is some text.'/
      DATA lorig /'This is some more longer text.'/

      WRITE (*,*) ' Before calling upperfn:'
      WRITE (*,*) '  Short String = ', sorig
      WRITE (*,*) '  Long  String = ', lorig
      WRITE (*,*) '  Short UPPER  = ', scopy
      WRITE (*,*) '  Long  UPPER  = ', lcopy

      scopy = upperfn( sorig )
      lcopy = upperfn( lorig )

      WRITE (*,*) ' After calling upperfn:'
      WRITE (*,*) '  Short String = ', sorig
      WRITE (*,*) '  Long  String = ', lorig
      WRITE (*,*) '  Short UPPER  = ', scopy
      WRITE (*,*) '  Long  UPPER  = ', lcopy

      END

