 
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
!*  world.f90-- Sample program demonstrating scaling and translating  *
!*             an image from a metafile with World Coordinate         *
!*             Transforms.                                            *
!*                                                                    *
!*  Comments:                                                         *
!*                                                                    *
!*  The application loads the specified metafile. The user can        *
!*  scale the image through a menu option and translate it via        *
!*  the scrollbars and arrow keys.                                    *
!*                                                                    *
!*  Functions:                                                        *
!*                                                                    *
!*  WinMain()         - Initializes Application                       *
!*  MainWndProc()     - Processes Application Messages                *
!*  ScaleDlgProc()    - Processes "Scale Image" Dialog Box Messages   *
!*  AboutDlgProc()    - Processes "About" Dialog Box Messages         *
!*  OpenMetaFile()    - Gets Metafile name and opens the Metafile     *
!*  SetUnityXform()   - Helper routine which sets the unity transform *
!*                                                                    *
!*                                                                    *
!!**********************************************************************
!
use msfwin
use worldfnc 
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
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WinMain@16' :: WinMain
use worldinc
use worldfnc

integer hInstance, hPrevInstance, nCmdShow, lpszCmdLine
type(T_WNDCLASS)     wc
type(T_MSG)          mesg
integer             hWnd
integer              hmenu           
character*100        lpszClassName, lpszAppName, lpszMenuName, lpszIconName

lpszCmdLine = lpszCmdLine

lpszClassName = "WorldClass"C
lpszMenuName =  "WorldMenu"C
lpszIconName = "WorldIcon"C
if(hPrevInstance == 0) then
      wc%lpszClassName = LOC(lpszClassName)
      wc%lpfnWndProc = LOC(MainWndProc)
      wc%style = IOR(CS_VREDRAW , IOR(CS_HREDRAW , CS_OWNDC))
      wc%hInstance = hInstance
      wc%hIcon = LoadIcon( hInstance, LOC(lpszIconName ))
      wc%hCursor = LoadCursor( NULL, IDC_ARROW )
      wc%hbrBackground = ( COLOR_WINDOW+1 )
      wc%lpszMenuName = 0
      wc%cbClsExtra = 0
      wc%cbWndExtra = 0

      i2 =  RegisterClass(wc)
end if

   hmenu = LoadMenu(hInstance, LOC(lpszMenuName))
   ghInstance = hInstance
   lpszAppName = "World Coordinate Transforms "C
   hWnd = CreateWindowEx(0, "WorldClass"C,          &
                 "World Coordinate Transforms "C,   &
                 INT(WS_OVERLAPPEDWINDOW),          &
                 0,                                 & 
                 0,                                 &
                 CW_USEDEFAULT,                     &
                 CW_USEDEFAULT,                     &
                 NULL,                              &
                 hmenu,                             &
                 hInstance,                         &
                 NULL                               &
           )
    i = ShowWindow( hWnd, nCmdShow )
    do while( GetMessage( mesg, NULL, 0, 0 ) .NEQV. .FALSE.) 
      i =  TranslateMessage( mesg)
      i =  DispatchMessage( mesg) 
   end do

WinMain = mesg%wParam
end 


integer function MainWndProc( hWnd, mesg, wParam, lParam )
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MainWndProc@16' :: MainWndProc
use worldinc

interface 
integer function AboutDlgProc( hwnd, mesg, wParam, lParam )
!MS$ ATTRIBUTES STDCALL , ALIAS : '_AboutDlgProc@16' :: AboutDlgProc
integer  hwnd
integer mesg 
integer wParam 
integer lParam 
end function AboutDlgProc
end interface 


interface 
integer function ScaleDlgProc( hwnd, mesg, wParam, lParam )
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ScaleDlgProc@16' :: ScaleDlgProc
integer  hwnd 
integer mesg 
integer wParam 
integer lParam 
end function ScaleDlgProc
end interface

interface 
subroutine SetUnityXform
end subroutine SetUnityXform
end interface

interface 
integer function OpenMetaFl (hwnd)
integer hwnd
end function OpenMetaFl
end interface


!/* Used for putting up File Open common dialog *!/

integer hWnd, mesg, wParam, lParam, itemp
 
integer                 nVscrollPos, nHscrollPos
integer                 nVscrollInc, nHscrollInc
type(T_RECT)            rect1
type(T_PAINTSTRUCT)     ps
integer*4               hDC, ret
save                    nVscrollPos, nHscrollPos
character*512           temp
logical*4               bret



  select case ( mesg )
      case (WM_CREATE)
         i = SetScrollRange( hWnd, SB_HORZ, 0, HSCROLLMAX, .FALSE. )
         i =  SetScrollRange( hWnd, SB_VERT, 0, VSCROLLMAX, .FALSE. )
         bFileOpen = FALSE
         bFileJustOpen = FALSE
         hDC = GetDC( hWnd )
         i =  SetGraphicsMode( hDC, GM_ADVANCED )
         i =  ReleaseDC( hWnd, hDC )
         MainWndProc = 0
         return

      case (WM_HSCROLL)
         select case ( wParam )
            case (SB_LINEUP)
               nHscrollInc = -LINEINC
            case (SB_LINEDOWN)
               nHscrollInc = LINEINC
            case (SB_PAGEUP)
               nHscrollInc = -PAGEINC
            case (SB_PAGEDOWN)
               nHscrollInc = PAGEINC
            case (SB_THUMBPOSITION)
               nHscrollInc = HIWORD(wParam) - nHscrollPos
            case DEFAULT
               nHscrollInc = 0
         end select

         nHscrollInc = max(-nHscrollPos,min(nHscrollInc,HSCROLLMAX - nHscrollPos))
         if (nHscrollInc .ne. 0 ) then
            nHscrollPos = nHscrollPos + nHscrollInc
            i =  SetScrollPos( hWnd, SB_HORZ, nHscrollPos, .TRUE. )
            xForm1%eDx = xForm1%eDx +  (nHscrollInc * HORZSCALE)
            i =  InvalidateRect( hWnd, NULL_RECT, .TRUE. )
         end if
         MainWndProc = 0
         return

      case (WM_VSCROLL)
         select case ( wParam )
            case (SB_TOP)
               nVscrollInc = -nVscrollPos
            case (SB_BOTTOM)
               nVscrollInc = VSCROLLMAX - nVscrollPos
            case (SB_LINEUP)
               nVscrollInc = -LINEINC
            case (SB_LINEDOWN)
               nVscrollInc = LINEINC
            case (SB_PAGEUP)
               nVscrollInc = -PAGEINC
            case (SB_PAGEDOWN)
               nVscrollInc = PAGEINC
            case (SB_THUMBTRACK)
               nVscrollInc = HIWORD(wParam) - nVscrollPos
            case DEFAULT
               nVscrollInc = 0
         end select

         nVscrollInc = max(-nVscrollPos,min(nVscrollInc,VSCROLLMAX - nVscrollPos))
         if(nVscrollInc .ne. 0) then
            nVscrollPos = nVscrollPos + nVscrollInc
            i =  SetScrollPos( hWnd, SB_VERT, nVscrollPos, .TRUE.)

            xForm1%eDy = xForm1%eDy + (nVscrollInc * VERTSCALE)
            i  =  InvalidateRect( hWnd, NULL_RECT, .TRUE.)
         end if
         MainWndProc = 0
         return

      case (WM_KEYDOWN)
         select case ( wParam )
            iCommand = wParam
            case (VK_UP)
               i =  SendMessage( hWnd, WM_VSCROLL, SB_LINEUP, 0 )
            case (VK_DOWN)
               i =  SendMessage( hWnd, WM_VSCROLL, SB_LINEDOWN, 0 )
            case (VK_LEFT)
               i = SendMessage( hWnd, WM_HSCROLL, SB_LINEUP, 0 )
            case (VK_RIGHT)
               i = SendMessage( hWnd, WM_HSCROLL, SB_LINEDOWN, 0 )
            case (VK_PRIOR)
               i = SendMessage( hWnd, WM_VSCROLL, SB_PAGEUP, 0 )
            case (VK_NEXT)
               i = SendMessage( hWnd, WM_VSCROLL, SB_PAGEDOWN, 0 )
         end select
         MainWndProc = 0
         return

      case (WM_PAINT)
         hDC = BeginPaint( hWnd, ps )

         if( bFileOpen .ne. 0) then
             bret = GetClientRect( hWnd, rect1 )
             bret = SetWorldTransform( hDC, xForm1)
             bret = PlayEnhMetaFile( hDC, hEMF, rect1)
         endif
        
         i = EndPaint( hWnd, ps )
         
         MainWndProc = 0
         return

      case (WM_COMMAND)
         select case (INT4( LOWORD(wParam ) ))
            case (IDM_OPEN)
               iTemp = hWnd
               if( OpenMetafl (int(iTemp)) .ne. 0) then
                  i = convertFtoCString (temp, OFName%lpstrFile)
                  i = SetWindowText(hWnd, temp)
                  call SetUnityXform
                  nHscrollPos = HSCROLLMAX/2
                  nVscrollPos = VSCROLLMAX/2
                  i = SetScrollPos( hWnd, SB_HORZ, nHscrollPos,.TRUE.) 
                  i = SetScrollPos( hWnd, SB_VERT, nVscrollPos,.TRUE.) 
                  i = InvalidateRect( hWnd, NULL_RECT, .TRUE. )
               end if
               MainWndProc = 0
               return
            case (IDM_EXIT)
               i = SendMessage( hWnd, WM_CLOSE, 0, 0 )
               MainWndProc = 0
               return
            case (IDM_SCALE)
               if( DialogBoxParam( ghInstance, LOC("ScaleDlg"C), hWnd, LOC(ScaleDlgProc ), 0) .ne. 0) then
                  i = InvalidateRect( hWnd, NULL_RECT, .TRUE.)
               end if
               MainWndProc = 0
               return
            case (IDM_ABOUT)
               ret = DialogBoxParam(ghInstance,LOC("AboutDlg"C),hWnd, LOC(AboutDlgProc), 0)
               MainWndProc = 0
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
   MainWndProc = 0
   return
end 

