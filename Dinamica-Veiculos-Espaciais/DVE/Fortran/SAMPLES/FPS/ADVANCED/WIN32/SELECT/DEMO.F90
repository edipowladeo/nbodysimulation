!****************************************************************************
!*
!*    PROGRAM: Demo.f90
!*
!*    PURPOSE: Demonstrates how to manipulate a cursor and select a region
!*
!*    FUNCTIONS:
!*
!*        WinMain() - calls initialization function, processes message loop
!*        DemoInit() - initializes window data and registers window
!*        DemoWndProc() - processes messages
!*        About() - processes messages for "About" dialog box
!*
!*    COMMENTS:
!*        This code is a modified version of the CURSOR.C program.  Instead of
!*        using inline code for drawing the shape, the routines from the Select
!*        library are called.
!*
!****************************************************************************/

use msfwina
include 'demo.fi'
include 'select.fi'
end


integer*4 function WinMain(hInstance,hPrevInstance,lpCmdLine, nCmdShow)
!MS$ ATTRIBUTES STDCALL, ALIAS:'_WinMain@16' :: WinMain
use msfwina
use demoin
use selectin
include 'demo.fi'

integer*4       hInstance
integer*4       hPrevInstance
integer*4       lpCmdLine
integer*4       nCmdShow
integer*4       hWnd
type (T_MSG)    mesg

lpcmdline = lpcmdline

   bTrack = FALSE
   OrgX = 0
   OrgY = 0
   PrevX = 0
   PrevY = 0
   X = 0
   Y = 0
   rect1%left = 0
   rect1%top = 0
   rect1%right = 0
   rect1%bottom = 0

   Shape = SL_BLOCK             ! Shape to use for rectangle 
   RetainShape = FALSE          ! Retain or destroy shape    
   if (hPrevInstance == 0) then
      if (DemoInit(hInstance) == 0) then
         WinMain = 0
         return 
      end if
   end if
   hInst = hInstance
   
   hWnd = CreateWindowEx(0,"Demo"C ,&
            "Demo Sample Application"C,&
            INT (WS_OVERLAPPEDWINDOW), &
            CW_USEDEFAULT,&
            CW_USEDEFAULT,&
            CW_USEDEFAULT,&
            CW_USEDEFAULT,&
            NULL,&
            NULL,&
            hInstance,&
            NULL)

   if (hWnd == 0) then
      WinMain = 0
      return 
   end if

   i = ShowWindow(hWnd, nCmdShow)
   i = UpdateWindow(hWnd)

   do while (GetMessage(mesg, NULL, 0, 0)) 
      i = TranslateMessage(mesg)
      i = DispatchMessage(mesg)
   end do

   WinMain = mesg%wParam
   return
end

!****************************************************************************
!*
!*    FUNCTION: DemoInit(HANDLE)
!*
!*    PURPOSE: Initializes window data and registers window class
!*
!****************************************************************************/

integer*4 function DemoInit(hInstance)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DemoInit@4' :: DemoInit
use msfwina
use demoin

interface 
integer function DemoWndProc(x, y, z, w)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DemoWndProc@16' :: DemoWndProc
integer*4 x 
integer*4 y 
integer*4 z 
integer*4 w 
end function
end interface

interface 
integer function About(x, y, z, w)
!MS$ ATTRIBUTES STDCALL, ALIAS: '_About@16' :: About
integer*4 x 
integer*4 y 
integer*4 z 
integer*4 w 
end function
end interface


integer*4       hInstance
type (T_WNDCLASS)   pWndClass
integer*4       bSuccess
character*100       lpszClassName, lpszMenuName

   lpszMenuName = "Menu"C
   lpszClassName = "Demo"C
   pWndClass%hCursor = LoadCursor(NULL, IDC_ARROW)
   pWndClass%hIcon = LoadIcon(NULL, IDI_APPLICATION)
   pWndClass%lpszMenuName = LOC(lpszMenuName)
   pWndClass%lpszClassName = LOC(lpszClassName)
   pWndClass%hbrBackground = GetStockObject(WHITE_BRUSH)
   pWndClass%hInstance = hInstance
   pWndClass%style = 0
   pWndClass%lpfnWndProc = LOC(DemoWndProc)

   bSuccess = RegisterClass(pWndClass)

   DemoInit = bSuccess
   return
end
