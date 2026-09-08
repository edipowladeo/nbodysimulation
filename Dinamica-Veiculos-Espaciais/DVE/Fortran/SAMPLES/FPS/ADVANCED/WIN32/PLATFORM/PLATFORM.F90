 
!******************************************************************************
!*       This is a part of the Microsoft Source Code Samples. 
!*       Copyright (C) 1993 Microsoft Corporation.
!*       All rights reserved. 
!*       This source code is only intended as a supplement to 
!*       Microsoft Development Tools and/or WinHelp documentation.
!*       See these sources for detailed information regarding the 
!*       Microsoft samples programs.
!******************************************************************************

!**********************************************************************
!*  platform.f90 --    platform program template for Windows program  *
!*                                                                    *
!*  Comments:                                                         *
!*                                                                    *
!*  Functions:                                                        *
!*                                                                    *
!*  WinMain()         - Initializes Application                       *
!*  MainWndProc()     - Processes Application Messages                *
!*  AboutDlgProc()    - Processes "About" Dialog Box Messages         *
!*                                                                    *
!*                                                                    *
!**********************************************************************
interface
integer(4) function WinMain (hInstance, hPrevInstance, lpszCmdLine, nCmdShow)
!MS$ATTRIBUTES STDCALL, ALIAS : '_WinMain@16' :: WinMain
integer(4) hInstance
integer(4) hPrevInstance
integer(4) lpszCmdLine
integer(4) nCmdShow
end function WinMain
end interface
end

!**********************************************************************
!*  Function: int APIENTRY WinMain(HINSTANCE, HINSTANCE, LPSTR, int)  *
!*                                                                    *
!*   Purpose: Initializes Application                                 *
!*                                                                    *
!*  Comments: Standard template                                       *
!*                                                                    *
!*                                                                    *
!**********************************************************************
integer function WinMain( hInstance, hPrevInstance, lpszCmdLine, nCmdShow )
!MS$ATTRIBUTES STDCALL, ALIAS : '_WinMain@16' :: WinMain
use msfwin
use platinc
integer hInstance, hPrevInstance, lpszCmdLine, nCmdShow

interface 
integer(4) function MainWndProc( hwnd, mesg, wParam, lParam )
!MS$ATTRIBUTES STDCALL, ALIAS : '_MainWndProc@16' :: MainWndProc
integer  hwnd 
integer mesg 
integer wParam 
integer lParam 
end function MainWndProc
end interface

  type(T_WNDCLASS)      wc
  type(T_MSG)               mesg
  integer                   hWnd
  integer hmenu
  integer(4)      bret
  character*100   lpszClassName, lpszMenuNAme, lpszAppName

lpszcmdline = lpszcmdline

   lpszClassName ="Platform"C
   lpszMenuName = "PlatformMenu"C
   lpszAppName = "Platform Sample Application"C
   if(hPrevInstance == 0) then
      wc%lpszClassName = LOC(lpszClassName)
      wc%lpfnWndProc = LOC(MainWndProc)
      wc%style = 0 
      wc%hInstance = hInstance

      wc%hIcon = LoadIcon( NULL, IDI_APPLICATION)
      wc%hCursor = LoadCursor( NULL, IDC_ARROW )
      wc%hbrBackground = GetStockObject(WHITE_BRUSH)
      wc%lpszMenuName = LOC(lpszMenuName) 
      wc%cbClsExtra = 0
      wc%cbWndExtra = 0

      i2 =  RegisterClass(wc)
    end if

   hmenu = LoadMenu(hInstance, LOC(lpszMenuNAme))

    ghInstance = hInstance

          hWnd = CreateWindowEx(0, lpszClassName,              &
                  lpszAppName,            &
                  INT4(WS_OVERLAPPEDWINDOW),                      &
                  10,                                             &
                  10,                                             &
                  600,                                            &
                  400,                                            &
                  NULL,                                           &
                  hmenu,                                          &
                  hInstance,                                      &
                  NULL                                            &
                )

  i = ShowWindow( hWnd, nCmdShow )

   do while( GetMessage( mesg, NULL, 0, 0 )) 
      bret =  TranslateMessage( mesg )
      i =  DispatchMessage( mesg )
   end do

WinMain = mesg%wParam
end 


integer function MainWndProc( hWnd, mesg, wParam, lParam )
!MS$ATTRIBUTES STDCALL, ALIAS : '_MainWndProc@16' :: MainWndProc
use msfwin
use platinc
integer hWnd, mesg, wParam, lParam

interface
integer(4) function AboutDlgProc( hwnd, mesg, wParam, lParam )
!MS$ATTRIBUTES STDCALL, ALIAS : '_AboutDlgProc@16' :: AboutDlgProc
integer  hwnd 
integer mesg 
integer wParam 
integer lParam 
end function AboutDlgProc
end interface

integer*4      ret, version
character*55  buf
character*30  buf1

  select case ( mesg )
      case (WM_COMMAND)
         select case ( INT4(LOWORD(wParam ) ))

            case (IDM_PLATFORM) 

               version = GetVersion()
               write(buf,10) LoByte(LoWord(version)), HiByte(LoWord(version)) 
10             format ('The version of Windows you are running is ',I2,'.',I2)
               ret = MessageBox( hWnd, buf, "Platform"C, MB_OK )
  
               if ( IAND (version , WIN32S) .NE. 0 ) then   
                  write(buf1,20) 
20                format ('This is running on Win32S ')
               else
                  write(buf1,30)  
30                format ('This is running on Win32/NT ')
               end if
               ret = MessageBox( hWnd, buf1,"Platform"C, MB_OK )

            case (IDM_ABOUT)
               ret = DialogBoxParam(ghInstance, LOC("AboutDlg"C),hWnd, LOC(AboutDlgProc), 0)

            case DEFAULT
               WndProc = DefWindowProc(hWnd, message, wParam, lParam)
               return
         end select

!****************************************************************
!*     WM_DESTROY: PostQuitMessage() is called                  *
!****************************************************************

      case (WM_DESTROY)
         call PostQuitMessage( 0 )

!****************************************************************
!*     Let the default window proc handle all other messages    *
!****************************************************************

      case DEFAULT
         MainWndProc =  DefWindowProc( hWnd, mesg, wParam, lParam )
         return
   end select

end 

