 
!/******************************************************************************\
!*       This is a part of the Microsoft Source Code Samples. 
!*       Copyright (C) 1993 Microsoft Corporation.
!*       All rights reserved. 
!*       This source code is only intended as a supplement to 
!*       Microsoft Development Tools and/or WinHelp documentation.
!*       See these sources for detailed information regarding the 
!*       Microsoft samples programs.
!\******************************************************************************/
!
!/*************************************************************************\
!*  PROGRAM: sharemem.f90
!*
!*  PURPOSE:
!*
!*    To demonstrate the use of named shared memory between two independent
!*    processes.
!*
!*
!*
!*  FUNCTIONS:
!*
!*    WinMain()      - Initializes the window, and process the message loop.
!*    MainWndProc()  - To handle the messages to the main window.
!*
!*  COMMENTS:
!*
!*    Overview:
!*      This sample is accompanied by the Othrproc (Other Procedure)
!*      application.  Basically this code traps WM_MOUSEMOVE messages
!*      and writes them to the shared memory.  The Otherproc code
!*      reads the share memory and blts a small bitmap in the same
!*      relative coordinates.  The effect is to have the mouse move
!*      in one window, while the bitmap moves in the same relative
!*      position in the other window.  The mouse coordinates will appear
!*      in the edit fields of the dialog box at the top of the parent
!*      windows.
!*
!*    To Use:
!*      First start Sharemem, then start Otherproc.  The visual effect
!*      is better if the focus remains with Otherproc, while the mouse
!*      moves with the Sharemem window.
!*
!\*************************************************************************/

use msfwin
use shareinc
include 'sharemem.fi'
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





!/*************************************************************************\
!*
!*  FUNCTION: WinMain(hInstance, hPrevInstance, lpCmdLine, nCmdShow)
!*
!*  PURPOSE:  Initializes the window, processes message loop.
!*
!*  COMMENTS: A fairly standard WinMain except that it creates a dialog
!*            box which is imposed on the upper part of the window.  This
!*            dialog box is used to show the mouse coordinates.
!*
!\*************************************************************************/

integer*4 function WinMain ( hInstance, hPrevInstance, lpCmdLine, nCmdShow)
!MS$ATTRIBUTES STDCALL, ALIAS : '_WinMain@16' :: WinMain
use msfwin
use shareinc
include 'sharemem.fi'
integer*4   hInstance, hPrevInstance, lpCmdLine, nCmdShow
character*100  lpszClassName, lpszMenuName

type (T_MSG)         mesg
type (T_WNDCLASS)    wc
type (T_RECT)        rects
integer*4   ret
logical(4)  lret



hInst = hInstance
hPrevInstance = hPrevInstance
lpcmdline = lpcmdline
lpszMenuName = ""C
lpszClassName = "ShareMemWClass"C
wc%style = 0
wc%lpfnWndProc = LOC(MainWndProc)
wc%cbClsExtra = 0
wc%cbWndExtra = 0
wc%hInstance = hInstance
wc%hIcon = LoadIcon (NULL, IDI_APPLICATION)
wc%hCursor = LoadCursor (NULL, IDC_ARROW)
wc%hbrBackground = GetStockObject (WHITE_BRUSH)
wc%lpszMenuName = LOC(lpszMenuName)
wc%lpszClassName = LOC(lpszCLassName)

ret = RegisterClass(wc)
hWnd = CreateWindow (lpszClassName,          &
                        "Shared Memory Sample"C, &
                        INT4(WS_OVERLAPPEDWINDOW),    &
                        CW_USEDEFAULT,                &
                        CW_USEDEFAULT,                &
                        CW_USEDEFAULT,                &
                        CW_USEDEFAULT,                &
                        NULL,                         &
                        NULL,                         &
                        hInstance,                    &
                        NULL)

hWndDlg  = CreateDialog (hInst, LOC("StatusDlg"C), hWnd, NULL)

lret = GetClientRect (hWnd, rects)
ret = SendMessage (hWnd, WM_SIZE, 0, (rects%right - rects%left))
lret = ShowWindow  (hWndDlg,  SW_SHOW)
lret = ShowWindow  (hWnd, nCmdShow)

do while (GetMessage (mesg, NULL, 0, 0))
    if (IsDialogMessage (hWndDlg, mesg) .EQV. .FALSE.) then
        ret = DispatchMessage (mesg)   !// Dispatch message to window.
    end if
end do

WinMain = mesg%wParam           !// Returns value from PostQuitMessage.
return
end

!/*************************************************************************\
!*
!*  FUNCTION:  MainWndProc (hwind, message, wParam, lParam)
!*
!*  PURPOSE:   To process messages.  To create the shared memory.
!*
!*  MESSAGES:
!*
!*    WM_CREATE       - Create the shared memory by calling
!*                      CreateFileMapping().  This memory is the size
!*                      of a DWORD, all the size that is needed to pass
!*                      mouse coordinates.  If the CreateFileMapping()
!*                      call is successful, it then calls MapViewOfFile()
!*                      to get the address of the memory.
!*
!*    WM_MOUSEMOVE    - Traps the mouse move messages, and uses structured
!*                      exception handling to write the mouse coordinates
!*                      to the share memory.  It also sends the coordinates
!*                      to the edit fields of the dialog box.
!*
!*    WM_DESTROY      - Closes the memory handle, and destroys the window.
!*
!*    WM_SIZE         - Updates the size of the dialog box to maintain
!*                      its relative size to the client window.
!*
!*  CALLED BY:
!*
!*    WinMain();
!*
!\*************************************************************************/

integer*4 function MainWndProc ( hwind, message, wParam, lParam)
!MS$ATTRIBUTES STDCALL , ALIAS : '_MainWndProc@16' :: MainWndProc
use msfwin
use shareinc

integer*4   hwind, message, wParam, lParam

integer*4   ret

select case (message)
    case (WM_CREATE)
        hMapObject = CreateFileMapping ( #FFFFFFFF,            &
                                    NULL_SECURITY_ATTRIBUTES,  &
                                    PAGE_READWRITE,            &
                                    0,                         &
                                    4,                         &
                                    "shared_memory"C)
        if (hMapObject == 0) then
            call WERR("CreateFileMapping","WM_CREATE")
        end if
        MapView = MapViewOfFile (hMapObject, FILE_MAP_WRITE, 0, 0, 0)
        if (MapView == 0) then
            ret = MessageBox (hwind,                                        &
                        "ERROR: MapViewOfFile was not successful"C,         &
                        "From within WM_CREATE"C,                           &
                     MB_OK)             
        end if
        MainWndProc = 0
        return

    case (WM_SIZE)
        ret = SetWindowPos (hWndDlg, NULL, 0,0, INT4(LoWord(lParam)), DIALOGHEIGHT, 0)
        MainWndProc = 0
        return

    case (WM_MOUSEMOVE)
        call CopyMemory(MapView,LOC(lParam), 4)
        
        ret = SetDlgItemInt (hWndDlg, IDE_XCOORD, INT4(LoWord(lParam)), .FALSE.)
        ret = SetDlgItemInt (hWndDlg, IDE_YCOORD, INT4(HiWord(lParam)), .FALSE.)
        MainWndProc = 0
        return

    case (WM_DESTROY)
        ret = CloseHandle (hMapObject)
        call PostQuitMessage (0)
        MainWndProc = 0
        return 

end select
MainWndProc = DefWindowProc (hwind, message, wParam, lParam)
return
end

subroutine WERR (who, where)
use msfwin
use shareinc
character*80    who, where

integer*4   ret

write (Buf, 100) who, GetLastError()
100   format ('Error: ', A, ' returned ', I2, ""C )
write (Buf2, 200) where
200   format ('From within ', A, ""C)
ret = MessageBox(hwnd, Buf, Buf2, MB_OK)

end

