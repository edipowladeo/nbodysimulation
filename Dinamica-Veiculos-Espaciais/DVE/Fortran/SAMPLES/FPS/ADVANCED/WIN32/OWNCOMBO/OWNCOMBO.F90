 
!******************************************************************************\
!*       This is a part of the Microsoft Source Code Samples. 
!*       Copyright (C) 1993 Microsoft Corporation.
!*       All rights reserved. 
!*       This source code is only intended as a supplement to 
!*       Microsoft Development Tools and/or WinHelp documentation.
!*       See these sources for detailed information regarding the 
!*       Microsoft samples programs.
!******************************************************************************/

!***************************************************************************
!*                                                                         *
!*  PROGRAM     : OwnCombo.f90                                             *
!*                                                                         *
!*  PURPOSE     : Illustrates the use of functions and messages for        *
!*                combo boxes and owner-draw control styles.               *
!*                                                                         *
!*  FUNCTIONS   : WinMain                - Creates the app. window and     *
!*                                         enters the message loop.        *
!*                                                                         *
!*                OwnComboInit           - Registers the main window class *
!*                                                                         *
!*                About                  - Dialog function for the About   *
!*                                         dialog.                         *
!*                                                                         *
!*                OwnComboWndProc        - Window function for app. It     *
!*                                         handles the menu selections     *
!*                                         and processes the other window  *
!*                                         messages.                       *
!*                                                                         *
!*                DrawEntireItem         - Handles the drawing of a list   *
!*                                         list box or combo box item.     *
!*                                                                         *
!*                HandleSelectionState   - Handles the selecting/deselect- *
!*                                         ing of a list box or combo box  *
!*                                         item.                           *
!*                                                                         *
!*                HandleFocusState       - Handles the getting/losing of   *
!*                                         the input focus by a list box   *
!*                                                                         *
!*                ListBoxExample         - Dialog function for the         *
!*                                         owner-draw list box example.    *
!*                                                                         *
!*                ComboBoxExample        - Dialog function for the text    *
!*                                         combo dialog.                   *
!*                                                                         *
!*                OwnerComboBoxExample   - Dialog fubction for the drop-   *
!*                                         down-list combobox with         *
!*                                         ownerdraw.                      *
!*                                                                         *
!***************************************************************************/
interface
integer(4) function WinMain (hInstance, hPrevInstance, lpszCmdLine, nCmdShow)
!MS$ATTRIBUTES STDCALL, ALIAS : '_WinMain@16' :: WinMain
integer(4) hInstance
integer(4) hPrevInstance
integer(4) lpszCmdLine
integer(4) nCmdShow
end function WinMain
end interface
end


!****************************************************************************
!*                                                                          *
!*  FUNCTION   : WinMain(HANDLE, HANDLE, LPSTR, int)                        *
!*                                                                          *
!*  PURPOSE    : Creates the app. window and enters the message loop.       *
!*                                                                          *
!****************************************************************************/

integer*4 function WinMain(hInstance, hPrevInstance, lpCmdLine, nCmdShow)
!MS$ATTRIBUTES STDCALL, ALIAS : '_WinMain@16' :: WinMain
use msfwin
use owncbinc
integer*4       hInstance, hPrevInstance, lpCmdLine, nCmdShow

interface 
integer(4) function OwnComboWndProc (hwnd, message, wParam, lParam)
!MS$ATTRIBUTES STDCALL, ALIAS : '_OwnComboWndProc@16' :: OwnComboWndProc
integer*4   hwnd 
integer*4   message 
integer*4   wParam 
integer*4   lParam 
end function
end interface

integer*4       hWnd
type (T_MSG)     mesg
type (T_WNDCLASS)    wc
integer*4   iSuccess
logical(4)  bret
character*100 lpszClassName, lpszMenuName, lpszIconNAme

lpCmdLine = lpCmdLine

lpszIconName ="owncombo"C
lpszMenuName = "OwnComboMenu"C
lpszClassName = "owncombo"C
if (hPrevInstance == 0) then
    wc%style         = 0
    wc%lpfnWndProc   = LOC(OwnComboWndProc)
    wc%hInstance     = hInstance
    wc%hIcon         = LoadIcon (hInstance, LOC(lpszIconName))
    wc%hCursor       = LoadCursor (NULL, IDC_ARROW)
    wc%hbrBackground = GetStockObject (WHITE_BRUSH)
    wc%lpszMenuName  = LOC(lpszMenuName)
    wc%lpszClassName = LOC(lpszClassName)

    iSuccess = RegisterClass (wc)

    if (isuccess == 0) then 
        ierror = GetLastError ()
        WinMain = 0
        return
    end if
end if

hInst = hInstance

!/* Create the app. window */
hWnd = CreateWindow (lpszClassName,                               &
                      "Owner-draw & Combo Box Example"C,          &
                      INT4(WS_OVERLAPPEDWINDOW),                  &
                      CW_USEDEFAULT,                              &
                      CW_USEDEFAULT,                              &
                      CW_USEDEFAULT,                              &
                      CW_USEDEFAULT,                              &
                      NULL,                                       &
                      NULL,                                       &
                      hInstance,                                  &
                      NULL)

if (hWnd == 0) then
    WinMain = 0
    return
end if


ret = ShowWindow (hWnd, nCmdShow)

do while (GetMessage (mesg, NULL, 0, 0))
    bret = TranslateMessage (mesg)
    ret = DispatchMessage (mesg)
end do

WinMain = mesg%wParam
return
end







