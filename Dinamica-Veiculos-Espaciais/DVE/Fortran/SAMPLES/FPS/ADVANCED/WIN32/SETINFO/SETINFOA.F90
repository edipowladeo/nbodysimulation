!*************************************************************************\
!*
!*  FUNCTION:  MainWndProc (HWND, UINT, UINT, LONG)
!*
!*  PURPOSE:   To process messages.  To launch client and server threads
!*             as appropriate.
!*
!*  VARIABLES USED:
!*
!*    - hWndDlg:
!*             Global window handle for the upper dialog box
!*
!*    - hWndFileDlg:
!*             Global window handle for the lower dialog box.
!*
!*  MESSAGES:
!*
!*    WM_DESTROY      - Standard, destroys the window.
!*    WM_SIZE         - Sends messages to the two dialog boxes so that they
!*                      maintain their relative size to the client window.
!*
!*  CALLED BY:
!*
!*    WinMain();
!*
!*************************************************************************/

integer*4 function MainWndProc (hwnd, message, wParam, lParam)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MainWndProc@16' :: MainWndProc
use setinc
integer*4   hwnd, message, wParam, lParam
logical(4)  bret

select case (message)
    case (WM_SIZE)
        bret = SetWindowPos (hWndDlg, NULL, 0,0, INT4(LoWord(lParam)),   &
                            DIALOGHEIGHT, 0)
        bret = SetWindowPos (hWndFileDlg, NULL, 0,DIALOGHEIGHT,    &
                            INT4(LoWord(lParam)), INT4(HiWord(lParam)), 0)
        MainWndProc = 0
        return 

    case (WM_DESTROY) 
        call PostQuitMessage (0)
        MainWndProc = 0
        return 
end select

MainWndProc = DefWindowProc (hwnd, message, wParam, lParam)
return
end

!*************************************************************************\
!*
!*  FUNCTION:  StatusDlgProc (HWND, UINT, UINT, LONG)
!*
!*  PURPOSE:   To process messages for the upper dialog box.
!*
!*  VARIABLES USED:
!*
!*    - StepTime:
!*             A global DWORD holding the value of the sleep time between
!*             API calls.
!*
!*    - bTranslated:
!*             A local BOOL needed for GetDlgItemInt().
!*
!*  MESSAGES:
!*
!*    WM_INITDIALOG:  - Sets a "0" in the time edit field IDE_TIME.  This
!*                      is to indicate to the user that the default time
!*                      set to sleep between reporting the results of
!*                      API calls is set to 0.
!*
!*    WM_REPSTAT:     - A user defined message.  This message uses wParam
!*                      as a pointer to a string holding an API i.e.
!*                      "CreateFile()".  It uses lParam to hold a string
!*                      reporting the value of returned by the API i.e.
!*                      "ERROR_ACCESS_DENIED", or a number if the return
!*                      value isn't identified in RepStat().  The code
!*                      then places these strings in the IDE_API and
!*                      IDE_REPSTAT edit fields.
!*
!*    WM_COMMAND
!*
!*      IDM_STEP:     - Captures the time value in the IDE_TIME edit
!*                      field, and then sets that value into the
!*                      global DWORD StepTime.  This value sets
!*                      a sleep time inbetween reporting the results of
!*                      each API (making it easier for the user to read).
!*
!*  COMMENTS:
!*
!*    This procedure controls the upper dialog box of the application.
!*    The purpose of this box is to report on the API being used by
!*    the lower box, and it's return code.  It also allows you to control
!*    the speed that the application steps through these calls.  This is
!*    basically a error checking/debugging feature, but it also lends an
!*    intuitive look at the API being used.
!*
!*************************************************************************/

integer*4 function StatusDlgProc (hDlg, message, wParam, lParam)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_StatusDlgProc@16' :: StatusDlgProc
use setinc
integer*4   hDlg, message, wParam, lParam
logical(4)  bret

integer*4   bTranslated
character*512   CString

select case (message)
    case (WM_INITDIALOG)
        StepTime = 0
        bret = SetDlgItemInt (hDlg, IDE_TIME, StepTime, .FALSE.)
        StatusDlgProc = 0
        return 

    case (WM_REPSTAT)
        iret = ConvertFToCString (CString, wParam)
        bret = SetDlgItemText (hDlg, IDE_API, CString)
        iret = ConvertFToCString (CString, lParam)
        bret = SetDlgItemText (hDlg, IDE_RETSTAT,CString)
        StatusDlgProc = 0
        return

    case (WM_COMMAND)
        select case (INT4(LoWord(wParam)))
            case (IDB_STEP)
                StepTime = GetDlgItemInt (hDlg, IDE_TIME,         &
                                LOC(bTranslated), .FALSE.)
        end select
end select
StatusDlgProc = 0
return
end
