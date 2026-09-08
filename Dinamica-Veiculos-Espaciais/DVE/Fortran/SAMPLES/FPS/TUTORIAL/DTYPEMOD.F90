!     DTYPEMOD.F90   Demonstrate use of a module to allow passing
!                    a derived-type argument

      MODULE m
        TYPE pair
          INTEGER ub, lb
        END TYPE
      END MODULE
!________________________

      USE m
      TYPE (pair) p
      CALL  jones (p)
      WRITE (*,*) p
      END
!________________________

      SUBROUTINE jones (p)
      USE m
      TYPE (pair) p

      p.ub = 2
      p.lb = 1
      END SUBROUTINE
