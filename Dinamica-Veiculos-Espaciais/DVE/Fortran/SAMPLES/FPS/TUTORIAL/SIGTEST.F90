! SIGTEST.F90 
! Establish the name of the exception handler as the
! function to be invoked if an exception happens. 
! The exception handler hand_fpe is attached below.
  USE MSFLIB
     INTERFACE   
        FUNCTION  hand_fpe (sigid, except)
           !MS$ATTRIBUTES C :: hand_fpe
           INTEGER(4) hand_fpe
           INTEGER(2)  sigid, except
        END FUNCTION
      END INTERFACE

  INTEGER(4)  iret
  REAL(4) r1, r2
  r1 = 0.0
  iret = SIGNALQQ(SIG$FPE, hand_fpe)
  WRITE(*,*) 'Set exception handler.  Return = ', iret
  ! Cause divide by zero exception
  r1 = 0.0
  r2 = 3/r1
  END

! Exception handler routine hand_fpe
  FUNCTION hand_fpe (signum, excnum)
    !MS$ATTRIBUTES C :: hand_fpe
    USE MSFLIB
    INTEGER(2)  signum, excnum
    WRITE(*,*) 'In signal handler for SIG$FPE'
    WRITE(*,*) 'signum = ', signum
    WRITE(*,*) 'exception = ', excnum
    SELECT CASE(excnum)
      CASE(FPE$INVALID )
        STOP ' Floating point exception: Invalid number'
      CASE( FPE$DENORMAL )
        STOP ' Floating point exception: Denormalized number'
      CASE( FPE$ZERODIVIDE )
        STOP ' Floating point exception: Zero divide'
      CASE( FPE$OVERFLOW )
        STOP ' Floating point exception: Overflow'
      CASE( FPE$UNDERFLOW )
        STOP ' Floating point exception: Underflow'
      CASE( FPE$INEXACT )
        STOP ' Floating point exception: Inexact precision'
      CASE DEFAULT
        STOP ' Floating point exception: Non-IEEE type'
    END SELECT
    hand_fpe = 1
    END