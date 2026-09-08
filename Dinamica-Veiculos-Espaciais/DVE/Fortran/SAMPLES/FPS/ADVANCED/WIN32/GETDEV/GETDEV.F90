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
!*  getdev.f90 -- sample program demonstrating the getdev... APIs
!*
!*  In this sample the main window is a dialog box.  There is no need to
!*   register a new window class or create a new window.  Instead just call
!*   DialogBox() and use the template defined in the .RC file.  All of the
!*   interesting code is thus in the window procedure for the dialog box.
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
integer function WinMain(hInstance, hPrevInstance, lpCmdLine, nCmdShow)
!MS$ATTRIBUTES STDCALL, ALIAS : '_WinMain@16' :: WinMain
use msfwin
use getdvinc
integer*4       hInstance, hPrevInstance, lpCmdLine ,nCmdShow


interface 
integer(4) function MainDlgProc(hwnd, message, wParam, lParam)
!MS$ATTRIBUTES STDCALL, ALIAS : '_MainDlgProc@16' :: MainDlgProc
integer*4   hwnd 
integer*4   message 
integer*4   wParam 
integer*4   lParam 
end function MainDlgProc
end interface

character*100  lpszDlgName
include 'data.f90'

hPrevInstance = hPrevInstance
lpcmdline   = lpcmdline
nCmdShow    = nCmdShow


lpszDlgName = "getdevDlg"C
WinMain = DialogBox (hInstance, LOC(lpszDlgName), NULL, LOC(MainDlgProc))
end 


!/**************************************************************************\
!*
!*  function:  MainDlgProc()
!*
!*  input parameters:  standard window procedure parameters.
!*
!* At initialization time, call GetDeviceCaps() repeatedly and place the
!*  results in the list box.
!*
!\**************************************************************************/
integer*4 function MainDlgProc(hwnd, message, wParam, lParam)
!MS$ATTRIBUTES STDCALL, ALIAS : '_MainDlgProc@16' :: MainDlgProc
use msfwin
use getdvinc
integer     hwnd, message, wParam, lParam

interface
subroutine ExpandInfo (hwnd, index, value)
!MS$ATTRIBUTES VALUE :: hwnd
!MS$ATTRIBUTES VALUE :: index
!MS$ATTRIBUTES VALUE :: value
integer(4)  hwnd
integer(4)  index
integer(4)  value
end subroutine ExpandInfo
end interface

integer     val
integer     hdc
integer*4   ret

lParam = lParam

select case (message)

    case (WM_INITDIALOG)

        hdc = GetDC (hwnd)

        do i = 1, NINDEX
            val = GetDeviceCaps (hdc , DevCap(i)%val)
            write (buffer, 50) DevCap(i)%String, val
50    FORMAT(A16 , ' ', I8)
            ret = SendDlgItemMessage (hwnd, DID_LISTBOX,          &
                       LB_ADDSTRING, 0, LOC(buffer))
            call ExpandInfo (hwnd, DevCap(i)%val, val)
        end do
        ret = ReleaseDC (hwnd,hdc)


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

    case DEFAULT
        MainDlgProc = FALSE
        return

    end select !/* end switch(message) */
MainDlgProc = 0
end 





