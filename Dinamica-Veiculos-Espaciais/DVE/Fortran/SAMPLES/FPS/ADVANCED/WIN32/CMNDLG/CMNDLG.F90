!****************************************************************************
!*
!*
!*    PROGRAM: CmnDlg.f90
!*
!*    PURPOSE: Sample demonstrating the use of the common dialogs in Windows
!*
!*    FUNCTIONS:
!*
!*        WinMain() - calls initialization function, processes message loop
!*        InitApplication() - initializes window data and registers window
!*        InitInstance() - saves instance handle and creates main window
!*        MainWndProc() - processes messages
!*        About() - processes messages for "About" dialog box
!*        OpenNewFile() - opens a new file
!*        SaveToFile() - saves the current text buffer to the current filename
!*        SaveAs() - saves the current text buffer to a new file name
!*        EnterNew() - to enter new text into the text buffer
!*        FileOpenHookProc() - Hook procedure for GetOpenFileName() common dialog
!*        FileSaveHookProc() - Hook procedure for GetSaveFileName() common dialog
!*        ChooseFontHookProc() - Hook procedure for ChooseFont() common dialog
!*        FindTextHookProc() - Hook procedure for FindText() common dialog
!*        ReplaceTextHookProc() - Hook procedure for the ReplaceText() common dialog
!*        PrintDlgHookProc() - Hook procedure for the PrintDlg() common dialog
!*        PrintSetupHookProc() - Hook procedure for the PrintDlg() setup common dialog
!*        SearchFile() - Searches for the specified text in the file buffer
!*        ChooseNewFont() - chooses a new font for display
!*        ChooseNewColor() - chooses a new color for display
!*        PrintFile() - prints the current text in the file buffer
!*        CallFindText() - calls the FindText() common dialog function
!*        CallReplaceText() - calls the ReplaceText() common dialog function
!*        ProcessCDError() - uses CommonDialogExtendedError() to output useful error messages
!*
!*    COMMENTS:
!*
!*
!*        The common dialog APIs demonstrated in the sample include:
!*
!*            ChooseColor()
!*            ChooseFont()
!*            FindText()
!*            GetOpenFileName()
!*            GetSaveFileName()
!*            PrintDlg()
!*            ReplaceText()
!*
!*
!*        Each dialog box is demonstrated being used in three different ways:
!*        standard, using a modified template and using a hook function.
!*
!*
!****************************************************************************

use msfwina
end

!****************************************************************************
!*
!*    FUNCTION: WinMain(HANDLE, HANDLE, LPSTR, int)
!*
!*    PURPOSE: calls initialization function, processes message loop
!*
!*    COMMENTS:
!*
!*
!****************************************************************************

integer function WinMain( hInstance, hPrevInstance, lpCmdLine, nCmdShow )
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WinMain@16' :: WinMain
use cmndlgin

integer hInstance, hPrevInstance, nCmdShow
integer lpCmdLine

type (T_MSG)    mesg             ! message                   

lpCmdLine = lpCmdLine

   szDirName  = ""C
   szFile  = "\0"C
   szFilter = "Text Files (*.TXT)\0*.TXT\0All Files (*.*)\0*.*\0"C
   szFindString   = ""C
   szReplaceString  = ""C
   wMode = IDM_STANDARD

   if (hPrevInstance .eq. 0) then        !  Other instances of app running?  
      if (InitApplication(hInstance)== 0) then !  Initialize shared things  
         WinMain = FALSE
         return              !  Exits if unable to initialize      
      end if
   end if
   hInst = hInstance

! Perform initializations that apply to a specific instance 

   if (InitInstance(hInstance, nCmdShow)== 0) then
      WinMain = FALSE
      return
   end if

! register window message for FindText() and ReplaceText() hook procs
   FindReplaceMsg = RegisterWindowMessage("commdlg_FindReplace"C)

! Acquire and dispatch messages until a WM_QUIT message is received. 

   do while (GetMessage(mesg,& !  message structure                       
            NULL,&                  !  handle of window receiving the message  
            0,&                     !  lowest message to examine               
            0))                    !  highest message to examine              
      i = TranslateMessage(mesg)    !  Translates virtual key codes            
      i = DispatchMessage(mesg)     !  Dispatches message to window            
   end do
   WinMain = mesg%wParam           !  Returns the value from PostQuitMessage  
end 


!****************************************************************************
!*
!*    FUNCTION: InitApplication(HANDLE)
!*
!*    PURPOSE: Initializes window data and registers window class
!*
!*    COMMENTS:
!*
!*        In this function, we initialize a window class by filling out a data
!*        structure of type WNDCLASS and calling the Windows RegisterClass()
!*        function.
!*
!****************************************************************************

integer*4 function InitApplication( hInstance ) ! current instance             
use msfwina

interface 
integer*4 function MainWndProc( hWnd, message, wParam, lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MainWndProc@16':: MainWndProc
integer  hWnd , message , wParam, lParam
end function
end interface

integer             hInstance
type (T_WNDCLASS)   wc
character*100       lpszClassName, lpszMenuName


! Fill in window class structure with parameters that describe the   
! main window.                                                       
   lpszClassName = "CmnDlgWClass"C
   lpszMenuName = "CmnDlgMenu"C
   wc%style = 0                       ! Class style(s).                     
   wc%lpfnWndProc = LOC(MainWndProc)  ! Function to retrieve messages for   
                                     ! windows of this class.              
   wc%cbClsExtra = 0                  ! No per-class extra data.            
   wc%cbWndExtra = 0                  ! No per-window extra data.           
   wc%hInstance = hInstance           ! Application that owns the class.    
   wc%hIcon = LoadIcon(NULL, IDI_APPLICATION)
   wc%hCursor = LoadCursor(NULL, IDC_ARROW)
   wc%hbrBackground = GetStockObject(WHITE_BRUSH) 
   wc%lpszMenuName =  LOC(lpszMenuName)   ! Name of menu resource in .RC file.  
   wc%lpszClassName = LOC(lpszClassName) ! Name used in call to CreateWindow.  

   !  Register the window class and return success/failure code.  

   InitApplication = RegisterClass(wc)
end 
