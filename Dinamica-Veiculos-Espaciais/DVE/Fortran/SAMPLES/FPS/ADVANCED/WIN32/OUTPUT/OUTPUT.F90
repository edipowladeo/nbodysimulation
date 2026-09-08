 
!/******************************************************************************\
!*       This is a part of the Microsoft Source Code Samples. 
!*       Copyright (C) 1993 Microsoft Corporation.
!*       All rights reserved. 
!*       This source code is only intended as a supplement to 
!*       Microsoft Development Tools and/or WinHelp documentation.
!*       See these sources for detailed information regarding the 
!*       Microsoft samples programs.
!\******************************************************************************/

!/****************************************************************************
!
!    PROGRAM: Output.f90
!
!    PURPOSE: Output template for Windows applications
!
!    FUNCTIONS:
!
!        WinMain() - calls initialization function, processes message loop
!        InitApplication() - initializes window data and registers window
!        InitInstance() - saves instance handle and creates main window
!        MainWndProc() - processes messages
!        About() - processes messages for "About" dialog box
!
!****************************************************************************/

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
!
!    FUNCTION: WinMain(HANDLE, HANDLE, LPSTR, int)
!
!    PURPOSE: calls initialization function, processes message loop
!
!****************************************************************************/

integer(4) function WinMain( hInstance, hPrevInstance, lpCmdLine,  nCmdShow )
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WinMain@16' :: WinMain
use msfwina
use outinc
include 'output.fi'
integer        hInstance, hPrevInstance, lpCmdLine, nCmdShow
type (T_MSG)     mesg
logical(4)     bret


lpcmdline = lpcmdline
   
if (hPrevInstance == 0) then
    if (InitApplication(hInstance) == 0) then
        WinMain = 0
        return
    end if
end if

if (InitInstance(hInstance, nCmdShow) == 0) then
    WinMain = 0
    return
end if

do while (GetMessage(mesg, NULL, 0, 0))
    bret = TranslateMessage(mesg)
    ret = DispatchMessage(mesg)
end do
WinMain = mesg%wParam
return
end 


!/****************************************************************************
!
!    FUNCTION: InitApplication(HANDLE)
!
!    PURPOSE: Initializes window data and registers window class
!
!****************************************************************************/
integer*4 function InitApplication (hInstance)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_InitApplication@4' :: InitApplication
use msfwina
use outinc

interface 
integer(4) function  MainWndProc (hWnd,messsage,wParam,lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MainWndProc@16' :: MainWndProc
integer     hWnd
integer     messsage
integer     wParam
integer     lParam
end function MainWndProc
end interface

integer             hInstance
type (T_WNDCLASS)     wc


wc%style = 0
wc%lpfnWndProc = LOC(MainWndProc)
wc%cbClsExtra = 0
wc%cbWndExtra = 0
wc%hInstance = hInstance
wc%hIcon = LoadIcon(NULL, IDI_APPLICATION)
wc%hCursor = LoadCursor(NULL, IDC_ARROW)
wc%hbrBackground = GetStockObject(WHITE_BRUSH) 
wc%lpszMenuName =  LOC("OutputMenu"C)
wc%lpszClassName = LOC("OutputWClass"C)

InitApplication = RegisterClass(wc)
return
end 


!/****************************************************************************
!                                      
!    FUNCTION:  InitInstance(HANDLE, int)
!
!    PURPOSE:  Saves instance handle and creates main window
!
!****************************************************************************/

integer*4 function InitInstance (hInstance, nCmdShow)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_InitInstance@8' :: InitInstance
use msfwina
use outinc
integer*4   hInstance, nCmdShow
integer*4   hWnd
logical(4)  bret


hInst = hInstance

hWnd = CreateWindow(                                              &
            "OutputWClass"C,                                      &
            "Output Sample Application"C,                         &
            INT4(WS_OVERLAPPEDWINDOW),                            &
            0,                                                    &
            0,                                                    &
            GetSystemMetrics(SM_CXSCREEN),                        &
            GetSystemMetrics(SM_CYSCREEN),                        &
            NULL,                                                 &
            NULL,                                                 &
            hInstance,                                            &
            NULL                                                  &
       )                                                          

if (hWnd == 0) then
    InitInstance = 0
    return
end if

bret = ShowWindow(hWnd, nCmdShow)
bret = UpdateWindow(hWnd)
InitInstance = 1
return
end 


