! ***************************************************************************
!*
!*    FUNCTION: ChooseFontHookProc(HWND, UINT, UINT, LONG)
!*
!*    PURPOSE:  Processes messages for ChooseFont common dialog box
!*
!*    COMMENTS:
!*
!*        This hook procedure simply prompts the user whether or not they
!*        want to change the font.  if they choose YES, the color of the
!*        font will be changed and the dialog will be dismissed.  If they
!*        choose NO, the font will not be changed and the user will be
!*        returned to the dialog
!*
!*        If the current mode is set to use a customized template, the
!*        color drop down combo box is hidden.
!*
!*    RETURN VALUES:
!*        TRUE - Change the font.
!*        FALSE - Return to the dialog box.
!*
!*************************************************************************** 

integer*4 function ChooseFontHookProc( hDlg,message,wParam,lParam)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ChooseFontHookProc@16' :: ChooseFontHookProc
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

lParam = lParam

   select case (message)
      case (WM_INITDIALOG)
         if (IOR(chf%Flags , CF_ENABLETEMPLATE) .ne. 0) then
            i = ShowWindow(GetDlgItem(hDlg, stc4), SW_HIDE)
            i = ShowWindow(GetDlgItem(hDlg, cmb4), SW_HIDE)
            ChooseFontHookProc=TRUE
            return
         end if
      case (WM_COMMAND)
         if (LOWORD(wParam) == IDOK) then
            if (MessageBox( hDlg,"Are you sure you want to change the font?"C,&
                            "Information"C , MB_YESNO ) == IDYES ) then
                    ChooseFontHookProc=FALSE
                    return
            end if
            ChooseFontHookProc=TRUE
            return
         end if
   end select
   ChooseFontHookProc=FALSE
   return
end 


! ***************************************************************************
!*
!*    FUNCTION: ChooseNewFont(HWND)
!*
!*    PURPOSE:  Invokes common dialog function to chose a new font.
!*
!*    COMMENTS:
!*
!*        This function initializes the CHOOSEFONT structure for any mode
!*        the user chooses: standard, using a hook or using a customized
!*        template.  It then calls the ChooseFont() common dialog function.
!*
!*    RETURN VALUES:
!*        TRUE - A new font was chosen.
!*        FALSE - No new font was chosen.
!*
!*************************************************************************** 
integer*4 function ChooseNewFont( hWnd )
use cmndlgin

integer hWnd

interface 
integer function ChooseFontHookProc( hDlg, message, wParam,  lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ChooseFontHookProc@16':: ChooseFontHookProc
integer hDlg, message, wParam, lParam
end function
end interface

integer hDC


   hDC = GetDC( hWnd )
   chf%hDC = CreateCompatibleDC( hDC )
   i = ReleaseDC( hWnd, hDC )
   chf%lStructSize = 60 !sizeof(CHOOSEFONT)
   chf%hwndOwner = hWnd
   chf%lpLogFont = LOC(lf)
   chf%Flags = IOR(CF_SCREENFONTS , CF_EFFECTS)
   chf%rgbColors = RGB(INT1(0), INT1(255), INT1(255))
   chf%lCustData = 0
   chf%hInstance = hInst
   chf%lpszStyle = NULL
   chf%nFontType = SCREEN_FONTTYPE
   chf%nSizeMin = 0
   chf%nSizeMax = 0

   select case( wMode )
      case (IDM_STANDARD)
         chf%Flags = IOR(CF_SCREENFONTS , CF_EFFECTS)
         chf%lpfnHook = NULL
         chf%lpTemplateName = NULL

      case (IDM_HOOK)
         chf%Flags = IOR(CF_SCREENFONTS,IOR(CF_EFFECTS ,CF_ENABLEHOOK))
         chf%lpfnHook = LOC(ChooseFontHookProc) 
         chf%lpTemplateName = NULL

      case (IDM_CUSTOM)
         chf%Flags = IOR(CF_SCREENFONTS , IOR(CF_EFFECTS , &
                                    IOR(CF_ENABLEHOOK ,  CF_ENABLETEMPLATE)))
         chf%lpfnHook = LOC(ChooseFontHookProc) 
         chf%lpTemplateName = INT(MAKEINTRESOURCE(INT2(FORMATDLGORD31)))
   end select


   if( ChooseFont( chf ) .eqv. .FALSE. ) then
      i = DeleteDC( hDC )
      call ProcessCDError(CommDlgExtendedError(), hWnd )
      ChooseNewFont=FALSE
   end if
   i = DeleteDC( hDC )
   ChooseNewFont=TRUE
end 

