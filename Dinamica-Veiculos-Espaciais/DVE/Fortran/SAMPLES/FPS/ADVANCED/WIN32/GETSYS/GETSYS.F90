
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
!*  getsys.f90 -- sample program demonstrating the GetSys... APIs
!*
!*  In this sample the main window is a dialog box.  There is no need to
!*   register a new window class or create a new window.  Instead just call
!*   DialogBox() and use the template defined in the .RC file.  All of the
!*   interesting code is thus in the window procedure for the dialog box.
!*   In this case, simply respond to the button command messsages and fill
!*   the list box with appropriate Vals.
!*
!*  The dialog template currently specifies a "monospaced font."  This makes
!*   the dialog look somewhat odd, but makes text formatting much easier.  If
!*   the specified font does not exist on the system running this sample, the
!*   program will work fine, but the contents of the listbox will not look
!*   very good.
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


!/**************************************************************************\
!*
!*  function:  WinMain()
!*
!*  input parameters:  c.f. generic sample
!*
!\**************************************************************************/
integer*4 function WinMain(hInstance, hPrevInstance, lpCmdLine, nCmdShow)
!MS$ATTRIBUTES STDCALL, ALIAS : '_WinMain@16' :: WinMain
use gtsysinc
integer         hInstance, hPrevInstance, lpCmdLine, nCmdShow

interface
integer(4) function MainDlgProc(hwnd, message, wParam, lParam)
!MS$ATTRIBUTES STDCALL, ALIAS : '_MainDlgProc@16' :: MainDlgProc
integer*4   hwnd 
integer*4   message 
integer*4   wParam 
integer*4   lParam 
end function MainDlgProc
end interface

integer         ret
include 'data.f90'

hPrevInstance   = hPrevInstance
lpcmdline       = lpcmdline
ncmdShow        = ncmdShow 

ret = DialogBox (hInstance, LOC("getsysDlg"C), NULL, LOC(MainDlgProc))
WinMain = 0
end







