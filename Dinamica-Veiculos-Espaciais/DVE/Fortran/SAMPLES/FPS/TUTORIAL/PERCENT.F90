!     PERCENT.F90    

      INTERFACE OPERATOR (.c.)
        FUNCTION CENT (x)
         REAL, INTENT (IN) :: x
         REAL  cent
        END FUNCTION CENT
      END INTERFACE

!     Main Program
      REAL a

      a = 0.567
      write (*,900)  a, .C.a
 900  FORMAT (/' Convert ',f5.3,' to per cent:',f8.1,'%'/)
      END

      FUNCTION CENT (x)
      REAL, INTENT (IN) :: x
      REAL  cent
      cent = x * 100.
      END FUNCTION

