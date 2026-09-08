!****************************************************************************
!*                                                                          *
!*  FUNCTION   : About (hDlg,message, wParam, lParam)                       *
!*                                                                          *
!*  PURPOSE    : Dialog function for the About... dialog.                   *
!*                                                                          *
!****************************************************************************/
integer(4) function About (hDlg, message, wParam, lParam)
!MS$ATTRIBUTES STDCALL, ALIAS : '_About@16' :: About
use msfwin
use owncbinc
integer*4   hDlg, message, wParam, lParam

lParam = lParam
select case (message)
    case (WM_INITDIALOG)
        About = 1
        return

    case (WM_COMMAND)
        if (LoWord(wParam) == IDOK) then
            ret = EndDialog (hDlg,0)
            About = 1
            return
        end if
end select
About = 0
return
end
