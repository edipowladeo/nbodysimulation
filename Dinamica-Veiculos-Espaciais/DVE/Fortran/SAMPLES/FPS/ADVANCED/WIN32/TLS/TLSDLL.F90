!****************************************************************************
!* MODULE:       tlsdll.f90
!****************************************************************************
use msfwin
include 'tls.fi'
end
!****************************************************************************
!Purpose: Retreive TLS values and display (printf) them
!
!Inputs:  TlsIndex - TLS index value
!
!Returns: none
!
!Calls:   TlsGetValue - Gets the TLS value from the index
!                       based on the current thread.
!****************************************************************************
integer function TlsRetrieve (TlsIndex1)
!MS$ ATTRIBUTES STDCALL, ALIAS :'_TlsRetrieve@4' :: TlsRetrieve
use msfwin

integer         TlsIndex1
integer*4       tlsvals
character*50    newstr
character*70    mesbuf
character*512   TempString
    
   tlsvals = TlsGetValue(TlsIndex1)   ! get the TLS value 
   if (tlsvals == 0) then
      call ErrorOut("TlsGetValue"C)
   else
      iret = ConvertFToCString(TempString  ,tlsvals)
      i = lstrcpy(newstr, TempString)
      i  = lstrcpy(mesbuf,  'TLS value = 'C)
      i = lstrcat(mesbuf, newstr)
      iret = MessageBox(NULL,mesbuf,'DLL - TlsRetrieve'C,MB_OK)
        
   end if
   TlsRetrieve = 1
   return
end



!*************************************************************************
!Purpose: Allow DllMain to be executed for each thread
!
!Inputs:  none
!
!Returns: none
!
!Calls:   none
!*************************************************************************
integer function TlsInit ()
!MS$ ATTRIBUTES STDCALL, ALIAS : '_TlsInit@0' :: TlsInit
use msfwin
   TlsInit = 1
   iret = MessageBox(NULL,'TLSINIT'C,'DLL - TlsInit'C,MB_OK)
   return
end 



