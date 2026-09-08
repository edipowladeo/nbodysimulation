!*******************************************************************
!  Purpose: Make a call into a DLL and then terminate, allowing
!           DLL init. and termination to be called.
!
!  Inputs:  none
!
!  Returns: none
!
!  Calls:   CreateThread: to create threads for DLL init.
!           ErrorOut: To output any errors
!           WaitForMultipleObjects: To wait on thread(s) termination
!********************************************************************
use msfwin
use tlsin
include 'tls.fi'

external Another_Thread 

integer        threadid
integer        hThreads(NUMTHREADS)
integer        count
character*50   mesbuf


!/* start NUMTHREADS threads */
   do count = 1 , NUMTHREADS 
      hThreads(count) = CreateThread(                             &
                              NULL_SECURITY_ATTRIBUTES,           &
                              0,                                  &
                              LOC(Another_Thread),                &
                              NULL,                               &
                              0,                                  &
                              LOC(threadid))
      if( hThreads(count) == 0) then
         call ErrorOut("CreateThread"C)
      else
         write(*,*)
         write(mesbuf,200) count
200      format ('Starting thread # ',I4)
        write(*,*) mesbuf
        write(*,*)
      end if
   end do

!/* now wait for threads to terminate */
       write(mesbuf,300) NUMTHREADS
300    format('***** Waiting for ',I4, ' Threads to Exit *****')

        write(*,*) mesbuf
        write(*,*)

   i = WaitForMultipleObjects( NUMTHREADS,                           &
                   LOC(hThreads),                                 &
                   .FALSE.,                                         &
                   16#FFFFFFFF)
   call Sleepqq(1000)

      write(mesbuf,400) NUMTHREADS
400   format ('All ',I4, ' Threads Terminated ')

      write(*,*) mesbuf
      write(*,*)
end

!******************************************************************
!Purpose: Print out an meainful error code by means of
!         GetLastError and printf
!
!Inputs:  errstring - the action that failed, passed by the
!                     calling proc.
!
!Returns: none
!
!Calls:   GetLastError
!******************************************************************

subroutine ErrorOut(errstring)
use msfwin
character*(*)   errstring
integer    Error1

character*50 mesbuf

   Error1= GetLastError()
   write (mesbuf,100) errstring, Error1
100   format ('Error on ', A30, ' = ', I4)

    write (*,*) mesbuf
end
