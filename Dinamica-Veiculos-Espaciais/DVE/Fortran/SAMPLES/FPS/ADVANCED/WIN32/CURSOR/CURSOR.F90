!****************************************************************************
!
!    PROGRAM: Cursor.f90
!
!    PURPOSE: Demonstrates how to manipulate a cursor and select a region
!
!    FUNCTIONS:
!
!        WinMain() - calls initialization function, processes message loop
!        InitApplication() - initializes window data and registers window
!        InitInstance() - saves instance handle and creates main window
!        MainWndProc() - processes messages
!        About() - processes messages for "About" dialog box
!        sieve() - time consuming function, generates primes
!
!****************************************************************************/

use msfwina
use cursorfn
end


!****************************************************************************
!
!    FUNCTION: WinMain(HANDLE, HANDLE, LPSTR, int)
!
!    PURPOSE: calls initialization function, processes message loop
!
!****************************************************************************

integer function WinMain( hInstance, hPrevInstance, lpCmdLine, nCmdShow)
!MS$ ATTRIBUTES STDCALL ,ALIAS : '_WinMain@16' :: WinMain
use msfwina
use cursorin
use cursorfn

integer     hInstance
integer     hPrevInstance
integer     lpCmdLine
integer     nCmdShow


type (T_MSG)        mesg                 !/* message  */
type (T_WNDCLASS)   wc
integer           hwnd
character*100     lpszClassName, lpszMenuName, lpszCursorName

lpcmdline = lpcmdline
ncmdshow = ncmdshow

   bTrack = 0
   X = 0
   Y = 0
   PrevX = 0
   PrevY = 0
   OrgX = 0
   OrgY = 0
   repeat = 1
   lpszClassName = "CursorWClass"C
   lpszCursorName = "bullseye"C
   lpszMenuName = "CursorMenu"C

   if (hPrevInstance == 0) then
      wc%cbClsExtra = 0
      wc%cbWndExtra = 0
      wc%lpfnWndProc = LOC(MainWndProc)
      wc%hInstance = hInstance
      wc%hIcon = LoadIcon(NULL, IDI_APPLICATION)
      wc%hCursor = LoadCursor(hInstance, LOC(lpszCursorName))
      wc%hbrBackground = GetStockObject(WHITE_BRUSH) 
      wc%lpszMenuName =  LOC(lpszMenuName)
      wc%lpszClassName = LOC(lpszClassName)
      wc%style = IOR(CS_VREDRAW , CS_HREDRAW)
      iret = RegisterClass(wc)
      if (iret == 0) then
         WinMain = 0
         return
      end if 
   end if 
   hHourGlass = LoadCursor(NULL, IDC_WAIT)  
   hWnd = CreateWindowEx(0, &
              lpszClassName,&
              "Cursor Sample Application"C, &
              INT(WS_OVERLAPPEDWINDOW),&
              CW_USEDEFAULT,&
              CW_USEDEFAULT,&
              CW_USEDEFAULT,&
              CW_USEDEFAULT,&
              NULL,&
              NULL,&
              hInstance,&
              NULL )

   if (hWnd == 0) then
      WinMain = 0
      return
   end if    
   i = ShowWindow(hWnd, SW_SHOWNORMAL )
   i = UpdateWindow(hWnd)
   
   i = MessageBox ( GetFocus (), &
       "Use the mouse button in this program for an example of graphi&
         cs selection, or the <Enter> key for an example of using a special&
         cursor to reflect a program state."C                   &
         ,"Cursor Sample Application"C &
         , IOR(MB_ICONASTERISK , MB_OK))

   do while (GetMessage(mesg, NULL, 0, 0) .neqv. .FALSE. )
      i = TranslateMessage(mesg)
      i = DispatchMessage(mesg)
   end do
   WinMain = mesg%wParam
   return
end 

subroutine MPOINT2POINT (mpt, pt)
use msfwina
type (T_POINT) mpt, pt
   pt%x = mpt%x 
   pt%y = mpt%y
end

subroutine POINT2MPOINT (mpt, pt)
use msfwina
type (T_POINT) mpt, pt
    mpt%x = pt%x
    mpt%y = pt%y
end subroutine
