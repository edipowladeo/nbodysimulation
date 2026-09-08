subroutine doDirectory (hwnd)
!MS$ATTRIBUTES VALUE :: hwnd
use gtsysinc
integer                 hwnd
character*(MAX_PATH)    buffer1
integer*4   ret

ret = SetDlgItemText (hwnd, DID_TEXT, "System Directory"C)

!/*******************************************************/
!/*******************************************************/
ret = GetSystemDirectory (buffer1, MAX_PATH)
!/*******************************************************/
!/*******************************************************/

ret = SendDlgItemMessage (hwnd, DID_LISTBOX, LB_ADDSTRING, 0,     &
                     LOC(buffer1))

return
end 


subroutine doInfo(hwnd)
!MS$ATTRIBUTES VALUE :: hwnd
use gtsysinc
integer     hwnd
type (T_SYSTEM_INFO)     si
integer*4   ret

ret = SetDlgItemText (hwnd, DID_TEXT, "SYSTEM_INFO"C)

!/*******************************************************/
!/*******************************************************/
call GetSystemInfo (si)
!/*******************************************************/
!/*******************************************************/

write(buffer,300)   si%dwOemId                    
300   format('dwOemId             ', I5)
ret = SendDlgItemMessage (hwnd, DID_LISTBOX, LB_ADDSTRING, 0,     &
             LOC(buffer))
write(buffer,310)   si%dwPageSize                 
310   format('dwPageSize          ', I5)
ret = SendDlgItemMessage (hwnd, DID_LISTBOX, LB_ADDSTRING, 0,     &
             LOC(buffer))
write(buffer,320)  si%lpMinimumApplicationAddress 
320   format('lpMinimumApplicationAddress ',Z8)
ret = SendDlgItemMessage (hwnd, DID_LISTBOX, LB_ADDSTRING, 0,     &
             LOC(buffer))
write(buffer,330)  si%lpMaximumApplicationAddress 
330   format('lpMaximumApplicationAddress ',Z8)  
ret = SendDlgItemMessage (hwnd, DID_LISTBOX, LB_ADDSTRING, 0,     &
             LOC(buffer))
write(buffer,340)   si%dwActiveProcessorMask      
340   format('dwActiveProcessorMask ', I5)
ret = SendDlgItemMessage (hwnd, DID_LISTBOX, LB_ADDSTRING, 0,     &
             LOC(buffer))
write(buffer,350)   si%dwNumberOfProcessors       
350   format('dwNumberOfProcessors  ', I5)
ret = SendDlgItemMessage (hwnd, DID_LISTBOX, LB_ADDSTRING, 0,     &
             LOC(buffer))
write(buffer,360)   si%dwProcessorType            
360   format('dwProcessorType       ', I5)
ret = SendDlgItemMessage (hwnd, DID_LISTBOX, LB_ADDSTRING, 0,     &
             LOC(buffer))

!$  if defined (STILL_IN_SYSINFO)
write(buffer,370)   si%dwAllocationGranularity                
370   format('dwAllocationGranularity ', I5)
ret = SendDlgItemMessage (hwnd, DID_LISTBOX, LB_ADDSTRING, 0,     &
             LOC(buffer))
write(buffer,380)   si%dwReserved                
380   format('dwReserved           ', I5)
ret = SendDlgItemMessage (hwnd, DID_LISTBOX, LB_ADDSTRING, 0,     &
             LOC(buffer))
!$  endif

return
end 

