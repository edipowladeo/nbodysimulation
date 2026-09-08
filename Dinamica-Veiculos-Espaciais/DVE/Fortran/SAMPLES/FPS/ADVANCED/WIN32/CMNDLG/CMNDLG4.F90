!***************************************************************************
!*
!*    FUNCTION: ReplaceTextHookProc(HWND, UINT, UINT, LONG)
!*
!*    PURPOSE:  Processes messages for ReplaceText common dialog box
!*
!*    COMMENTS:
!*
!*        Puts up a message stating that the hook is active if hook
!*        only active.  Otherwise, if template enabled, hides the
!*        Replace All pushbutton, plus the 'Match case' and
!*        'Match whole word' check box options.
!*
!*    RETURN VALUES:
!*        TRUE - Continue.
!*        FALSE - Return to the dialog box.
!*
!*************************************************************************** 

integer*4 function ReplaceTextHookProc( hDlg,message, wParam,  lParam )
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ReplaceTextHookProc@16' :: ReplaceTextHookProc
use cmndlgin

interface 
integer*4 function MainWndProc( hWnd, message, wParam, lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MainWndProc@16':: MainWndProc
integer  hWnd , message , wParam, lParam
end function
end interface

interface 
integer function About(hDlg, message, wParam, lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_About@16':: About
integer  hDlg, message, wParam, lParam
end function
end interface

interface 
integer function EnterNew(hDlg, message, wParam, lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_EnterNew@16':: EnterNew
integer hDlg , message  , wParam  , lParam 
end function
end interface

interface 
integer function FileOpenHookProc( hDlg, message, wParam,  lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FileOpenHookProc@16':: FileOpenHookProc
integer hDlg, message, wParam, lParam
end function
end interface

interface 
integer function FileSaveHookProc( hDlg, message, wParam,  lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FileSaveHookProc@16':: FileSaveHookProc
integer hDlg, message, wParam, lParam
end function
end interface

interface 
integer function ChooseColorHookProc( hDlg, message, wParam,  lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ChooseColorHookProc@16':: ChooseColorHookProc
integer hDlg, message, wParam, lParam
end function
end interface

interface 
integer function ChooseFontHookProc( hDlg, message, wParam,  lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ChooseFontHookProc@16':: ChooseFontHookProc
integer hDlg, message, wParam, lParam
end function
end interface

interface 
integer function FindTextHookProc( hDlg, message, wParam,  lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FindTextHookProc@16':: FindTextHookProc
integer hDlg, message, wParam, lParam
end function
end interface

interface 
integer function PrintDlgHookProc( hDlg, message, wParam,  lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_PrintDlgHookProc@16':: PrintDlgHookProc
integer hDlg, message, wParam, lParam
end function
end interface

interface 
integer function PrintSetupHookProc( hDlg, message, wParam,  lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_PrintSetupHookProc@16':: PrintSetupHookProc
integer hDlg, message, wParam, lParam
end function
end interface

interface 
integer function InitApplication( hInstance )
integer hInstance
end function
end interface

interface 
integer function InitInstance(hInstance, nCmdShow)
integer hInstance, nCmdShow
end function
end interface

interface 
integer function OpenNewFile( hWnd )
integer hWnd
end function
end interface

interface 
integer function SaveToFile( hWnd )
integer hWnd
end function
end interface

interface 
integer function SaveAs( hWnd )
integer hWnd
end function
end interface

interface 
subroutine SearchFile( LPFINDREPLACE )
integer*4 LPFINDREPLACE
end subroutine
end interface

interface 
integer function ChooseNewFont( hWnd )
integer*4 hWnd 
end function
end interface

interface 
integer function ChooseNewColor( hWnd )
integer*4 hWnd 
end function
end interface

interface 
subroutine PrintFile( hWnd )
integer hWnd
end subroutine
end interface

interface 
subroutine CallFindText( hWnd ) 
integer hWnd
end subroutine
end interface

interface 
subroutine CallReplaceText( hWnd )
integer hWnd
end subroutine
end interface

interface 
subroutine ProcessCDError(dwErrorCode, hWnd)
integer dwErrorCode, hWnd
end subroutine
end interface




integer hDlg        !  window handle of the dialog box  
integer message     !   type of message                  
integer wParam      !  message-specific information     
integer lParam


wParam = wParam
lparam = lparam
   select case (message)
      case (WM_INITDIALOG)
         if (IAND(frText%Flags , FR_ENABLETEMPLATE ) .ne. 0) then
            i = ShowWindow( GetDlgItem(hDlg, psh2), SW_HIDE )
            i = ShowWindow( GetDlgItem(hDlg, chx1), SW_HIDE )
            i = ShowWindow( GetDlgItem(hDlg, chx2), SW_HIDE )
         end if
         i = MessageBox( hDlg, "Hook installed."C, "Information"C, MB_OK )
         ReplaceTextHookProc=TRUE
         return

      case DEFAULT
   end select
   ReplaceTextHookProc=FALSE
   return
end 

! ***************************************************************************
!*
!*    FUNCTION: FindTextHookProc(HWND, UINT, UINT, LONG)
!*
!*    PURPOSE:  Processes messages for FindText common dialog box
!*
!*    COMMENTS:
!*
!*        Puts up a message stating that the hook is active if hook
!*        only enabled.  If custom template, hides the 'Match case'
!*        and 'Match whole word' options, hides the group box 'Direction'
!*        with the radio buttons 'Up' and 'Down'.
!*
!*    RETURN VALUES:
!*        TRUE - Continue.
!*        FALSE - Return to the dialog box.
!*
!*************************************************************************** 

integer*4 function FindTextHookProc( hDlg, message,wParam,lParam)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FindTextHookProc@16':: FindTextHookProc

use cmndlgin
integer hDlg        !  window handle of the dialog box  
integer message     !  type of message                  
integer wParam      !  message-specific information     
integer lParam
interface 
integer*4 function MainWndProc( hWnd, message, wParam, lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MainWndProc@16':: MainWndProc
integer  hWnd , message , wParam, lParam
end function
end interface

interface 
integer function About(hDlg, message, wParam, lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_About@16':: About
integer  hDlg, message, wParam, lParam
end function
end interface

interface 
integer function EnterNew(hDlg, message, wParam, lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_EnterNew@16':: EnterNew
integer hDlg , message  , wParam  , lParam 
end function
end interface

interface 
integer function FileOpenHookProc( hDlg, message, wParam,  lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FileOpenHookProc@16':: FileOpenHookProc
integer hDlg, message, wParam, lParam
end function
end interface

interface 
integer function FileSaveHookProc( hDlg, message, wParam,  lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FileSaveHookProc@16':: FileSaveHookProc
integer hDlg, message, wParam, lParam
end function
end interface

interface 
integer function ChooseColorHookProc( hDlg, message, wParam,  lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ChooseColorHookProc@16':: ChooseColorHookProc
integer hDlg, message, wParam, lParam
end function
end interface

interface 
integer function ChooseFontHookProc( hDlg, message, wParam,  lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ChooseFontHookProc@16':: ChooseFontHookProc
integer hDlg, message, wParam, lParam
end function
end interface

interface 
integer function ReplaceTextHookProc( hDlg, message, wParam,  lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ReplaceTextHookProc@16':: ReplaceTextHookProc
integer hDlg, message, wParam, lParam
end function
end interface

interface 
integer function PrintDlgHookProc( hDlg, message, wParam,  lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_PrintDlgHookProc@16':: PrintDlgHookProc
integer hDlg, message, wParam, lParam
end function
end interface

interface 
integer function PrintSetupHookProc( hDlg, message, wParam,  lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_PrintSetupHookProc@16':: PrintSetupHookProc
integer hDlg, message, wParam, lParam
end function
end interface


!//functions
interface 
integer function InitApplication( hInstance )
integer hInstance
end function
end interface

interface 
integer function InitInstance(hInstance, nCmdShow)
integer hInstance, nCmdShow
end function
end interface

interface 
integer function OpenNewFile( hWnd )
integer hWnd
end function
end interface

interface 
integer function SaveToFile( hWnd )
integer hWnd
end function
end interface

interface 
integer function SaveAs( hWnd )
integer hWnd
end function
end interface

interface 
subroutine SearchFile( LPFINDREPLACE )
integer*4 LPFINDREPLACE
end subroutine
end interface

interface 
integer function ChooseNewFont( hWnd )
integer*4 hWnd 
end function
end interface

interface 
integer function ChooseNewColor( hWnd )
integer*4 hWnd 
end function
end interface

interface 
subroutine PrintFile( hWnd )
integer hWnd
end subroutine
end interface

interface 
subroutine CallFindText( hWnd ) 
integer hWnd
end subroutine
end interface

interface 
subroutine CallReplaceText( hWnd )
integer hWnd
end subroutine
end interface

interface 
subroutine ProcessCDError(dwErrorCode, hWnd)
integer dwErrorCode, hWnd
end subroutine
end interface

wparam = wparam
lparam = lparam

   select case (message)
      case (WM_INITDIALOG)
         if (IAND(frText%Flags , FR_ENABLETEMPLATE ) .ne. 0) then
            i = ShowWindow(GetDlgItem(hDlg, chx1), SW_HIDE)
            i = ShowWindow(GetDlgItem(hDlg, grp1), SW_HIDE)
            i = ShowWindow(GetDlgItem(hDlg, chx2), SW_HIDE)
            i = ShowWindow(GetDlgItem(hDlg, rad1), SW_HIDE)
            i = ShowWindow(GetDlgItem(hDlg, rad2), SW_HIDE)
         end if
         i  = MessageBox( hDlg,"Hook installed."C,"Information"C, MB_OK )
         FindTextHookProc=TRUE

      case default
   end select
   FindTextHookProc=FALSE
   return
end 


!***********************************************************************
!*
!*    FUNCTION: SearchFile(LPFINDREPLACE)
!*
!*    PURPOSE:  Does the find/replace specified by the Find/ReplaceText
!*        common dialog.
!*
!*    COMMENTS:
!*
!*        This function does the lease necessary to implement find and
!*        replace by calling existing c-runtime functions.  It is in
!*        no way intended to demonstrate either correct or efficient
!*        methods for doing textual search or replacement.
!*
!*    RETURN VALUES:
!*        void.
!*
!*************************************************************************** 
subroutine SearchFile(lpFR)
!MS$ATTRIBUTES STDCALL, ALIAS : '_SearchFile@4' :: SearchFile
use cmndlgin

interface 
integer function CallCStrStr(buffer,findstring) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_CallCStrStr@8' ::  CallCStrStr
integer   buffer 
integer   findstring
end function CallCStrStr
end interface

integer*4                   lpFR
type(T_FINDREPLACE)         FR
character*(FILE_LEN)        Buf

    call CopyMemory (LOC(FR), lpFR, 40)

    if (IAND(FR%Flags , FR_FINDNEXT)) then

        call ZeroMemory (LOC(buf), FILE_LEN)

        iStrPtr = CallCStrStr( LOC(FileBuf), FR%lpstrFindWhat)
        iStrContents = LOC(iStrPtr)
        if (iStrContents .eq. 0) then
            write(Buf,*) FR%lpstrFindWhat
            iret =  MessageBox( FR%hwndOwner, Buf, "No luck"C, IOR(MB_OK , MB_TASKMODAL))
        else
            if ( FR%wReplaceWithLen .eq. 0) then    
                call CopyMemory(LOC(Buf),FR%lpstrFindWhat,FILE_LEN)
                iret = MessageBox( FR%hwndOwner, Buf, "Success!"C, IOR(MB_OK , MB_TASKMODAL) )
            endif
        endif
    else
        i = MessageBox( hwnd, "NOT IMPLEMENTED"C, "No luck"C, MB_OK )
    endif

end 
