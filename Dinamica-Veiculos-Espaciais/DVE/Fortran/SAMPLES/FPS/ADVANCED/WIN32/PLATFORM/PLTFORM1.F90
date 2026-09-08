!/****************************************************************************
!
!        FUNCTION: AboutDlgProc(HWND, UINT, WPARAM, LPARAM)
!
!        PURPOSE:  Processes messages for "About" dialog box
!
!        MESSAGES:
!
!        WM_COMMAND    - Input received
!
!        COMMENTS:
!
!        Display version information from the version section of the
!        application resource.
!
!        Wait for user to click on "Ok" button, then close the dialog box.
!
!****************************************************************************/
integer*4 function AboutDlgProc( hDlg, message, uParam, lParam )
!MS$ATTRIBUTES STDCALL, ALIAS : '_AboutDlgProc@16' :: AboutDlgProc
use msfwin
use platinc
integer     hDlg        !// window handle of the dialog box
integer     message     !// type of message
integer     uParam      !// message-specific information
integer     lParam
common      hinst

integer*4   ret
logical     bret

lParam = lParam

select case (message)
    case (WM_INITDIALOG)   ! message: initialize dialog box
       AboutDlgProc = 1
       return
    case (WM_COMMAND)                      ! message: received a command
        if ((LoWord(uParam) == IDOK)   &     ! "OK" box selected?
             .OR. (LoWord(uParam) == IDCANCEL)) then  ! System menu close command?
            ret = EndDialog(hDlg, TRUE)        ! Exit the dialog
            bret = DeleteObject (hDlg) !hfontDlg
            AboutDlgProc = 1
            return
        end if
end select  ! message
AboutDlgProc = 0 ! Didn't process the message
return
end 

