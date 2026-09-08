
!/******************************************************************************\
!*       This is a part of the Microsoft Source Code Samples. 
!*       Copyright (C) 1993 Microsoft Corporation.
!*       All rights reserved. 
!*       This source code is only intended as a supplement to 
!*       Microsoft Development Tools and/or WinHelp documentation.
!*       See these sources for detailed information regarding the 
!*       Microsoft samples programs.
!\******************************************************************************/

!/**************************************************************************\
!* Module Name: mdi.f90
!*
!* MDI demonstration
!*   +   Associating data with a MDI window (using Set/GetWindowLong )
!*
!* Dependencies:
!*
!*   (#defines)
!*   (#includes)
!*       MDI.H
!*
!\**************************************************************************/

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

!/***************************************************************************\
!* WinMain
!*
!*
!* History:
!* 11-Feb-1992   Petrus Wong []
!*   Added conditional compile statement for internal build environment.
!* 04-17-91      ????      Created.
!\***************************************************************************/
integer*4 function WinMain(hInstance, hPrevInstance, lpCmdLine,  nShowCmd)
!MS$ATTRIBUTES STDCALL, ALIAS : '_WinMain@16' :: WinMain
use mdiinc
integer*4       hInstance, hPrevInstance, lpCmdLine, nShowCmd

interface 
integer(4) function InitializeApp
end function InitializeApp
end interface


type (T_MSG)     mesg
integer        hAccel
integer*4      ret
logical(4)     bret


hInstance = hInstance
hPrevInstance = hPrevInstance
lpCmdLine = lpCmdLine
nShowCmd = nShowCmd

ghModule  = GetModuleHandle(NULL)
if (InitializeApp() == 0) then
    ret = MessageBox(ghwndMain,                         &
                    "MDI: InitializeApp failure!"C,     &
                    "Error"C, MB_OK)
    WinMain = 0
    return
end if

hAccel = LoadAccelerators (ghModule, MakeIntResource(ACCEL_ID))
if (hAccel == 0) then
    ret = MessageBox(ghwndMain, "MDI: Load Accel failure!"C, &
                                "Error"C, MB_OK)
end if


do while (GetMessage(mesg, NULL, 0, 0))
    if ((TranslateAccelerator(ghwndMain, hAccel, mesg) == 0)&
       .AND.(TranslateMDISysAccel( ghwndClient, mesg) .EQV. .FALSE.))&
                    then
        bret = TranslateMessage(mesg)
        ret = DispatchMessage(mesg)
    end if
end do

WinMain = 1
return
end 


!/***************************************************************************\
!* InitializeApp
!*
!* History:
!* 11-Feb-1992   Petrus Wong []
!*   Name changes.
!* 09-09-91      Created.
!\***************************************************************************/

integer*4 function InitializeApp ()
use mdiinc

interface 
integer*4 function MainWndProc  (hwnd, message, wParam, lParam)  
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MainWndProc@16' :: MainWndProc
integer*4   hwnd 
integer*4   message 
integer*4   wParam 
integer*4   lParam 
end function MainWndProc
end interface

interface 
integer(4) function MDIWndProc (hwnd, message, wParam, lParam)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MDIWndProc@16' :: MDIWndProc
integer*4   hwnd 
integer*4   message 
integer*4   wParam 
integer*4   lParam 
end function MDIWndProc
end interface
interface 
integer(4) function TextWndProc (hwnd, message, wParam, lParam)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_TextWndProc@16' :: TextWndProc
integer*4   hwnd 
integer*4   message 
integer*4   wParam 
integer*4   lParam 
end function TextWndProc
end interface

type (T_WNDCLASS)    wc
integer*4   ret
character*100  lpszClassName, lpszMenuName, lpszAppName

wc%style            = CS_OWNDC
wc%lpfnWndProc      = LOC(MainWndProc)
wc%cbClsExtra       = 0
wc%cbWndExtra       = 4  
wc%hInstance        = ghModule
wc%hIcon            = LoadIcon(NULL, IDI_APPLICATION)
wc%hCursor          = LoadCursor(NULL, IDC_ARROW)
wc%hbrBackground    = (COLOR_APPWORKSPACE)
lpszMenuName = "MainMenu"C
lpszClassName ="MDIDemoClass"C
wc%lpszMenuName     = LOC(lpszMenuName)
wc%lpszClassName    = LOC(lpszClassName)

if (RegisterClass(wc) == 0) then
    InitializeApp = 0
    return 
end if

wc%lpfnWndProc      = LOC(MDIWndProc)
wc%hIcon            = LoadIcon(NULL, IDI_APPLICATION)
wc%lpszMenuName     = NULL
lpszClassName = "MDIClass"C
wc%lpszClassName    = LOC(lpszClassName)

if (RegisterClass(wc) == 0) then
    InitializeApp = 0
    return
end if

wc%style            = IOR(CS_OWNDC , IOR(CS_HREDRAW , CS_VREDRAW))
wc%lpfnWndProc      = LOC(TextWndProc)
wc%hIcon            = NULL
wc%hCursor          = LoadCursor(NULL, IDC_ARROW)
wc%hbrBackground    = (COLOR_BTNSHADOW)
wc%lpszMenuName     = NULL
lpszClassName       = "Text"C
wc%lpszClassName    = LOC(lpszClassName)

if (RegisterClass(wc) == 0) then
    InitializeApp = 0
    return
end if

lpszMenuName = "MainMenu"C
hMenu       = LoadMenu(ghModule, LOC(lpszMenuName))
lpszMenuName = "ChildMenu"C
hChildMenu  = LoadMenu(ghModule, LOC(lpszMenuName))
hMenuWindow      = GetSubMenu(hMenu, 1)
hChildMenuWindow = GetSubMenu(hChildMenu, 2)

lpszClassName = "MDIDemoClass"C
lpszAppName = "MDI Demonstration"C
ghwndMain = CreateWindowEx(0, lpszClassName,               &
                        lpszAppName,                &
      IOR(WS_OVERLAPPED, IOR(WS_CAPTION, IOR(WS_BORDER,           &
      IOR(WS_THICKFRAME, IOR(WS_MAXIMIZEBOX, IOR(WS_MINIMIZEBOX,  &
      IOR(WS_CLIPCHILDREN, IOR(WS_VISIBLE, WS_SYSMENU)))))))),    &
      80, 70, 400, 300,                                           &
      NULL, hMenu, ghModule, NULL)

if (ghwndMain == NULL) then
    InitializeApp = 0
    return
end if
! Just to verify if SetWindowLong is working
! First call sets the window value to 4
! The return value after the second SetWindowLong call should be 4
ret = SetWindowLong(ghwndMain, GWL_USERDATA, 4) 
ret = SetWindowLong(ghwndMain, GWL_USERDATA, 0)
ret = SetFocus(ghwndMain)    !/* set initial focus */
InitializeApp = 1
return
end 


