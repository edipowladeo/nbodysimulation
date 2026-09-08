!****************************************************************************
!
!    PROGRAM: Input.f90
!
!    PURPOSE: Input template for Windows applications
!
!    FUNCTIONS:
!
!        WinMain() - calls initialization function, processes message loop
!        InitApplication() - initializes window data and registers window
!        InitInstance() - saves instance handle and creates main window
!        MainWndProc() - processes messages
!        About() - processes messages for "About" dialog box
!
!****************************************************************************
use msfwin
end

!****************************************************************************
!
!    FUNCTION: WinMain(HANDLE, HANDLE, LPSTR, int)
!
!    PURPOSE: calls initialization function, processes message loop
!
!(****************************************************************************

integer*4 function WinMain(hInstance, hPrevInstance, lpCmdLine, nCmdShow)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WinMain@16' :: WinMain
use inputgl
use inputin
integer  hInstance
integer  hPrevInstance
integer  lpCmdLine
integer  nCmdShow

type (T_MSG)  mesg
integer iTemp

   lpCmdLine = lpCmdLine

   if (hPrevInstance == 0) then
      iTemp = hInstance
      if (InitApplication(hInstance) == 0) then
         WinMain = FALSE
         return
      end if
   end if

   if (InitInstance(hInstance, nCmdShow) == 0) then
      WinMain = FALSE
      return
   end if

   do while (GetMessage(mesg, NULL, 0, 0))
      i = TranslateMessage(mesg)
      i = DispatchMessage(mesg)
   end do
   WinMain = mesg%wParam
   return
end 


!****************************************************************************
!
!    FUNCTION: InitApplication(HANDLE)
!
!    PURPOSE: Initializes window data and registers window class
!
!****************************************************************************

integer*4 function InitApplication( hInstance )
!MS$ ATTRIBUTES STDCALL, ALIAS : '_InitApplication@4' :: InitApplication
use inputgl
interface 
integer function InitInstance(hInstance,nCmdShow) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_InitInstance@8' :: InitInstance 
integer         hInstance
integer         nCmdShow
end function InitInstance
end interface

interface 
integer function  MainWndProc(hWnd,messsage,wParam,lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MainWndProc@16' :: MainWndProc
integer     hWnd
integer     messsage 
integer     wParam 
integer     lParam 
end function MainWndProc
end interface

interface 
integer function  About(hDlg,messsage,wParam,lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_About@16' :: About 
integer     hDlg 
integer     messsage 
integer     wParam 
integer     lParam 
end function About
end interface
integer hInstance


type (T_WNDCLASS)    wc
integer iTemp
character*100     lpszClassName, lpszMenuName

   iTemp = hInstance
   lpszClassName = "InputWClass"C
   lpszMenuName = "InputMenu"C
   wc%style  = CS_DBLCLKS          !/* double-click messages */
   wc%lpfnWndProc  = LOC(MainWndProc)
   wc%cbClsExtra  = 0
   wc%cbWndExtra  = 0
   wc%hInstance  = hInstance
   wc%hIcon  = LoadIcon(NULL, IDI_APPLICATION)
   wc%style = IOR(CS_HREDRAW, CS_VREDRAW)
   wc%hCursor  = LoadCursor(NULL, IDC_ARROW)
   wc%hbrBackground  = GetStockObject(WHITE_BRUSH) 
   wc%lpszMenuName  =  LOC(lpszMenuName)
   wc%lpszClassName  = LOC(lpszClassName)

   InitApplication  = RegisterClass(wc)
end 

