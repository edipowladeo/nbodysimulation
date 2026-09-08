 
!/******************************************************************************\
!*       This is a part of the Microsoft Source Code Samples. 
!*       Copyright (C) 1993 Microsoft Corporation.
!*       All rights reserved. 
!*       This source code is only intended as a supplement to 
!*       Microsoft Development Tools and/or WinHelp documentation.
!*       See these sources for detailed information regarding the 
!*       Microsoft samples programs.
!\******************************************************************************/

!/***************************************************************************
! *                                                                         *
! *  PROGRAM     : Menu.c                                                   *
! *                                                                         *
! *  PURPOSE     : To give a demonstration of the use of popup menus, user  *
! *                defined menus and menu functions.                        *
! *                                                                         *
! *  FUNCTIONS   : WinMain()           - Calls the initialization function  *
! *                                      and enters the message loop.       *
! *                                                                         *
! *                MenuInit()          - Registers the app. window class.   *
! *                                                                         *
! *                About()             - Dialog function for the About..    *
! *                                      dialog.                            *
! *                                                                         *
! *                ShrinkBitmap()      - Shrinks a 64x64 bitmap to a size   *
! *                                      useable for a user-defined menu    *
! *                                      checkmark.                         *
! *                                                                         *
! *                HandleCreate()      - Creates a new menu and appends it  *
! *                                      to the main menu                   *
! *                                                                         *
! *                HandlePaint()       - Handles repainting the app's client*
! *                                      area                               *
! *                                                                         *
! *                HandleChangeColors()- Changes the state of the "colors"  *
! *                                      menu item.                         *
! *                                                                         *
! *                HandleDrawItem()    - Redraws the menu items in the      *
! *                                      "colors" menu                      *
! *                                                                         *
! *                HandlePopupMenu()   - handles display of the "floating"  *
! *                                      popup.                             *
! *                                                                         *
! *                MenuWndProc()       - Window function for the app.       *
! *                                                                         *
! *                                                                         *
! ***************************************************************************/
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

!/****************************************************************************
! *                                                                          *
! *  FUNCTION   : WinMain(HANDLE, HANDLE, LPSTR, int)                        *
! *                                                                          *
! *  PURPOSE    : Creates the main app. window, calls an initialization      *
! *               function and enters the message loop.                      *
! *                                                                          *
! ****************************************************************************/
integer*4 function WinMain( hInstance, hPrevInstance, lpCmdLine, nCmdShow )
!MS$ATTRIBUTES STDCALL, ALIAS : '_WinMain@16' :: WinMain
use msfwin
use menuinc

interface 
integer(4) function MenuWndProc ( hwnd, message, wParam, lParam)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MenuWndProc@16' :: MenuWndProc
integer*4   hwnd 
integer*4   message 
integer*4   wParam 
integer*4   lParam 
end function MenuWndProc
end interface

integer*4   hInstance, hPrevInstance, lpCmdLine, nCmdShow
type (T_WNDCLASS)  wc
integer*4   hWnd
type (T_MSG) message                         
logical(4)  bret
character*100  lpszClassName, lpszMenuName, lpszIconName

lpcmdline = lpcmdline

!/* Register main window class if this is the first instance of the app. */
lpszClassName ="menu"C
lpszMenuName = "MenuMenu"C
lpszIconName ="menu"C
if (hPrevInstance == 0) then
    wc%style         = 0
    wc%lpfnWndProc   = LOC(MenuWndProc)
    wc%hInstance     = hInstance
    wc%hIcon         = LoadIcon (hInstance, LOC(lpszIconName))
    wc%hCursor       = LoadCursor (NULL, IDC_ARROW)
    wc%hbrBackground = GetStockObject (WHITE_BRUSH)
    wc%lpszMenuName  = LOC(lpszMenuName)
    wc%lpszClassName = LOC(lpszClassName)

    if (RegisterClass (wc) == 0 ) then
        WinMain = 0
        return
    end if
endif

hInst = hInstance

!/* Create the app. window */
hWnd = CreateWindow (                                             &
                    lpszClassName,                                &
                     "Menu Example"C,                             &
                    INT4(WS_OVERLAPPEDWINDOW),                    &
                    CW_USEDEFAULT,                                &
                    CW_USEDEFAULT,                                &
                    CW_USEDEFAULT,                                &
                    CW_USEDEFAULT,                                &
                    NULL,                                         &
                    NULL,                                         &
                    hInstance,                                    &
                    NULL)

if (hWnd == 0) then
    WinMain = 0
    return
end if

bret = ShowWindow (hWnd, nCmdShow)
bret = UpdateWindow (hWnd)

do while (GetMessage (message, NULL, 0, 0))
  !/* Since we have no accelerators, no need to call
  ! * TranslateAccelerator here.
  ! */  
    bret = TranslateMessage (message)
    ret = DispatchMessage (message)
end do

WinMain = message%wParam
return
end



!/****************************************************************************
! *                                                                          *
! *  FUNCTION   : About (hDlg, message, wParam, lParam)                      *
! *                                                                          *
! *  PURPOSE    : Dialog function for the About menu... dialog.              *
! *                                                                          *
! ****************************************************************************/
integer*4 function About(hDlg, message, wParam, lParam )
!MS$ ATTRIBUTES STDCALL, ALIAS : '_About@16' :: About
use msfwin
use menuinc
integer*4 hDlg
integer*4 message
integer*4 wParam
integer*4 lParam
logical(4)  bret

lParam = lParam 
select case (message)
    case (WM_INITDIALOG)
        About = 1
        return

    case (WM_COMMAND)
          !// LoWord added for portability
          if (LoWord(wParam) == IDOK) then
              bret = EndDialog(hDlg,0)
              About = 1
              return
          end if
end select
About = 0
return
end




