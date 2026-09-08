! ***************************************************************************
!*
!*    FUNCTION: CallFindText( HWND )
!*
!*    PURPOSE:  Initializes and calls the FindText()
!*        common dialog.
!*
!*    COMMENTS:
!*
!*        This function initialzes the FINDREPLACE structure for any mode:
!*        standard, using a hook or using a customized template.  It then
!*        calls the FindText() common dialog function.
!*
!*    RETURN VALUES:
!*        void.
!*
!*************************************************************************** 
subroutine CallFindText( hWnd )
use cmndlgin

integer hWnd

interface 
integer function FindTextHookProc( hDlg, message, wParam,  lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FindTextHookProc@16':: FindTextHookProc
integer hDlg, message, wParam, lParam
end function
end interface


   frText%lStructSize = 40 !sizeof( frText )
   frText%hwndOwner = hWnd
   frText%hInstance = hInst
   frText%lpstrFindWhat = LOC(szFindString)
   frText%lpstrReplaceWith = NULL
   frText%wFindWhatLen = len(szFindString) ! 256 !sizeof(szFindString)
   frText%wReplaceWithLen = 0
   frText%lCustData = 0

   select case( wMode )
      case (IDM_STANDARD)
         frText%Flags =  IOR(FR_NOMATCHCASE , IOR(FR_NOUPDOWN ,FR_NOWHOLEWORD))
         frText%lpfnHook = NULL
         frText%lpTemplateName = NULL

      case (IDM_HOOK)
         frText%Flags = IOR(FR_NOMATCHCASE ,IOR(FR_NOUPDOWN ,IOR(FR_NOWHOLEWORD ,FR_ENABLEHOOK)))
         frText%lpfnHook = LOC(FindTextHookProc) !MakeProcInstance(LOC(FindTextHookProc), NULL)
         frText%lpTemplateName = NULL
      case (IDM_CUSTOM)
         frText%Flags = IOR(FR_NOMATCHCASE , IOR(FR_NOUPDOWN , &
                IOR(FR_NOWHOLEWORD ,IOR(FR_ENABLEHOOK , FR_ENABLETEMPLATE))))
         frText%lpfnHook = LOC(FindTextHookProc) !MakeProcInstance(LOC(FindTextHookProc), NULL)
         frText%lpTemplateName = INT(MAKEINTRESOURCE(INT2(FINDDLGORD)))
   end select

   hDlgFR = FindText(frText)

   if (hDlgFR == NULL) then
      call ProcessCDError(CommDlgExtendedError(), hWnd )
   end if
end 


! ***************************************************************************
!*
!*    FUNCTION: CallReplaceText( HWND )
!*
!*    PURPOSE:  Initializes and calls the ReplaceText()
!*        common dialog.
!*
!*    COMMENTS:
!*
!*        This function initialzes the FINDREPLACE structure for any mode:
!*        standard, using a hook or using a customized template.  It then
!*        calls the ReplaceText() common dialog function.
!*
!*    RETURN VALUES:
!*        void.
!*
!*************************************************************************** 
subroutine CallReplaceText( hWnd )
use cmndlgin

integer hWnd

interface 
integer function ReplaceTextHookProc( hDlg, message, wParam,  lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ReplaceTextHookProc@16':: ReplaceTextHookProc
integer hDlg, message, wParam, lParam
end function
end interface

   frText%lStructSize = 40 !sizeof(frText)
   frText%hwndOwner = hWnd
   frText%hInstance = hInst
   frText%lpstrFindWhat = LOC(szFindString)
   frText%lpstrReplaceWith = LOC(szReplaceString)
   frText%wFindWhatLen = len(szFindString)
   frText%wReplaceWithLen = len( szReplaceString )
   frText%lCustData = 0

   select case( wMode )
      case (IDM_STANDARD)
         frText%Flags = IOR(FR_NOMATCHCASE , IOR(FR_NOUPDOWN , FR_NOWHOLEWORD))
         frText%lpfnHook = NULL
         frText%lpTemplateName = NULL
      case (IDM_HOOK)
         frText%Flags = IOR(FR_NOMATCHCASE , IOR(FR_NOUPDOWN ,IOR(FR_NOWHOLEWORD , FR_ENABLEHOOK)))
         frText%lpfnHook = LOC(ReplaceTextHookProc)
         frText%lpTemplateName = NULL

      case (IDM_CUSTOM)
         frText%Flags = IOR(FR_NOMATCHCASE , IOR(FR_NOUPDOWN , &
             IOR(FR_NOWHOLEWORD , IOR(FR_ENABLEHOOK , FR_ENABLETEMPLATE))))
         frText%lpfnHook = LOC(ReplaceTextHookProc)
         frText%lpTemplateName = INT(MAKEINTRESOURCE(INT2(REPLACEDLGORD)))
   end select

   hDlgFR = ReplaceText(frText)
   if ( hDlgFR  == NULL ) then
      call ProcessCDError(CommDlgExtendedError(), hWnd )
   end if
end 


