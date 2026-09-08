!*******************************************************************
!   Purpose: Make a call into a DLL and then terminate, allowing
!         DLL init. and termination to be called.
!
!   Inputs:  none
!
!   Returns: none
!
!   Calls:   TlsInit: Dummy proc. to allow DLL initialization.
!********************************************************************

integer*4 function Another_Thread(x)
use msfwin
include 'tls.fi'

integer*4 x
    x = x
   call sleepqq(300)    ! Sleep while other threads start 
   i = TlsInit()       ! Call dummy init. procedure 
   call ExitThread(0)   ! Exit, calling DLL termination 
   Another_thread = 1
   return
end 

