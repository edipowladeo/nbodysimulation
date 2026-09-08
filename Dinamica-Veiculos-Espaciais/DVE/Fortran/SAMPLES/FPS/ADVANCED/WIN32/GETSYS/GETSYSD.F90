subroutine doLocalTime (hwnd)
!MS$ATTRIBUTES VALUE :: hwnd
use gtsysinc
integer     hwnd
type (T_SYSTEMTIME)      st
integer*4   ret

ret = SetDlgItemText (hwnd, DID_TEXT, "SYSTEMTIME"C)

  !/*******************************************************/
  !/*******************************************************/
call GetLocalTime (st)
  !/*******************************************************/
  !/*******************************************************/

write(buffer,400)   st%wYear         
400   format('wYear         ', I5)
ret = SendDlgItemMessage (hwnd, DID_LISTBOX, LB_ADDSTRING, 0,     &
            LOC(buffer))
write(buffer,410)   st%wMonth        
410 format('wMonth        ', I5)
ret = SendDlgItemMessage (hwnd, DID_LISTBOX, LB_ADDSTRING, 0,     &
            LOC(buffer))
write(buffer,420)   st%wDayOfWeek    
420   format('wDayOfWeek    ', I5)
ret = SendDlgItemMessage (hwnd, DID_LISTBOX, LB_ADDSTRING, 0,     &
            LOC(buffer))
write(buffer,430)   st%wDay          
430   format('wDay          ', I5)
ret = SendDlgItemMessage (hwnd, DID_LISTBOX, LB_ADDSTRING, 0,     &
            LOC(buffer))
write(buffer,440)   st%wHour         
440   format('wHour         ', I5)
ret = SendDlgItemMessage (hwnd, DID_LISTBOX, LB_ADDSTRING, 0,     &
            LOC(buffer))
write(buffer,450)   st%wMinute       
450   format('wMinute       ', I5)
ret = SendDlgItemMessage (hwnd, DID_LISTBOX, LB_ADDSTRING, 0,     &
            LOC(buffer))
write(buffer,460)   st%wSecond       
460   format('wSecond       ', I5)
ret = SendDlgItemMessage (hwnd, DID_LISTBOX, LB_ADDSTRING, 0,     &
            LOC(buffer))
write(buffer,470)   st%wMilliseconds 
470   format('wMilliseconds ', I5)
ret = SendDlgItemMessage (hwnd, DID_LISTBOX, LB_ADDSTRING, 0,     &
                LOC(buffer))
return
end 



subroutine doTime (hwnd)
!MS$ATTRIBUTES VALUE :: hwnd
use gtsysinc
integer     hwnd
type (T_SYSTEMTIME)      st
integer*4   ret

ret = SetDlgItemText (hwnd, DID_TEXT, "SYSTEMTIME"C)

  !/*******************************************************/
  !/*******************************************************/
call GetSystemTime (st)
  !/*******************************************************/
  !/*******************************************************/

write(buffer,500)   st%wYear
500   format ('wYear         ', I5)
ret = SendDlgItemMessage (hwnd, DID_LISTBOX, LB_ADDSTRING, 0,     &
                        LOC(buffer))
write(buffer,510)   st%wMonth      
510   format('wMonth        ', I5)
ret = SendDlgItemMessage (hwnd, DID_LISTBOX, LB_ADDSTRING, 0,     &
                 LOC(buffer))
write(buffer,520)   st%wDayOfWeek  
520   format('wDayOfWeek    ', I5)
ret = SendDlgItemMessage (hwnd, DID_LISTBOX, LB_ADDSTRING, 0,     &
                LOC(buffer))
write(buffer,530)   st%wDay        
530   format('wDay          ', I5)
ret = SendDlgItemMessage (hwnd, DID_LISTBOX, LB_ADDSTRING, 0,     &
                LOC(buffer))
write(buffer,540)   st%wHour       
540   format('wHour         ', I5)
ret = SendDlgItemMessage (hwnd, DID_LISTBOX, LB_ADDSTRING, 0,     &
                 LOC(buffer))
write(buffer,550)   st%wMinute     
550   format('wMinute       ', I5)
ret = SendDlgItemMessage (hwnd, DID_LISTBOX, LB_ADDSTRING, 0,     &
                 LOC(buffer))
write(buffer,560)   st%wSecond     
560   format('wSecond       ', I5)
ret = SendDlgItemMessage (hwnd, DID_LISTBOX, LB_ADDSTRING, 0,     &
                LOC(buffer))
write(buffer,570)   st%wMilliseconds
570   format('wMilliseconds ', I5)
ret = SendDlgItemMessage (hwnd, DID_LISTBOX, LB_ADDSTRING, 0,     &
                    LOC(buffer))
return
end 
