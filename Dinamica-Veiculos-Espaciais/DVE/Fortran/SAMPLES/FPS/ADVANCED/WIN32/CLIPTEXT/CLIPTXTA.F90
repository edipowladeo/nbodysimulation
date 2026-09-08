!/****************************************************************************
!
!    FUNCTION: MainWndProc(HWND, unsigned, WORD, LONG)               
!
!    PURPOSE:  Processes messages
!
!    MESSAGES:
!
!        WM_COMMAND    - message from menu
!        WM_INITMENU   - initialize menu
!        WM_PAINT      - update window
!        WM_DESTROY    - destroy window
!
!    COMMENTS:
!
!        WM_INITMENU - when this message is received, the application checks
!        to see if there is any text data in the clipboard, and enables or
!        disables the Paste menu item accordingly.
!
!        Seclecting the Copy menu item will send the text "Hello Windows" to
!        the clipboard.
!
!        Seclecting the Paste menu item will copy whatever text is in the
!        clipboard to the application window.
!
!****************************************************************************/

integer*4 function MainWndProc(hWnd, message, wParam, lParam)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MainWndProc@16' :: MainWndProc
use msfwin
use clipinc
interface
subroutine OutOf_Memory()
end subroutine OutOf_Memory

integer(4) function About( a,b,c,d ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_About@16' :: About
integer a
integer b
integer c
integer d
end function About
end interface

integer*4               hWnd, message, wParam, lParam
integer                 hDC
type(T_PAINTSTRUCT)     ps
type(T_RECT)            rectClient
integer*4               lpszText
integer ret
logical(4)              bret
character*512           TempText
character*100           lpszDlgName
integer*4               dLen

select case (message)

    case (WM_INITMENU)
        if (wParam == GetMenu(hWnd)) then
            if (OpenClipboard(hWnd) .eqv. .TRUE.) then
                if ((IsClipboardFormatAvailable(CF_TEXT) .OR.     &
                    IsClipboardFormatAvailable(CF_OEMTEXT)) .eqv. .TRUE.) then
                    bret = EnableMenuItem(wParam, IDM_PASTE, MF_ENABLED)
                else
                    bret = EnableMenuItem(wParam, IDM_PASTE, MF_GRAYED)
                    bret = CloseClipboard()
                    MainWndProc = 1
                    return
                end if
            else                ! /* Clipboard is not available */
                MainWndProc = 0
                return
            end if
        end if          
        MainWndProc = 1
        return

    case (WM_COMMAND)
        select case (INT4(LoWord(wParam)))
            case (IDM_ABOUT)
                lpszDlgName = "AboutBox"C
                ret = DialogBoxParam(hInst, LOC(lpszDlgName),hWnd,&
                                     LOC(About), 0)

                !/* file menu commands */
            case (IDM_NEW, IDM_OPEN, IDM_SAVE, IDM_SAVEAS,IDM_PRINT)
                ret = MessageBox (                                &
                        GetFocus (),                              &
                        "Command not implemented."C,              &
                        "ClipText Sample Application"C ,          &
                        IOR(MB_ICONASTERISK , MB_OK)              &
                      )

            case (IDM_EXIT)
                bret = DestroyWindow(hWnd)
    
              !/* edit menu commands */

            case (IDM_UNDO, IDM_CLEAR)
                ret = MessageBox (                                &
                        GetFocus (),                              &
                        "Command not implemented."C,              &
                        "ClipText Sample Application"C ,          &
                        IOR (MB_ICONASTERISK , MB_OK)             &
                       )

            case (IDM_CUT, IDM_COPY)
                if (hText .NE. NULL) then

                    !  /* Allocate memory and copy the string to it */
                    hData = GlobalAlloc(INT4(GMEM_DDESHARE), GlobalSize (hText))
                    if ( hData == 0) then
                        call OutOf_Memory()
                        MainWndProc = 1
                        return
                    end if
                    lpData = GlobalLock(hData)
                    if ( lpData == 0) then
                        call OutOf_Memory()
                        MainWndProc = 1
                        return
                    end if
                    lpszText = GlobalLock (hText)
                    if ( lpszText == 0) then
                        call OutOf_Memory()
                        MainWndProc = 1
                        return
                    end if
                    
                    dLen = GlobalSize(hText)
                    
                    call CopyMemory(lpData,lpszText,dLen)

                    bret = GlobalUnlock (hData)
                    bret = GlobalUnlock (hText)

                 !/* Clear the current contents of the clipboard, and set
                 !* the data handle to the new string.
                 !*/

                    if (OpenClipboard(hWnd) .neqv. .FALSE.) then
                        bret = EmptyClipboard()
                        ret = SetClipboardData(CF_TEXT, hData)
                        bret = CloseClipboard()
                    end if
                    hData = NULL

                    if (LoWord(wParam) == IDM_CUT) then
                        ret = GlobalFree (hText)
                        hText = NULL
                        bret = EnableMenuItem(GetMenu (hWnd),      &
                                            IDM_CUT, MF_GRAYED)
                        bret = EnableMenuItem(GetMenu(hWnd),       &
                                            IDM_COPY, MF_GRAYED)
                        bret = InvalidateRect (hWnd, null_rect, .TRUE.)
                        bret = UpdateWindow (hWnd)
                    end if
                end if
                MainWndProc = 1
                return

            case (IDM_PASTE)
                if (OpenClipboard(hWnd) .eqv. .TRUE.) then

                    !  /* get text from the clipboard */
                    hClipData = GetClipboardData(CF_TEXT)
                    if (hClipData == 0) then
                        bret = CloseClipboard()
                        goto 1001
                    end if

                    if (hText .ne. NULL) then
                       ret = GlobalFree(hText)
                    end if
                    hText = GlobalAlloc(GMEM_MOVEABLE, GlobalSize(hClipData))
                    if (hText == 0) then
                        call OutOf_Memory()
                        bret = CloseClipboard()
                        goto 1001
                    end if
                    lpClipData = GlobalLock(hClipData)
                    if (lpClipData == 0) then
                       call OutOf_Memory()
                       bret = CloseClipboard()
                       goto 1001
                    end if
                    lpszText = GlobalLock(hText)
                    if (lpszText == 0) then
                        call OutOf_Memory()
                        bret = CloseClipboard()
                        goto 1001
                    end if
                    
                    dLen = GlobalSize(hClipData)

                    call CopyMemory(lpszText,lpClipData,dLen)

                    ret = GlobalUnlock(hClipData)
                    bret = CloseClipboard()
                    ret = GlobalUnlock(hText)
                    bret = EnableMenuItem(GetMenu(hWnd), IDM_CUT,  &
                                        MF_ENABLED)
                    bret = EnableMenuItem(GetMenu(hWnd), IDM_COPY, &
                                        MF_ENABLED)

                    !/* copy text to the application window */

                    bret = InvalidateRect(hWnd, null_rect, .TRUE.)
                    bret = UpdateWindow(hWnd)
                    MainWndProc = 1
                    return
                else
                    MainWndProc = 0
                    return
                end if
        end select 

    case (WM_SIZE)
        bret = InvalidateRect(hWnd, null_rect, .TRUE.)

    case (WM_PAINT)
        hDC = BeginPaint (hWnd, ps)
        if (hText .ne. NULL) then
        lpszText = GlobalLock (hText)
            if (lpszText == 0) then
                call OutOf_Memory()
            else 
                bret = GetClientRect (hWnd, rectClient)
                i = ConvertFToCString (TempText, lpszText)
                ret = DrawText (hDC, TempText, -1, rectClient     &
                   , IOR(DT_EXTERNALLEADING , IOR(DT_NOPREFIX     &
                   , DT_WORDBREAK)) )
                ret = GlobalUnlock (hText)
            end if
        end if
        bret = EndPaint (hWnd, ps)

    case (WM_DESTROY)
        call PostQuitMessage(0)

    case DEFAULT
        MainWndProc = DefWindowProc(hWnd, message, wParam, lParam)
        return
end select

1001    MainWndProc = 0
return
end 





!/****************************************************************************
!
!    FUNCTION: About(HWND, unsigned, WORD, LONG)
!
!    PURPOSE:  Processes messages for "About" dialog box
!
!    MESSAGES:
!
!        WM_INITDIALOG - initialize dialog box
!        WM_COMMAND    - Input received
!
!****************************************************************************/

integer*4  function  About( hDlg, message, wParam, lParam)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_About@16' :: About
use msfwin
integer hDlg, message, wParam, lParam

lparam = lparam
select case (message)
    case (WM_INITDIALOG)
          About = 1
          return

    case (WM_COMMAND)
        if (LoWord(wParam) == IDOK                              &
                .OR. LoWord(wParam) == INT2(IDCANCEL)) then
            ret = EndDialog(hDlg, TRUE)
            About = 1
            return
        end if
end select

About = 0
return
end 

!/****************************************************************************
!
!    FUNCTION: OutOf_Memory()
!
!    PURPOSE:  Displays warning message
!
!****************************************************************************/
subroutine OutOf_Memory()
use msfwin
integer*4   ret

ret = MessageBox(                                                 &
      GetFocus(),                                                 &
      "Out of Memory"C,                                           &
      ""C,                                                        &
      IOR ( MB_ICONHAND , MB_SYSTEMMODAL) )
return
end 
