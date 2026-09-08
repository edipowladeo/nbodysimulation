subroutine KbdFunc()                   !/* Dispatch and count threads. */       
use msfwin
use bouncein

interface      
character*1 function GetCharQQ ()
end function
end interface

interface 
integer function getrandom (min, max)
integer  min 
integer  max 
end function
end interface

interface 
subroutine ClearScreen()
end subroutine
end interface

interface 
subroutine Shut_Down()   !/* Program shutdown */
end subroutine
end interface

interface 
subroutine WriteTitle( ThreadNum )  !/* Display title bar information */
integer ThreadNum 
end subroutine
end interface


external    BounceProc

character*1     KeyInfo
integer*4       ThreadID
integer*4       iret, iAddr

   do while(.TRUE.)
      iAddr = LOC(BounceProc)
      KeyInfo = getcharqq()

      if( (KeyInfo .EQ. 'a' .OR. KeyInfo .eq. 'A') .AND. ThreadNr .LT. MAX_THREADS ) then
         if( ThreadNr < MAX_THREADS ) then
            ThreadNr = ThreadNr + 1
            iret = CreateThread(null_security_attributes, 0, LOC(BounceProc), LOC(ThreadNr), 0, LOC(ThreadID))
            ierror = GetLastError()
            call WriteTitle( ThreadNr )
         end if
      end if
      if ( KeyInfo .EQ. 'q' .OR. KeyInfo .eq. 'Q') then
         exit
      end if
   end do
   call Shut_Down()
end 

