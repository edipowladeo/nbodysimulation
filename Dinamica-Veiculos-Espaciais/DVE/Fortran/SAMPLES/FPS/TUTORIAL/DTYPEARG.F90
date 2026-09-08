!     DTYPEARG.F90   Demonstrate use of SEQUENCE to allow passing
!                    a derived-type argument

      INTERFACE
        SUBROUTINE jones (p)
        TYPE pair
          SEQUENCE
          INTEGER ub, lb
        END TYPE
        TYPE (pair) p
        END SUBROUTINE
      END INTERFACE
!___________________________

      TYPE pair
        SEQUENCE
        INTEGER ub, lb
      END TYPE
      TYPE (pair) p

      CALL  jones (p)
      WRITE (*,*) p
      END
!___________________________

      SUBROUTINE jones (p)
      TYPE pair
        SEQUENCE
        INTEGER ub, lb
      END TYPE
      TYPE (pair) p

      p.ub = 2
      p.lb = 1
      END SUBROUTINE
