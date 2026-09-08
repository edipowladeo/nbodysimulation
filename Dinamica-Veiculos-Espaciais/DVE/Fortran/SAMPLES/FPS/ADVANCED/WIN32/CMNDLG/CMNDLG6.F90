! ***************************************************************************
!*
!*    FUNCTION: ChooseColorHookProc(HWND, UINT, UINT, LONG)
!*
!*    PURPOSE:  Processes messages for ChooseColor common dialog box
!*
!*    COMMENTS:
!*
!*        This hook procedure simply prompts the user whether or not they
!*        want to change the color.  if they choose YES, the color of the
!*        text will be changed and the dialog will be dismissed.  If they
!*        choose NO, the color will not be changed and the user will be
!*        returned to the dialog
!*
!*    RETURN VALUES:
!*        TRUE - User chose 'Yes' from the "Are you sure message box".
!*        FALSE - User chose 'No' return to the dialog box.
!*
!*************************************************************************** 

integer*4 function ChooseColorHookProc(hDlg,message,wParam,lParam)
!MS$ ATTRIBUTES STDCALL, ALIAS :'_ChooseColorHookProc@16' :: ChooseColorHookProc
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


integer hDlg    !  window handle of the dialog box  
integer message  !   type of message                  
integer wParam   !  message-specific information     
integer lParam
character*100     lpszMessage, lpszHeader

lparam = lparam

   select case (message)
      case (WM_COMMAND)
         if (LOWORD(wParam) == IDOK) then
            lpszMessage = "Are you sure you want to change the color?"C
            lpszHeader = "Information"C
            if (MessageBox( hDlg, &
               lpszMessage,&
               lpszHeader, MB_YESNO ) == IDYES ) then
            end if
         ChooseColorHookProc =TRUE
         return
      end if
   end select
   ChooseColorHookProc =FALSE
end 


! ***************************************************************************
!*
!*    FUNCTION: ChooseNewColor(HWND)
!*
!*    PURPOSE:  Invokes common dialog function to chose a new color.
!*
!*    COMMENTS:
!*        This function initializes the CHOOSECOLOR structure for any
!*        mode the user chooses: standard, using a hook or using a
!*        customized template.  It then calls the ChooseColor()
!*        common dialog function.
!*
!*    RETURN VALUES:
!*        TRUE - A new color was chosen.
!*        FALSE - No new color was chosen.
!*
!*************************************************************************** 
integer*4 function ChooseNewColor( hWnd )
use cmndlgin

integer hWnd

interface 
integer function ChooseColorHookProc( hDlg, message, wParam,  lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ChooseColorHookProc@16':: ChooseColorHookProc
integer hDlg, message, wParam, lParam
end function
end interface


integer dwColor
integer dwCustClrs(16)
integer fSetColor 
integer i

   fSetColor =FALSE


   do i = 1, 15
      dwCustClrs(i) = RGB( INT1(255), INT1(255), INT1(255))
   end do
   dwColor = RGB( INT1(0), INT1(0), INT1(0) )
   chsclr%lStructSize = 36
   chsclr%hwndOwner = hWnd
   chsclr%hInstance = hInst
   chsclr%rgbResult = dwColor
   chsclr%lpCustColors = LOC(dwCustClrs)
   chsclr%lCustData = 0

   select case( wMode )
      case (IDM_HOOK, IDM_CUSTOM)
         chsclr%Flags = IOR(CC_PREVENTFULLOPEN , CC_ENABLEHOOK)
         chsclr%lpfnHook = LOC(ChooseColorHookProc) 
         chsclr%lpTemplateName = NULL

      case (IDM_STANDARD)
         chsclr%Flags = CC_PREVENTFULLOPEN
         chsclr%lpfnHook = NULL
         chsclr%lpTemplateName = NULL
   end select

   fSetColor = ChooseColor( chsclr )
   if ( fSetColor .ne. 0) then
      crColor = chsclr%rgbResult
      ChooseNewColor=.TRUE.
   else
      call ProcessCDError(CommDlgExtendedError(), hWnd )
      ChooseNewColor=.FALSE.
   end   if
end 

! ***************************************************************************
!*
!*    FUNCTION: ProcessCDError(DWORD)
!*
!*    PURPOSE:  Processes errors from the common dialog functions.
!*
!*    COMMENTS:
!*
!*        This function is called whenever a common dialog function
!*        fails.  The CommonDialogExtendedError() value is passed to
!*        the function which maps the error value to a string table.
!*        The string is loaded and displayed for the user.
!*
!*    RETURN VALUES:
!*        void.
!*
!*************************************************************************** 
subroutine ProcessCDError( dwErrorCode, hWnd)
use cmndlgin

integer         dwErrorCode, hWnd
integer         wStringID
character*256   buf


   select case(dwErrorCode)
      case (CDERR_DIALOGFAILURE)   
         wStringID=IDS_DIALOGFAILURE   
         
      case (CDERR_STRUCTSIZE)      
         wStringID=IDS_STRUCTSIZE      

      case (CDERR_INITIALIZATION)  
         wStringID=IDS_INITIALIZATION  

      case (CDERR_NOTEMPLATE)      
         wStringID=IDS_NOTEMPLATE      

      case (CDERR_NOHINSTANCE)     
         wStringID=IDS_NOHINSTANCE     

      case (CDERR_LOADSTRFAILURE)  
         wStringID=IDS_LOADSTRFAILURE  

      case (CDERR_FINDRESFAILURE)  
         wStringID=IDS_FINDRESFAILURE  

      case (CDERR_LOADRESFAILURE)  
         wStringID=IDS_LOADRESFAILURE  

      case (CDERR_LOCKRESFAILURE)  
         wStringID=IDS_LOCKRESFAILURE  

      case (CDERR_MEMALLOCFAILURE) 
         wStringID=IDS_MEMALLOCFAILURE 

      case (CDERR_MEMLOCKFAILURE)  
         wStringID=IDS_MEMLOCKFAILURE  

      case (CDERR_NOHOOK)          
         wStringID=IDS_NOHOOK          

      case (PDERR_SETUPFAILURE)    
         wStringID=IDS_SETUPFAILURE    

      case (PDERR_PARSEFAILURE)    
         wStringID=IDS_PARSEFAILURE    

      case (PDERR_RETDEFFAILURE)   
         wStringID=IDS_RETDEFFAILURE   

      case (PDERR_LOADDRVFAILURE)  
         wStringID=IDS_LOADDRVFAILURE  

      case (PDERR_GETDEVMODEFAIL)  
         wStringID=IDS_GETDEVMODEFAIL  

      case (PDERR_INITFAILURE)     
         wStringID=IDS_INITFAILURE     

      case (PDERR_NODEVICES)       
         wStringID=IDS_NODEVICES       

      case (PDERR_NODEFAULTPRN)    
         wStringID=IDS_NODEFAULTPRN    

      case (PDERR_DNDMMISMATCH)    
         wStringID=IDS_DNDMMISMATCH    

      case (PDERR_CREATEICFAILURE) 
         wStringID=IDS_CREATEICFAILURE 

      case (PDERR_PRINTERNOTFOUND) 
         wStringID=IDS_PRINTERNOTFOUND 

      case (CFERR_NOFONTS)         
         wStringID=IDS_NOFONTS         

      case (FNERR_SUBCLASSFAILURE) 
         wStringID=IDS_SUBCLASSFAILURE 

      case (FNERR_INVALIDFILENAME) 
         wStringID=IDS_INVALIDFILENAME 

      case (FNERR_BUFFERTOOSMALL)  
         wStringID=IDS_BUFFERTOOSMALL  


      case (0)   ! User may have hit CANCEL or we got a *very* random error
         return
      case default
         wStringID=IDS_UNKNOWNERROR
   end select

   i = LoadString(NULL, wStringID, buf, len(buf))
   i = MessageBox(hWnd, buf, ""C, MB_OK)
   return
end 
