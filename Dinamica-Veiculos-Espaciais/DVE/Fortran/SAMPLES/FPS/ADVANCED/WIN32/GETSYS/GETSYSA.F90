!/**************************************************************************\
!*
!*  function:  MainDlgProc()
!*
!*  input parameters:  standard window procedure parameters.
!*
!\**************************************************************************/
integer*4  function MainDlgProc(hwnd, message, wParam, lParam)
!MS$ATTRIBUTES STDCALL, ALIAS : '_MainDlgProc@16' :: MainDlgProc
use gtsysinc
integer     hwnd, message, wParam, lParam

include 'getsys.fi'
integer*4   ret
lParam = lParam
select case (message)

    !/********************************************************************\
    !* WM_SYSCOMMAND
    !*
    !* ignore all syscommand messages, except for SC_CLOSE.
    !*  on this one, call EndDialog().
    !\********************************************************************/
    case (WM_SYSCOMMAND)
        if (wParam == SC_CLOSE) then
            ret = EndDialog (hwnd, TRUE)
            MainDlgProc = TRUE
            return
        else
            MainDlgProc = FALSE
            return
        end if


    !/********************************************************************\
    !* WM_COMMAND
    !*
    !* When the different buttons are hit, clear the list box, disable
    !*  updating to it, call the function which will fill it, reenable
    !*  updating, and then force a repaint.
    !*
    !\********************************************************************/
    case (WM_COMMAND)

    !/* if the list box sends back messages, return.  Otherwise we will
    ! *  clear it out, and that is not what we want to do at this point.
    ! */
        if (LoWord(wParam)==DID_LISTBOX) then 
            MainDlgProc = TRUE
            return
        end if

        ret = SendDlgItemMessage (hwnd, DID_LISTBOX,              &
                            WM_SETREDRAW,    FALSE, 0)
        ret = SendDlgItemMessage (hwnd, DID_LISTBOX,              &
                            LB_RESETCONTENT, 0, 0)

    !/* switch on the control ID of the button that is pressed. */
        select case (INT4(LoWord(wParam)))
            case (DID_SYSCOLORS)
                call doSysColors (hwnd) 
            case (DID_DIRECTORY) 
                call doDirectory (hwnd) 
            case (DID_INFO)
                call doInfo (hwnd) 
            case (DID_METRICS) 
                call doMetrics (hwnd) 
            case (DID_PALETTE)
                call doPalette (hwnd) 
            case (DID_LOCALTIME) 
                call doLocalTime (hwnd) 
            case (DID_TIME)
                call doTime (hwnd) 
        end select !/* end switch (LOWORD()) */

        ret = SendDlgItemMessage (hwnd, DID_LISTBOX,              &
                                    WM_SETREDRAW, TRUE, 0)
        ret = InvalidateRect (GetDlgItem (hwnd, DID_LISTBOX),     &
                                    NULL_RECT, .TRUE.)
        MainDlgProc = TRUE
        return

    case DEFAULT
        MainDlgProc = FALSE
        return
end select !/* end switch(message) */
end 






!/**************************************************************************\
!*
!*  functions:  do...()
!*
!* In all of the functions that follow, first set the text int the static
!*  text field to label the contents of the list box.  Then, query the
!*  desired system information, format it into strings, and add those strings
!*  to the listbox.
!*
!*  input parameters:  HWND - window handle for the dialog box.
!*  global variables:  buffer - array of char's to hold string w/ info.
!*
!\**************************************************************************/

subroutine doSysColors (hwnd)
!MS$ATTRIBUTES VALUE :: hwnd
use gtsysinc
integer     hwnd
integer     answer
integer*4   ret

ret = SetDlgItemText (hwnd, DID_TEXT, "System Colors"C)

do i = 1, NSYSCOLORS
!/*******************************************************/
!/*******************************************************/
    answer = GetSysColor (SysColors(i)%Val)
!/*******************************************************/
!/*******************************************************/

    write(buffer, 200)  SysColors(i)%String, answer
200       format (A27, Z)
    ret = SendDlgItemMessage (hwnd, DID_LISTBOX, LB_ADDSTRING, 0, &
                            LOC(buffer))
end do
return
end 


