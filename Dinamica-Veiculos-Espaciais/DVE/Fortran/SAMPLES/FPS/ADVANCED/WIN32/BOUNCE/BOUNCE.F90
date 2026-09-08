!*****************************************************************************************
!*  Bounce - Creates a new thread each time the letter 'a'is typed.
!*  Each thread bounces a happy face of a different color around the screen.
!*  All threads are terminated when the letter 'Q' is entered.
!*
!*
!*****************************************************************************************
use msfwin

use bouncein
include 'bounce.fi'

integer*4   lret
    
!  /* Get display screen information & clear the screen.*/
   hConsoleOut = GetStdHandle( STD_OUTPUT_HANDLE )
   lret = GetConsoleScreenBufferInfo( INT(hConsoleOut), csbiInfo)
   if (lret .eqv. .FALSE.) then 
      ierror = GetLastError()
   end if
   
  
   call WriteTitle( 0 )

!  /* Create the mutexes and reset thread count. */
   hScreenMutex = CreateMutex(NULL_security_attributes, .FALSE., NULL_CHARACTER)   !/* Cleared */
   itempMutex = hScreenMutex
   hRunMutex = CreateMutex(NULL_security_attributes , .TRUE.,NULL_CHARACTER )       !/* Set */
   itempRunMutex = hRunMutex
   ThreadNr = 0

!  /* Start waiting for keyboard input to dispatch threads or exit. */
   call KbdFunc()

!     /* All threads done. Clean up handles. */
   lret = CloseHandle( INT(hScreenMutex) )
   lret = CloseHandle( INT(hRunMutex ))
   lret = CloseHandle( INT( hConsoleOut ))
end

!************************************************************************
!**** getrandom
!************************************************************************
integer*4 function getrandom (min, max)
use msfwin
use bouncein

integer*4   min, max
real ranval
   call random (ranval)
   getrandom = INT(ranval * (max+1-min)) + min
end

!************************************************************************
!**** Shut_Down
!************************************************************************
subroutine Shut_Down()                  ! Shut down threads 
use msfwin
use bouncein

interface 
integer function getrandom (min, max)
integer  min 
integer  max 
end function
end interface

interface 
subroutine KbdFunc()                !/** Keyboard input, thread dispatch */
end subroutine
end interface

interface 
subroutine BounceProc( MyID )       !* Threads 2 to n: display */
!MS$ATTRIBUTES REFERENCE :: MyID
end subroutine 
end interface

interface 
subroutine ClearScreen()
end subroutine
end interface

interface 
subroutine WriteTitle( ThreadNum )  !/* Display title bar information */
integer ThreadNum 
end subroutine
end interface

integer*4   lret, iret

   do while ( ThreadNr > 0 )
      !  Tell thread to die and record its death. 
      lret = ReleaseMutex( hRunMutex )
      ThreadNr = ThreadNr - 1
   end do
! Clean up display when done 
   iret = WaitForSingleObject( hScreenMutex, INFINITE )
   call ClearScreen()
end                 




















 
