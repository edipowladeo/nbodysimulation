



!    epsilon.f90 - Illustrate several calculations of machine epsilon.
!                  Compile and run with the /Op option and then do it
!                  again with the /Ox option.
!
!    Uses:    fpprecis (attached below)
!
      PROGRAM epsilon

      USE MSFLIB

      REAL eps, oneeps

!     Compute with addition of eps in IF test
!
      eps = 1.0
  100 IF( (1.0 + eps) .LE. 1.0 ) GOTO 200
      eps = 0.5 * eps
      GOTO 100
  200 eps = eps * 2.0
      WRITE(*,*) ' epsilon (if test) = ', eps

!     Compute with addition of eps in separate statement

!
      eps = 1.0
  300 oneeps = 1.0 + eps
      IF( oneeps .LE. 1.0 ) GOTO 400
      eps = 0.5 * eps
      GOTO 300
  400 eps = eps * 2.0
      WRITE(*,*) ' epsilon (statement) = ', eps

!     Compute with REAL cast of addition of eps in IF test
!
      eps = 1.0
  500 IF( REAL(1.0 + eps) .LE. 1.0 ) GOTO 600
      eps = 0.5 * eps
      GOTO 500
  600 eps = eps * 2.0
      WRITE(*,*) ' epsilon (real) = ', eps

!     Compute after setting precision to 24 bits (single precision)
!
      CALL fpprecis( FPCW$24 )
      eps = 1.0

  700 IF( (1.0 + eps) .LE. 1.0 ) GOTO 800
      eps = 0.5 * eps
      GOTO 700
  800 eps = eps * 2.0
      WRITE(*,*) ' epsilon (precision) = ', eps

      END





!    fpprecis.f90 - Set the contents of the floating point control
!                   word.  Set the precision sub field of the word.
!
!    Input:   precis - Precision sub field desired in control word
!
!

      SUBROUTINE fpprecis( precis )
!
      USE MSFLIB

!     Input argument
!
      INTEGER(2) precis        ! Two byte precision constant

!     Local variables
!
      INTEGER(2) tcontrol      ! Two byte temporary control word
      INTEGER(2) tprecis       ! Two byte temporary precision constant


!     Check for valid input precision constant
!     Retain only precision bits
!     Set to 64 precision bits if invalid input
!
      tprecis = IAND( precis, FPCW$MCW_PC )
      SELECT CASE ( tprecis )
        CASE( FPCW$24, FPCW$53, FPCW$64 )
          CONTINUE
        CASE DEFAULT
          tprecis = FPCW$64
      END SELECT

!     Get the current control word, clear precision bits, set new bits
!
      CALL GETCONTROLFPQQ( tcontrol )
      tcontrol = IOR( IAND( tcontrol, NOT( FPCW$MCW_PC ) ), tprecis )

!     Set the new control word
      CALL SETCONTROLFPQQ( tcontrol )


      end

