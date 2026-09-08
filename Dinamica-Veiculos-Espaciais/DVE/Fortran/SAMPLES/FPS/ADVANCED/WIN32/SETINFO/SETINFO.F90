!******************************************************************************\
!*       This is a part of the Microsoft Source Code Samples. 
!*       Copyright (C) 1993 Microsoft Corporation.
!*       All rights reserved. 
!*       This source code is only intended as a supplement to 
!*       Microsoft Development Tools and/or WinHelp documentation.
!*       See these sources for detailed information regarding the 
!*       Microsoft samples programs.
!******************************************************************************/

!*************************************************************************\
!*  PROGRAM: setinfo.f90
!*
!*  PURPOSE:
!*
!*    To demonstrate queries and setting file information much as the
!*    OS/2 API's DosQFileInfo() and DosSetFileInfo().
!*
!*  GLOBAL VARIABLES:
!*
!*    HANDLE hInst;  - Instance handle.
!*
!*    HWND   hWnd;   - Client window handle.
!*
!*    HWND   hWndDlg;- Window handle to upper dialog box.
!*
!*    HWND   hWndFileDlg;
!*                   - Window handle to lower dialog box.
!*
!*    DWORD  StepTime;
!*                   - Time in ms., used to control the speed of reporting
!*                     return codes in the upper dialog box.
!*
!*  FUNCTIONS:
!*
!*    WinMain()      - Initializes the window, and process the message loop.
!*    MainWndProc()  - To handle the messages to the main window.
!*    StatusDlgProc()- To handle messages to the Status Dialog (upper) box.
!*    FileDlgProc()  - To handle messages to the File Dialog (lower) box.
!*    RepStat()      - To calculate return codes and to send results as
!*                     messages to the StatusDlgProc()
!*
!*  COMMENTS:
!*
!*    Overview:
!*      This sample captures and sets a files date/time, size, and
!*      attributes information (note it does not *set* file size
!*      information).  It also reports API return code status
!*      information.
!*
!*    To Use:
!*      Enter a file name into the appropriate edit field, and click on
!*      the Get Info. button.  File information will be retrieved and
!*      placed in the various edit fields and check buttons.  To set
!*      file information, modify the values in the Time and Date edit
!*      fields, and click the Set Info. button.  To set file attributes,
!*      set the approprate check boxes, and click on the Set Attr. button.
!*      Note this application does not check for rediculous Date and Time
!*      information, and does not understand i.e. values before 1980 or after
!*      2099.  The API are left to deal with such values as best they
!*      can.
!*
!*      As the buttons are clicked the code sends return code status
!*      information to be reported in the upper dialog box.  The user
!*      can leave this reporting to be done at default time ( 0ms. Sleep
!*      between each API), or can enter a time in the appropriate box
!*      and clicking the Set Time button.  This will put a Sleep between
!*      the API call so that the user can more easily read the return
!*      codes.
!*
!*    Time Conversion:
!*      Note that GetFileTime() and SetFileTime() use 64 bit FILETIME
!*      structures.  These structure consist of two DWORD fields: which
!*      represent file time in hundreds of nano-seconds.  This file time
!*      can be converted into DosDate time (or back again) with the
!*      FileTimeToDosDateTime() and DosDateTimeToFileTime() calls.  These
!*      calls use WORD values representing DosDate and DosTime.  The
!*      online Windows .hlp files will tell you how these WORDs break
!*      down into days, months, hours, seconds, etc.  This sample uses
!*      a combination of masking and shifting to extract the values
!*      from the file (see the FileDlgProc() and the symbolic constants
!*      mask defined in the header file).  Other points of interest are
!*      that seconds are stored in 2 second increments (1-29), and that
!*      years are represented from 1980 (meaning i.e. 1992 will be
!*      be represented by 12).
!*
!*
!*************************************************************************/
interface
integer*4 function WinMain (hInstance, hPrevInstance, lpCmdLine, nCmdShow)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WinMain@16' :: WinMain
integer*4 hInstance
integer*4 hPrevInstance
integer*4 lpCmdLine
integer*4 nCmdShow
end function WinMain
end interface
end


!*************************************************************************\
!*
!*  FUNCTION: WinMain(HANDLE, HANDLE, LPSTR, int)
!*
!*  PURPOSE:  Calls initialization function, processes message loop.
!*
!*  COMMENTS: A fairly standard WinMain, with the exception that it
!*            creates two modeless dialog boxes which fit over the window.
!*            Note the use of IsDialogMessage in the message loop.  This
!*            call not only returns a boolean value, but also processes
!*            the message if it is a dialog box message; otherwise the
!*            message falls through to the body of the loop to be translated
!*            and dispatched.
!*
!*************************************************************************/

integer*4 function WinMain (hInstance, hPrevInstance, lpCmdLine, nCmdShow)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WinMain@16' :: WinMain
use setinc
use msfwin
integer*4       hInstance, hPrevInstance, lpCmdLine, nCmdShow

interface 
integer(4) function MainWndProc (hwnd, message, wParam, lParam)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MainWndProc@16' :: MainWndProc
integer*4   hwnd 
integer*4   message 
integer*4   wParam 
integer*4   lParam 
end function MainWndProc

integer(4) function FileDlgProc (hwnd, message, wParam, lParam)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FileDlgProc@16' :: FileDlgProc
integer*4   hwnd 
integer*4   message 
integer*4   wParam 
integer*4   lParam 
end function FileDlgProc

integer(4) function StatusDlgProc (hwnd, message, wParam, lParam)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_StatusDlgProc@16' :: StatusDlgProc
integer*4   hwnd 
integer*4   message 
integer*4   wParam 
integer*4   lParam 
end function StatusDlgProc
end interface

type (T_MSG)        mesg
type (T_WNDCLASS)   wc
type (T_RECT)       rects
integer*4           ret
character*100       lpszClassName


hInst = hInstance
lpszClassName = "SetInfoWClass"C

wc%style = 0                          !// Replaces CS_SIZEREDRAW.
wc%lpfnWndProc = LOC(MainWndProc) !// The client window procedure.
wc%cbClsExtra = 0                     !// No room reserved for extra data.
wc%cbWndExtra = 0
wc%hInstance = hInstance
wc%hIcon = LoadIcon (NULL, IDI_APPLICATION)
wc%hCursor = LoadCursor (NULL, IDC_ARROW)
wc%hbrBackground = GetStockObject (WHITE_BRUSH)
wc%lpszMenuName = LOC(""C)
wc%lpszClassName = LOC(lpszClassName)

ret = RegisterClass(wc)

hPrevInstance = hPrevInstance
lpcmdline = lpcmdline

hWind = CreateWindow (lpszClassName,                      &
                      "Set File Info. Sample"C,              &
                      INT4(WS_OVERLAPPEDWINDOW),                  &
                      CW_USEDEFAULT,                              &
                      CW_USEDEFAULT,                              &
                      CW_USEDEFAULT,                              &
                      CW_USEDEFAULT,                              &
                      NULL,                                       &
                      NULL,                                       &
                      hInstance,                                  &
                      NULL)

hWndDlg     = CreateDialog (hInst, LOC("StatusDlg"C), hWind, LOC(StatusDlgProc))

hWndFileDlg = CreateDialog (hInst, LOC("FileDlg"C), hWind, LOC(FileDlgProc))

bret = GetClientRect (hWind, rects)
ret = SendMessage (hWind, WM_SIZE, 0, (rects%right - rects%left))
bret = ShowWindow  (hWndDlg,  SW_SHOW)
bret = ShowWindow  (hWndFileDlg, SW_SHOW)
bret = ShowWindow  (hWind, nCmdShow)

do while (GetMessage (mesg, NULL, 0, 0))
    if ((IsDialogMessage (hWndDlg, mesg) .EQV. .FALSE.)             &
    .AND. (IsDialogMessage (hWndFileDlg, mesg) .EQV. .FALSE.)) then
        ret = DispatchMessage (mesg)   !// Dispatch message to window.
    end if
end do

WinMain = mesg%wParam
return                  !// Returns value from PostQuitMessage.

end
