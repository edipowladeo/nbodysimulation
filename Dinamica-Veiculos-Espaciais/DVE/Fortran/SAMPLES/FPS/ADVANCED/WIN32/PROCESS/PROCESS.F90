 
!******************************************************************************
!*       This is a part of the Microsoft Source Code Samples% 
!*       Copyright (C) 1993 Microsoft Corporation%
!*       All rights reserved% 
!*       This source code is only intended as a supplement to 
!*       Microsoft Development Tools and/or WinHelp documentation%
!*       See these sources for detailed information regarding the 
!*       Microsoft samples programs%
!******************************************************************************

!**********************************************************************
!*  process.f90 --    program template for process program            *
!*                                                                    *
!*  Comments:                                                         *
!*                                                                    *
!*  Functions:                                                        *
!*                                                                    *
!*  WinMain()         - Initializes Application                       *
!*  DlgProc()         - Processes " Dialog Box Messages               *
!*                                                                    *
!*                                                                    *
!**********************************************************************

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


!**********************************************************************
!*  Function: int APIENTRY WinMain(HINSTANCE, HINSTANCE, LPSTR, int)  *
!*                                                                    *
!*   Purpose: Initializes Application                                 *
!*                                                                    *
!*  Comments: Standard template                                       *
!*                                                                    *
!*                                                                    *
!**********************************************************************
integer function WinMain( hInstance, hPrevInstance, lpszCmdLine, nCmdShow )
!MS$ATTRIBUTES STDCALL, ALIAS : '_WinMain@16' :: WinMain
use msfwin

integer hInstance, hPrevInstance, lpszCmdLine, nCmdShow

interface 
integer(4) function DlgProc( hwnd, mesg, wParam, lParam )
!MS$ATTRIBUTES STDCALL, ALIAS : '_DlgProc@16' :: DlgProc
integer  hwnd 
integer mesg 
integer wParam 
integer lParam 
end function DlgProc
end interface


integer ret

character*100  lpszDlgName

hPrevInstance   = hPrevInstance   
lpszCmdLine     = lpszCmdLine     
nCmdShow        = nCmdShow  
ghInstance = hInstance
lpszDlgName = "processDlg"C
ret = DialogBoxParam(ghInstance,LOC(lpszDlgName),NULL, LOC(DlgProc), 0)
WinMain = ret
return
end 



!/****************************************************************************
!
!        FUNCTION: DlgProc(HWND, UINT, WPARAM, LPARAM)
!
!        PURPOSE:  Processes messages for dialog box
!
!        MESSAGES:
!
!        WM_COMMAND    - Input received
!

!
!****************************************************************************/
integer*4 function DlgProc( hDlg, message, wParam, lParam )
!MS$ATTRIBUTES STDCALL, ALIAS : '_DlgProc@16' :: DlgProc
use procinc
integer     hDlg        !// window handle of the dialog box
integer     message     !// type of message
integer     wParam      !// message-specific information
integer     lParam

interface
subroutine doCreate (hDlg)
!MS$ ATTRIBUTES VALUE :: hDlg
integer*4 hDlg 
end subroutine

subroutine doTerminate (hDlg)
!MS$ ATTRIBUTES VALUE :: hDlg
integer*4 hDlg 
end subroutine
end interface

integer*4   tabs(4)

integer*4   ret


lParam = lParam
select case (message)
    case (WM_INITDIALOG)    ! message: initialize dialog box

       tabs(1) =   10 * 4           !(WORD)(sizeof("00000000 ") *4);
       tabs(2) = tabs(1) + 10 * 4   !(WORD)(sizeof("00000000 ") *4);
       tabs(3) = tabs(2) + 13 * 4   !(WORD)(sizeof("dwProcessID ") *4);
       tabs(4) = tabs(3) + 12 * 4   !(WORD)(sizeof("dwThreadID ") *4);
              
       ret = SendDlgItemMessage (hDlg, DID_LISTBOX,               &
                                 LB_SETTABSTOPS, 4, LOC(tabs(1)))
       ret = SendDlgItemMessage (hDlg, DID_HEADER,                &
                                 LB_SETTABSTOPS, 4, LOC(tabs(1)))

       ret = SendDlgItemMessage (hDlg, DID_HEADER, LB_ADDSTRING,0,&
                    LOC("hProcess \thTread \tdwProcessID \tdwThreadID \tImage file"C))
       DlgProc = 1
       return

    case (WM_SYSCOMMAND)
       if (wParam == SC_CLOSE) then
           ret = EndDialog (hDlg, TRUE)
           DlgProc = 1
           return 
       else
           DlgProc = 0
       end if
    case (WM_COMMAND)                      ! message: received a command
!      /* if the list box sends back messages, return.  */
        if (LoWord(wParam) == DID_LISTBOX) then       
            DlgProc = 1
            return
        end if
        select case ( INT4(LoWord(wParam)))
            case ( DID_CREATE)
                call doCreate(hDlg)
            case ( DID_TERMINATE)
                call doTerminate(hDlg)
        end select
        DlgProc = 1
        return
end select  ! message
DlgProc = 0 ! Didn't process the message
return

end 
