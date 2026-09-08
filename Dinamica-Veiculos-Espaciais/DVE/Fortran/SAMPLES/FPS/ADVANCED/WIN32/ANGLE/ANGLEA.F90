!/**************************************************************************\
!*
!*  function:  DlgProc()
!*
!*  input parameters:  normal window procedure parameters.
!*
!*  global variables:
!*   hwndmain - the main window.  also the parent of this dialog
!*
!\**************************************************************************/
integer*4 function DlgProc(hwnd, message, wParam, lParam) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_DlgProc@16' :: DlgProc
use msfwina
use anginc
integer hwnd, message, wParam, lParam
logical(4)  bret
integer hwndParent
type (T_RECT) rectp
character*100  lpszEditText

! Unreferenced variables
    lparam = lparam

    select case (message)

        !/**********************************************************************\
        !*  WM_INITDIALOG
        !*
        !* Fill the entry fields with sensible original values.
        !\**********************************************************************/
    case (WM_INITDIALOG)
        hWndParent = GetParent (hwnd)
        lret = GetClientRect(hwndParent, rectp)
        ret = SendMessage(hwndParent, WM_SIZE, 0,(rectp%right - rectp%left))
        lret = InvalidateRect(hwndParent, null_rect, .FALSE.)
        lpszEditText = "100"C
        bret = SetDlgItemText(hwnd, DID_X, lpszEditText)
        lpszEditText = "100"C
        bret = SetDlgItemText(hwnd, DID_Y, lpszEditText)
        lpszEditText = "50"C
        bret = SetDlgItemText(hwnd, DID_RADIUS, lpszEditText)
        lpszEditText = "0.0"C
        bret = SetDlgItemText(hwnd, DID_START, lpszEditText)
        lpszEditText = "270.0"C
        bret = SetDlgItemText(hwnd, DID_SWEEP, lpszEditText)

        DlgProc = 1
        return



        !/**********************************************************************\
        !*  WM_COMMAND, DID_DRAW
        !*
        !* Invalidate the main window so that we force a repaint.
        !\**********************************************************************/
    case (WM_COMMAND)
         if (LOWORD(wParam) == DID_DRAW) then
             hWndParent = GetParent (hwnd)
             bret = InvalidateRect(hwndParent, NULL_RECT, .TRUE.)
         end if
         DlgProc = 0
         return
    end select   !/* end switch */
    DlgProc = 0
    return

end function DlgProc

