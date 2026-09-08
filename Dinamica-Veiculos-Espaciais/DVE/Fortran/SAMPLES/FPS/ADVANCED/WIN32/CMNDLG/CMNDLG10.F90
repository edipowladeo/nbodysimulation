!****************************************************************************
!*
!*    FUNCTION:  InitInstance(HANDLE, int)
!*
!*    PURPOSE:  Saves instance handle and creates main window
!*
!*    COMMENTS:
!*
!*        In this function, we save the instance handle in a static variable and
!*        create and display the main program window.
!*
!****************************************************************************

integer*4 function InitInstance( hInstance, nCmdShow )
use cmndlgin
  
integer          hInstance   !  Current instance identifier.        
integer          nCmdShow    !  Param for first ShowWindow() call.  
integer          hWnd        !  Main window handle.                 
character*100    lpszClassName

 
!  Save the instance handle in static variable, which will be used in   
!  many subsequence calls from this application to Windows.             
 
   hInst = hInstance

!  Create a main window for this application instance.   
   lpszClassName = "CmnDlgWClass"C
   hWnd = CreateWindowEx(0,&
        lpszClassName,&                  !  See RegisterClass() call.           
        "Common Dialogs Sample Application"C,&   !  Text for window title bar.          
        INT (WS_OVERLAPPEDWINDOW),&      !  Window style.                       
        CW_USEDEFAULT,&                  !  Default horizontal position.        
        CW_USEDEFAULT,&                  !  Default vertical position.          
        CW_USEDEFAULT,&                  !  Default width.                      
        CW_USEDEFAULT,&                  !  Default height.                     
        NULL,&                           !  Overlapped windows have no parent.  
        NULL,&                           !  Use the window class menu.          
        hInstance,&                      !  This instance owns this window.     
        NULL&                            !  Pointer not needed.                 
        )
!  If window could not be created, return "failure"  

   if (hWnd == 0) then
      ierror = GetLastError ()
      InitInstance = 0
      return
   end if
!  Make the window visible update its client area; and return "success"  
   i = ShowWindow(hWnd, nCmdShow)  !  Show the window                         
   i = UpdateWindow(hWnd)          !  Sends WM_PAINT message                  
   InitInstance = 1
   return
end 

! ***************************************************************************
!*
!*    FUNCTION: SaveAs(HWND)
!*
!*    PURPOSE:  Invokes the common dialog function to save the current
!*              buffer to a file.
!*    COMMENTS:
!*
!*        This function initializes the OPENFILENAME structure for any
!*        mode selected by the user: standard, using a hook or using a
!*        customized template.  It then calls the GetSaveFileName()
!*        common dialog function.
!*
!*    RETURN VALUES:
!*        TRUE - The file was saved successfully.
!*        FALSE - The buffer was not saved to a file.
!*
!*************************************************************************** 
integer*4 function SaveAs( hWnd )                 
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


integer     hWnd
character*100  lpszTitle, lpszDefExt

   szFile = "*.*"C
   szFileTitle = " "C
   lpszTitle = "Save File As"C
   lpszDefExt = "txt"C
   iret = lstrcpy(szFilter,"Text Files (*.TXT)|*.TXT|All Files (*.*)|*.*||"C)
   call ConvertFilterString(szFilter)

   OpenFN%lStructSize       = 76 !sizeof(OpenFN)
   OpenFN%hwndOwner         = hWnd
   OpenFN%hInstance         = hInst
   OpenFN%lpstrFilter       = LOC(szFilter)
   OpenFN%lpstrCustomFilter = NULL
   OpenFN%nMaxCustFilter    = 0
   OpenFN%nFilterIndex      = 1
   OpenFN%lpstrFile         = LOC(szFile)
   OpenFN%nMaxFile          = 256!sizeof(szFile)
   OpenFN%lpstrFileTitle    = LOC(szFileTitle)
   OpenFN%nMaxFileTitle     = 256!sizeof(szFileTitle)
   OpenFN%lpstrInitialDir   = NULL
   OpenFN%lpstrTitle        = LOC(lpszTitle)
   OpenFN%nFileOffset       = 0
   OpenFN%nFileExtension    = 0
   OpenFN%lpstrDefExt       = LOC(lpszDefExt)
   OpenFN%lCustData         = 0

   select case( wMode )
      case (IDM_STANDARD)
         OpenFN%Flags = 0
         OpenFN%lpfnHook = NULL
         OpenFN%lpTemplateName = NULL

      case (IDM_HOOK)
         OpenFN%Flags = OFN_ENABLEHOOK
         OpenFN%lpfnHook = LOC(FileSaveHookProc) 
         OpenFN%lpTemplateName = NULL

      case (IDM_CUSTOM)
         OpenFN%Flags = IOR(OFN_ENABLEHOOK , OFN_ENABLETEMPLATE)
         OpenFN%lpfnHook = LOC(FileSaveHookProc) 
         OpenFN%lpTemplateName = MAKEINTRESOURCE( INT(FILEOPENORD))
   end select                     
   
   if ( GetSaveFileName( OpenFN ) .neqv. .FALSE.) then
      SaveAs = SaveToFile( hWnd )
      return
   else
      call ProcessCDError(CommDlgExtendedError(), hWnd )
      SaveAs=FALSE
      return
   end if
SaveAs=FALSE
return
end 


