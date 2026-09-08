



!    assoc.f90 - Illustrate the non-associativity
!                of floating-point addition
!
      PROGRAM assoc

      REAL u, v, x, y, z

      x =  1.0e+30
      y = -1.0e+30
      z =  1.0
      WRITE(*,*) 'Variables:'
      WRITE(*,*) 'x       = ', x
      WRITE(*,*) 'y       = ', y
      WRITE(*,*) 'z       = ', z
      WRITE(*,*)
      
      u = ( x + y ) + z
      v = x + ( y + z )
      IF( u .EQ. 1.0 ) THEN
        WRITE(*,*) 'You thought (x+y)+z = 1.0?  Right, it equals', u

      ELSE
        WRITE(*,*) 'You thought (x+y)+z = 1.0?  Would you believe', u
      ENDIF

      IF( v .EQ. 1.0 ) THEN
        WRITE(*,*) 'You thought x+(y+z) = 1.0?  Right, it equals', v
      ELSE
        WRITE(*,*) 'You thought x+(y+z) = 1.0?  Would you believe', v
      ENDIF

      END

