!***************************************************************************
!*
!*    FUNCTION: PrintDlgHookProc(HWND, UINT, UINT, LONG)
!*
!*    PURPOSE:  Processes messages for PrintDlg common dialog box
!*
!*    COMMENTS:
!*
!*        This hook procedure simply prompts the user whether or not they
!*        want to print.  if they choose YES, the text buf will be printed
!*        and the dialog will be dismissed.  If they choose NO, the text buf
!*        will not be printeded and the user will be returned to the dialog.
!*
!*        If the current mode is 'custom', the 'Print to file' and 'Collate
!*        Copies' options are hidden.
!*
!*    RETURN VALUES:
!*        TRUE - Continue.
!*        FALSE - Return to the dialog box.
!*
!*************************************************************************** 

integer*4 function PrintDlgHookProc( hDlg, message, wParam,lParam)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_PrintDlgHookProc@16' :: PrintDlgHookProc
use cmndlgin

interface 
integer function FindTextHookProc( hDlg, message, wParam,  lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FindTextHookProc@16':: FindTextHookProc
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
!MS$ATTRIBUTES STDCALL, ALIAS : '_SearchFile@4' :: SearchFile
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

lparam = lparam

   select case (message)
      case (WM_INITDIALOG)
         if (IAND(pd%Flags , PD_ENABLEPRINTTEMPLATE ) .ne. 0) then
            !i = ShowWindow( GetDlgItem(hDlg, chx1), SW_HIDE )
            !i  = ShowWindow( GetDlgItem(hDlg, chx2), SW_HIDE )
            PrintDlgHookProc=TRUE
         end if
         i = MessageBox( hDlg, "Hook installed."C, &
                                     "Information"C, MB_OK )
         PrintDlgHookProc =TRUE
         return

      case (WM_COMMAND)
         if (LOWORD(wParam) == IDOK) then
            if (MessageBox(hDlg,"Are you sure you want to print?"C,&
                    "Information"C, MB_YESNO ) == IDYES ) then
            end if
            PrintDlgHookProc=TRUE
            return
         end if
   end select
   PrintDlgHookProc=FALSE
   return
end 

! ***************************************************************************
!*
!*    FUNCTION: PrintSetupHookProc(HWND, UINT, UINT, LONG)
!*
!*    PURPOSE:  Processes messages for PrintDlg setup common dialog box
!*
!*    COMMENTS:
!*
!*        This function processes the hook and customized template for the
!*        print setup common dialog box.  If the customized template has
!*        been provided, the 'Options' pushbutton is hidden.  If the hook only mode
!*        is chosen, a message box is displayed informing the user that the
!*        hook has been installed.
!*
!*    RETURN VALUES:
!*        TRUE - Continue.
!*        FALSE - Return to the dialog box.
!*
!*************************************************************************** 

integer*4 function PrintSetupHookProc(hDlg,message, wParam,lParam)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_PrintSetupHookProc@16' :: PrintSetupHookProc
use cmndlgin

integer             hDlg        !  window handle of the dialog box  
integer             message     !   type of message                  
integer             wParam      !  message-specific information     
integer             lParam

wparam = wparam
lparam = lparam

   select case (message)
      case (WM_INITDIALOG)
         if (IAND(pd%Flags , PD_ENABLESETUPTEMPLATE ) .ne. 0) then
            !i = ShowWindow( GetDlgItem(hDlg, psh1), SW_HIDE )
            PrintSetupHookProc=TRUE
            return
         end if
         i = MessageBox(hDlg,               &
                     "Hook installed."C,    &
                     "Information"C, MB_OK )
         PrintSetupHookProc=TRUE
         return
   end select
   PrintSetupHookProc=FALSE
   return
end 
   
! ***************************************************************************
!*
!*    FUNCTION: PrintFile(HWND)
!*
!*    PURPOSE:  Invokes common dialog function to print.
!*
!*    COMMENTS:
!*
!*        This function initializes the PRINTDLG structure for all modes
!*        possible: standard, using a hook or using a customized template.
!*        When hook mode is chosen, a hook is installed for both the
!*        Print dialog and the Print Setup dialog.  When custom mode is
!*        chosen, the templates are enabled for both the print dialog and
!*        the Print Setup dialog boxes.
!*
!*        If the PrintDlg() common dialog returns TRUE, the current
!*        text buffer is printed out.
!*
!*
!*    RETURN VALUES:
!*        void.
!*
!*************************************************************************** 
subroutine PrintFile( hWnd )
use cmndlgin

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
integer hWnd

   !  initialize PRINTDLG structure
   pd%lStructSize = 66!sizeof(PRINTDLG)
   pd%hwndOwner = hWnd
   pd%hDevMode = NULL
   pd%hDevNames = NULL
   pd%nFromPage = 0
   pd%nToPage = 0
   pd%nMinPage = 0
   pd%nMaxPage = 0
   pd%nCopies = 0
   pd%hInstance = hInst


   select case( wMode )
      case (IDM_STANDARD)
         pd%Flags = IOR(PD_RETURNDC , IOR(PD_NOPAGENUMS , &
                      IOR(PD_NOSELECTION , PD_PRINTSETUP)))
         pd%lpfnSetupHook = NULL
         pd%lpSetupTemplateName = NULL
         pd%lpfnPrintHook = NULL
         pd%lpPrintTemplateName = NULL

      case (IDM_HOOK)
         pd%Flags = IOR(PD_RETURNDC , IOR(PD_NOPAGENUMS , &
                         IOR(PD_NOSELECTION , IOR(PD_ENABLEPRINTHOOK , &
                         IOR(PD_ENABLESETUPHOOK , PD_PRINTSETUP)))))
         pd%lpfnSetupHook=  LOC(PrintSetupHookProc) !MakeProcInstance(LOC(PrintSetupHookProc),NULL) 
         !pd%lpSetupTemplateName = NULL
         pd%lpfnPrintHook = LOC(PrintDlgHookProc) !MakeProcInstance(LOC(PrintDlgHookProc),NULL) 
         !pd%lpPrintTemplateName = NULL

      case (IDM_CUSTOM)
         pd%Flags = IOR(PD_RETURNDC , IOR(PD_NOPAGENUMS , &
                      IOR(PD_NOSELECTION ,IOR(PD_ENABLEPRINTHOOK , &
                      IOR(PD_ENABLEPRINTTEMPLATE , IOR(PD_ENABLESETUPHOOK , &
                      IOR(PD_ENABLESETUPTEMPLATE , PD_PRINTSETUP)))))))
         pd%lpfnSetupHook = LOC(PrintSetupHookProc)  !MakeProcInstance(LOC(PrintSetupHookProc),NULL) 
         pd%lpSetupTemplateName = INT(MAKEINTRESOURCE(INT2(PRNSETUPDLGORD)))
         pd%lpfnPrintHook = LOC(PrintDlgHookProc)   !MakeProcInstance(LOC(PrintDlgHookProc),NULL) 
         pd%lpPrintTemplateName = INT(MAKEINTRESOURCE(INT2(PRINTDLGORD)))
   end select
   ! print a test page if successful
   if (PrintDlg(pd)) then
      i  = Escape(pd%hDC, F90STARTDOC, 8, "Test-Doc"C, NULL)

      ! Print text
      i = TextOut(pd%hDC, 5, 5, FileBuf, len(FileBuf))

      i = Escape(pd%hDC, NEWFRAME, 0, null_character, NULL)
      i = Escape(pd%hDC, F90ENDDOC, 0, null_character, NULL )
      i = DeleteDC(pd%hDC)
      if (pd%hDevMode .ne. 0) then
         i = GlobalFree(pd%hDevMode)
      end if
      if (pd%hDevNames .ne. 0) then
         i = GlobalFree(pd%hDevNames)
      end if
   else
      call ProcessCDError(CommDlgExtendedError(), hWnd )
   end if
end 




