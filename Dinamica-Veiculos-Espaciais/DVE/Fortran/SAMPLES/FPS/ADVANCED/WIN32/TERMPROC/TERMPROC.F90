
!***************************************************************************
!*       This is a part of the Microsoft Source Code Samples.              *
!*       All rights reserved.                                              *
!*       This source code is only intended as a supplement to              *
!*       Microsoft Development Tools and/or WinHelp documentation.         *
!*       See these sources for detailed information regarding the          *
!*       Microsoft samples programs.                                       *
!***************************************************************************

!Purpose: terminate a process based on the PID passed in
!
!Inputs:  argc - number of arguments passed in
!         argv - arguments, including PID of process to terminate

!Returns: none

!Calls:   GetLastError
!         OpenProcess - to get handle to process
!         TerminateProcess - to terminate process
use msfwin
integer status,chrintval,chrpos,ProcId,count,downcount
integer argc       ! no of argument
character  argv*4 ! array to store argument
logical  bTermSucc
integer(4)  hProcess
character*100  lpszTempBuffer

     
argc= NARGS()                                                                                                                                                                                                                             
if (argc == 2) then ! If a PID is passed in 
     call GETARG(1,argv,status)
     chrpos= status  
     count=0
     ProcId=0

     ! convert decimal values to hex
     downcount = chrpos
     do while (downcount > 0)
        if ((argv(downcount:downcount) >= '0') .AND.            &
            (argv(downcount:downcount) <= '9'))                 &
        then  
            chrintval= ichar (argv(downcount:downcount))-48
        else 
             if ((argv(downcount:downcount) >= 'a' ).AND.            &
               (argv(downcount:downcount) <= 'z'))  then                                                 
                  chrintval= ichar(argv(downcount:downcount))-87
             else 
                chrintval= ichar(argv(downcount:downcount)) -55
            end if
        end if
        ProcId= ProcId + chrintval * 16 ** count
        count = count + 1
        downcount= downcount - 1
    end do

    !open the process to terminate
    hProcess= OpenProcess(INT4(PROCESS_ALL_ACCESS), .TRUE., ProcId)
    if (hProcess == 0) then !NULL
         lpszTempBuffer = "OpenProcess    "C
         call ErrorOut(lpszTempBuffer)
    end if
    bTermSucc= TerminateProcess(hProcess,0) !terminate it
    if (bTermSucc .EQV. .FALSE.) then
        lpszTempBuffer = "TerminateProcess"C
        call ErrorOut (lpszTempBuffer)
    else
        write (*,10) argv
10      format (' Process# ', A4,' terminated successfully!' )
    end if

else !no PID, inform user of operation
   write (*,*) 'Terminates an active process'
   write (*,*) 'Usage: Termproc ProcessId '
end if
end

!************************************************************************************
!subroutine ErrorOut (errorstring)
!
!Purpose: Print out an meainful error code by means of
!         GetLastError and printf
!
!Inputs:  errstring - the action that failed, passed by the
!                     calling proc.
!
!Returns: none
!
!Calls:   GetLastError
!************************************************************************************

subroutine ErrorOut (errorstring)
use msfwin
character errorstring*50
integer Err

  Err= GetLastError()
  write (*,100) errorstring,Err
100     format (' Error on ',A15,'=',I5)
end
