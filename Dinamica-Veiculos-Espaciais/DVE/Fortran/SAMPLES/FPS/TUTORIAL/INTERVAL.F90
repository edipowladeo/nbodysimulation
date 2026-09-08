



!    interval.f90    Example of Using Rounding Control
!
!    Uses: fpcontrl, fpprecis, fpround, fpstatus attached below
!
      
      PROGRAM interval
      
      USE MSFLIB

!     Dummy arguments for statement functions
!
      REAL numerator, denominator
      REAL q, r, s, t, u, v

!     Variables
!
      REAL a, b, c, d, e, f
      REAL numerhi, numerlo, denomhi, denomlo
      REAL expr, exprhi, exprlo

      DATA a /1.1/, b /1.7/, c /1.3/, d /1.5/, e /1.87/, f /1.95/

!     Statement functions
!
      numerator( q, r, s, t ) = q * r + s * t

      denominator( u, v ) = u + v

!     Set rounding Precision
!
      CALL fpprecis( FPCW$24 )

!     Compute default (round to nearest) expression
!
      expr = numerator( a, b, c, d ) / denominator( e, f )

!     Compute low terms (round down)
!
      CALL fpround( FPCW$DOWN )
      numerlo = numerator( a, b, c, d )
      denomlo = denominator( e, f )

!     Compute high terms (round up)
!
      CALL fpround( FPCW$UP )
      numerhi = numerator( a, b, c, d )
      denomhi = denominator( e, f )


!     Compute high expression (still round up)
!
      exprhi = numerhi / denomlo

!     Compute low expression (round down)
!
      CALL fpround( FPCW$DOWN )
      exprlo = numerlo / denomhi

!     Return to default rounding (nearest)
!
      CALL fpround( FPCW$NEAR )

!     Report results
!
      WRITE (*,'(1x,a,f12.7)') ' Expression   = ', expr
      WRITE (*,'(1x,a,z8)')    '  Low Result  Hex = ', exprlo
      WRITE (*,'(1x,a,z8)')    '  Default     Hex = ', expr
      WRITE (*,'(1x,a,z8)')    '  High Result Hex = ', exprhi

      END





!    fpcontrl.f90 - Describe the contents of the floating point
!                   control word.  Interpret each sub field of
!                   the word individually.
!
!    Input:   control - Two byte control word from GETCONTROLFPQQ
!
      SUBROUTINE fpcontrl( control )

      USE MSFLIB

!     Input argument
!
      INTEGER(2) control       ! Two byte control word

!     Local variables
!
      INTEGER(2) tcontrol      ! Two byte temporary control word

!     Interpret the exception trap field
!     Retain only the exception bits

!
      tcontrol = IAND( control, FPCW$MCW_EM )
!     Test each exception and print only the ones that are set
!
      IF( tcontrol .NE. 0 ) THEN
        IF( IAND( tcontrol, FPCW$INVALID ) .NE. 0 ) THEN
          WRITE (*,*) ' FPCONTRL: Invalid operation trap disabled'
        ELSE
          WRITE (*,*) ' FPCONTRL: Invalid operation trap enabled'
        ENDIF
        IF( IAND( tcontrol, FPCW$DENORMAL ) .NE. 0 ) THEN
          WRITE (*,*)'         : Denormalized operand trap disabled'
        ELSE
          WRITE (*,*)'         : Denormalized operand trap enabled'

        ENDIF
        IF( IAND( tcontrol, FPCW$ZERODIVIDE ) .NE. 0 ) THEN
          WRITE (*,*) '         : Zero divide trap disabled'
        ELSE
          WRITE (*,*) '         : Zero divide trap enabled'
        ENDIF
        IF( IAND( tcontrol, FPCW$OVERFLOW ) .NE. 0 ) THEN
          WRITE (*,*) '         : Overflow trap disabled'
        ELSE
          WRITE (*,*) '         : Overflow trap enabled'
        ENDIF
        IF( IAND( tcontrol, FPCW$UNDERFLOW ) .NE. 0 ) THEN
          WRITE (*,*) '         : Underflow trap disabled'
        ELSE

          WRITE (*,*) '         : Underflow trap enabled'
        ENDIF
        IF( IAND( tcontrol, FPCW$INEXACT ) .NE. 0 ) THEN
          WRITE (*,*) '         : Inexact (precision) trap disabled'
        ELSE
          WRITE (*,*) '         : Inexact (precision) trap enabled'
        ENDIF
      ELSE
        WRITE (*,*) ' FPCONTRL: All exception traps enabled'
      ENDIF

!     Interpret the precision control field
!       Retain only the precision bits
!
      tcontrol = IAND( control, FPCW$MCW_PC )

!     Test precision and print the one that is set

!
      SELECT CASE ( tcontrol )
        CASE( FPCW$24 )
          WRITE(*,*) '         : 24 bit precision enabled'
        CASE( FPCW$53 )
          WRITE(*,*) '         : 53 bit precision enabled'
        CASE( FPCW$64 )
          WRITE(*,*) '         : 64 bit precision enabled'
        CASE DEFAULT
          WRITE(*,*) '         : Invalid precision control'
      END SELECT

!     Interpret the rounding control field
!     Retain only the rounding bits
!
      tcontrol = IAND( control, FPCW$MCW_RC )

!     Test rounding and print the one that is set
!
      SELECT CASE ( tcontrol )
        CASE( FPCW$NEAR )

          WRITE(*,*) '         : Round to nearest (or even) enabled'
        CASE( FPCW$DOWN )
          WRITE(*,*) '         : Round down (to -INF) enabled'
        CASE( FPCW$UP )
          WRITE(*,*) '         : Round up (to +INF) enabled'
        CASE( FPCW$CHOP )
          WRITE(*,*) '         : Chop (truncate to 0) enabled'
        CASE DEFAULT
          WRITE(*,*) '         : Invalid round control'
      END SELECT

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
      END
	  



!    fpround.f90 - Set the contents of the floating point control
!                 word.  Set the rounding sub field of the word.
!    Input:   round - Rounding sub field desired in control word
!
!
      SUBROUTINE fpround( round )

      USE MSFLIB

!     Input argument
!
      INTEGER(2) round         ! Two byte rounding constant

!     Local variables
!
      INTEGER(2) control      ! Two byte control word
      INTEGER(2) tround       ! Two byte temporary rounding constant

!     Retain only rounding bits
!
      tround = IAND( round, FPCW$MCW_RC )


!     Get the current control word, clear rounding bits, set new bits
!
      CALL GETCONTROLFPQQ( control )
      control = IOR( IAND( control, NOT( FPCW$MCW_RC ) ), tround )

!     Set the new control word
!
      CALL SETCONTROLFPQQ( control )

      END





!    fpstatus.f90 - Describe the contents of the floating point
!                   status word.  Interpret only the low six
!                   exception bits.
!
!    Input:   status - Two byte status word from GETSTATUSFPQQ
!

      SUBROUTINE fpstatus( status )

      USE MSFLIB

!     Input argument
!
      INTEGER(2) status        ! Two byte status word

!     Local variable
!
      INTEGER(2) tstatus       ! Two byte temporary status word

!     Retain only exception bits
!
      tstatus = IAND( status, FPSW$MSW_EM )

!     Test each exception and print only the one(s) that are set

!
      IF( tstatus .EQ. 0 ) THEN
        WRITE (*,*) ' FPSTATUS: No exceptions'
      ENDIF
      IF( tstatus .NE. 0 ) THEN
        IF( IAND( tstatus, FPSW$INVALID ) .NE. 0 ) THEN
          WRITE (*,*) ' FPSTATUS: Invalid operation exception'
        ENDIF
        IF( IAND( tstatus, FPSW$DENORMAL ) .NE. 0 ) THEN
          WRITE (*,*) ' FPSTATUS: Denormalize operand exception'
        ENDIF
        IF( IAND( tstatus, FPSW$ZERODIVIDE ) .NE. 0 ) THEN
          WRITE (*,*) ' FPSTATUS: Zero divide exception'
        ENDIF
        IF( IAND( tstatus, FPSW$OVERFLOW ) .NE. 0 ) THEN

          WRITE (*,*) ' FPSTATUS: Overflow exception'
        ENDIF
        IF( IAND( tstatus, FPSW$UNDERFLOW ) .NE. 0 ) THEN
          WRITE (*,*) ' FPSTATUS: Underflow exception'
        ENDIF
        IF( IAND( tstatus, FPSW$INEXACT ) .NE. 0 ) THEN
          WRITE (*,*) ' FPSTATUS: Inexact (precision) exception'
        ENDIF
      ENDIF

      END

