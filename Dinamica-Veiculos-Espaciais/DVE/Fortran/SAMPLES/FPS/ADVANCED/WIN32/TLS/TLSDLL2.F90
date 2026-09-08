!******************************************************************
!Purpose: Print out an meainful error code by means of
!         GetLastError and printf
!Inputs:  errstring - the action that failed, passed by the
!                     calling proc.
!Returns: none
!
!Calls:   GetLastError
!*********************************************************************

subroutine ErrorOut (errstring)
use msfwin

character*(*)   errstring
integer Error1
character*50 mesbuf

    Error1= GetLastError()
   
    write(mesbuf,100) errstring, Error1
100 FORMAT('Error on ', A30, ' = ', I4)
    iret = MessageBox(NULL,mesbuf,'DLL - ErrorOut'C,MB_OK)
end 


!*******************************************************************
!Purpose: Is called by LibEntry, upon entering a dll or detaching
!         from a DLL.  This function does most of the TLS manipulation.
!
!Inputs:  hInst - not used
!         ul_reason_being_called - reason DllMain is called
! 
!
!Returns: N/A
!
!Calls:   TlsAlloc - allocate a TLS index
!         malloc - allocate space for tls storage
!         TlsSetValue - Store TLS values
!         TlsFree - free TLS index
!         TlsRetreive - retreives TLS values, based on index
!*********************************************************************
integer*4 function DllMain  (hInst, ul_reason_being_called, lpReserved)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DllMain@12' :: DllMain
use msfwin
use tlsin

interface 
integer function TlsInit()
!MS$ ATTRIBUTES STDCALL, ALIAS : '_TlsRetrieve@0' :: TlsRetrieve
end function
end interface

interface 
integer function TlsRetrieve (x)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_TlsRetrieve@4' :: TlsRetrieve
integer x
end function
end interface

 
interface 
subroutine ErrorOut  (errstring)
character*(*)   errstring
end subroutine
end interface

integer hInst
integer ul_reason_being_called
integer lpReserved

integer         pString
character*512   TempBuffer


character*100 TlsString(3)  ! TLS string for storage 

hinst = hinst
lpReserved = lpReserved
TlsString(1) = "Tls Thread #1"C
TlsString(2) = "Tls Thread #2"C
TlsString(3) = "Tls Thread #3"C


    select case (ul_reason_being_called)
        case (DLL_PROCESS_ATTACH)             ! process attaches     
            iret = MessageBox(NULL,'Process Attaching'C,'DLL'C,MB_OK)
            !write(*,*) 'Process Attaching'
            TlsIndex= TlsAlloc()                  ! create TLS index       
            if (TlsIndex == #FFFFFFFF) then
                call ErrorOut("TlsAlloc"C)
            end if
            DllMain = 1
            return
        case (DLL_THREAD_ATTACH)            ! thread attaches          
            if ((IAND(DLL_PROCESS_ATTACH ,ul_reason_being_called)) == 0) then
                iret = MessageBox(NULL,'Thread Attaching'C,'DLL'C,MB_OK)
                !write (*,*) 'Thread Attaching'
                TlsCount = TlsCount + 1
                
                pString = LocalAlloc(LPTR, 100)
                TempBuffer = "Thread Number #"C
                call CopyMemory (pString,LOC(TempBuffer), lstrlen(TempBuffer))
                ! set TLS value             
                if (TlsSetValue(TlsIndex, pString) .neqv. .FALSE.) then
                    iret = MessageBox(NULL,'TlsSetValue success'C,'DLL'C,MB_OK)
                    !write(*,*) 'TlsSetValue success'
                    !write (*,*)
                else
                   call ErrorOut("TlsSetValue")
                end if
            else
                iret = MessageBox(NULL,'Process & Thread attaching'C,'DLL'C,MB_OK)
                !write (*,*) "Process & Thread attaching"
                !write (*,*)
            end if
        case (DLL_THREAD_DETACH)            ! thread detaches 
            iret = MessageBox(NULL,'Thread Detaching'C,'DLL'C,MB_OK)
            !write(*,*) "Thread Detaching"
            !write (*,*)
            i = TlsRetrieve(TlsIndex)           ! retreive TLS data        

        case (DLL_PROCESS_DETACH)           ! process detaches 
            iret = MessageBox(NULL,'Process Detaching'C,'DLL'C,MB_OK)
            !write(*,*) "Process Detaching"
            !write (*,*)
            if (TlsFree(TlsIndex) .eqv. .FALSE.) then         !/* free TLS index           */
                call ErrorOut("TlsFree")
            else
                iret = MessageBox(NULL,'TlsIndex Freed'C,'DLL'C,MB_OK)
                !write (*,*) "TlsIndex Freed"
                !write (*,*)
            end if
   end select
   DllMain = 1
end 

