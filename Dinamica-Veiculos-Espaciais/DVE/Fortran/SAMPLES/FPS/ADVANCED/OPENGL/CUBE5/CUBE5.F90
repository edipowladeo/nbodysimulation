!******************************************************************************
!*       This is a part of the Microsoft Source Code Samples. 
!*       Copyright (C) 1993 Microsoft Corporation.
!*       All rights reserved. 
!*       This source code is only intended as a supplement to 
!*       Microsoft Development Tools and/or WinHelp documentation.
!*       See these sources for detailed information regarding the 
!*       Microsoft samples programs.
!******************************************************************************

!
!CUBE5 uses a display list to draw an array of cubes
!

!
!function WinMain
!
    

integer(4) function WinMain (hInstance, hPrevInstance, lpszCmdLine, nCmdShow)
!MS$    ATTRIBUTES STDCALL, ALIAS : '_WinMain@16' :: WinMain
use msfwin
use opengl
use cubeinc
interface
integer(4) function WndProc (hwnd, mesg, wParam, lParam)
!MS$  ATTRIBUTES STDCALL, ALIAS : '_WndProc@16' :: WndProc
integer(4)  hwnd, mesg, wParam, lParam
end function WndProc
end interface

integer(4)  hInstance, hPrevInstance, lpszCmdLine, nCmdShow

   type(T_WNDCLASS)  wc
   type(T_MSG)       mesg
   integer(4)        hwnd
   logical(4)        bret   

   hPrevInstance = hPrevInstance
   lpszcmdline = lpszcmdline

 
   wc%style = IOR (CS_HREDRAW , CS_VREDRAW)
   wc%lpfnWndProc = LOC(WndProc)
   wc%cbClsExtra = 0
   wc%cbWndExtra = 0
   wc%hInstance = hInstance
   wc%hIcon = LoadIcon(NULL, IDI_APPLICATION)
   wc%hCursor = LoadCursor(NULL, IDC_ARROW)
   wc%hbrBackground = (COLOR_WINDOW + 1)
   wc%lpszMenuName = NULL
   wc%lpszClassName = LOC("Cube5"C  )

   i = RegisterClass(wc)

   hwnd = CreateWindow("Cube5"C,"Cube5"C  ,          &        
                       IOR(INT4(WS_OVERLAPPEDWINDOW) ,          &
                       IOR(WS_CLIPCHILDREN , WS_CLIPSIBLINGS)), &
                       CW_USEDEFAULT, CW_USEDEFAULT,            &
                       CW_USEDEFAULT, CW_USEDEFAULT,            &
                       HWND_DESKTOP, NULL, hInstance, NULL)
   bret = ShowWindow(hwnd, nCmdShow)
   bret = UpdateWindow(hwnd)

   do while (GetMessage(mesg, NULL, 0, 0)) 
      bret = TranslateMessage(mesg)
      i = DispatchMessage(mesg)
   end do
   WinMain = mesg%wParam
   return
end 

!/*
! * WndProc processes messages to the main window
! */

integer(4) function WndProc (hwnd, mesg, wParam, lParam)
!MS$  ATTRIBUTES STDCALL, ALIAS : '_WndProc@16' :: WndProc
use msfwin
use opengl
use cubeinc

integer(4)  hwnd, mesg, wParam, lParam

interface
subroutine SetDCPixelFormat (hdc)
!MS$  ATTRIBUTES VALUE :: hdc
integer(4)  hdc
end subroutine SetDCPixelFormat

subroutine DrawScene (hdc, nAngle)
!MS$  ATTRIBUTES VALUE :: hdc
!MS$  ATTRIBUTES VALUE :: nAngle
integer(4)  hdc, nAngle
end subroutine DrawScene 

end interface
external    InitializeRC
external    CreateDisplayList
    integer(4)  hdc
   integer(4)  hrc
   save  hdc, hrc
   type(T_PAINTSTRUCT)    ps

   real(8)  gldAspect
   integer(4)  glnWidth, glnHeight
   integer(4)  nAngle
   integer(4)  nTimer
   integer(4)   n
   logical(4)   bret
   save  nAngle, nTimer

   data  nAngle /0/
   select case (mesg) 
    case (WM_CREATE)
        !//
        !// Create a rendering context and set a timer.
        !// 
           hdc = GetDC(hwnd)
           call SetDCPixelFormat(hdc)
           hrc = fwglCreateContext(hdc)
           bret = fwglMakeCurrent(hdc, hrc)
           call InitializeRC()
           call CreateDisplayList()
           nTimer = SetTimer (hwnd, 1, 50, 0, 0)
           WndProc = 0
         return

       case (WM_SIZE)
           !//
           !//  Redefine the viewing volume and the viewport when the 
           !//  window size changes.
           !//
           glnWidth = IAND(lParam, #FFFF)  ! LOWORD(lParam)
           glnHeight = IAND(ISHL(lParam, -16), #FFFF)  !HIWORD(lParam)
           gldAspect = DBLE(DBLE(glnWidth) / DBLE(glnHeight))

           call fglMatrixMode(GL_PROJECTION)
           call fglLoadIdentity()
           call fgluPerspective(DBLE(30.0),      &     !// Field of view angle
                       gldAspect,    &     !// Aspect ratio of viewing volume
                       DBLE(1.0),            &     !// Distance to near clipping plane
                       DBLE(100.0));               !// Distance to far clipping plane

           call fglViewport(0, 0, glnWidth, glnHeight)
           WndProc = 0
         return

       case (WM_PAINT)
           !//
           !// Draw the scene
           !//
         i = BeginPaint (hwnd, ps)
         call DrawScene (hdc, nAngle)
         bret = EndPaint (hwnd, ps)
         WndProc = 0
         return

       case (WM_TIMER)
           !//
           !// Update the rotation angle and force a repaint.
           !//
           nAngle = nAngle + 2
           if (nAngle >= 90) then
               nAngle = 0
         end if
           bret = InvalidateRect (hwnd, NULL_RECT, .FALSE.)
           WndProc = 0
         return

       case (WM_QUERYNEWPALETTE)
           !//
           !// If the program is using a color palette, realize the palette
           !// and update the client area when the windows receives the 
           !// input focus.
           !//
           if (hPalette .NE. NULL) then
            n = RealizePalette (hdc)    
               if (n) then
                   bret = InvalidateRect (hwnd, NULL_RECT, .FALSE.)
            end if
               WndProc = n
            return
           end if

       case (WM_PALETTECHANGED)
           !//
           !// If the program is using a color palette, realize the palette
           !// and update the colors in the client area when another program
           !// realizes its palette.
           !//
           if ((hPalette .NE. NULL) .AND. (wParam .NE. hwnd)) then
               if (RealizePalette (hdc)) then
                   bret = UpdateColors (hdc)
            end if
               WndProc = 0
           end if
                
    case (WM_DESTROY)
        !//
        !// Cleanup and terminate
        !//
        bret = fwglMakeCurrent(NULL, NULL)
        bret = fwglDeleteContext(hrc)
        i = ReleaseDC(hwnd, hdc)
        call PostQuitMessage(0)
        WndProc = 0
         return

   end select
   WndProc = DefWindowProc(hwnd, mesg, wParam, lParam)
   return
end 






