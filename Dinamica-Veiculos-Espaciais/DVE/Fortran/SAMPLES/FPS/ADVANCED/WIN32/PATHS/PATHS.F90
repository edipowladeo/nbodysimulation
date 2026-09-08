           
!******************************************************************************
!*       This is a part of the Microsoft Source Code Samples. 
!*       Copyright (C) 1993 Microsoft Corporation.
!*       All rights reserved. 
!*       This source code is only intended as a supplement to 
!*       Microsoft Development Tools and/or WinHelp documentation.
!*       See these sources for detailed information regarding the 
!*       Microsoft samples programs.
!******************************************************************************

!**************************************************************************
!*  paths.f90 -- sample program demonstrating paths.
!**************************************************************************

!/**************************************************************************\
!*
!*  function:  WinMain()
!*
!*  input parameters:  c.f. generic sample
!*
!\**************************************************************************/
integer*4 function WinMain( hInstance, hPrevInstance, lpCmdLine, nCmdShow)
!MS$ ATTRIBUTES STDCALL , ALIAS : '_WinMain@16' :: WinMain
use msfwina
use pathsinc

interface 
integer*4 function MainWndProc(hwnd, message, wParam, lParam)
!MS$ attributes STDCALL, ALIAS : '_MainWndProc@16' :: MainWndProc
integer*4       hwnd 
integer*4       message 
integer*4       wParam 
integer*4       lParam 
end function MainWndProc
end interface

integer*4      hInstance
integer*4      hPrevInstance
integer*4      lpCmdLine
integer*4      nCmdShow

integer*4      hInst
integer*4      hwndMain
type (T_MSG)     mesg
character*100  lpszClassName, lpszIconName
type (T_WNDCLASS)  wc

lpcmdline = lpcmdline

lpszClassName ="paths"C
lpszIconName = "pathsIcon"C
! Check for previous instance.  If none, then register class. 
if (hPrevInstance == 0) then

   wc%style = IOR(CS_HREDRAW , CS_VREDRAW)
   wc%lpfnWndProc = LOC(MainWndProc)
   wc%cbClsExtra = 0
   wc%cbWndExtra = 0
   wc%hInstance = hInstance
   wc%hIcon = LoadIcon(hInstance, LOC(lpszIconName))
   wc%hCursor = LoadCursor(NULL, IDC_ARROW)
   wc%hbrBackground = GetStockObject(LTGRAY_BRUSH)
   wc%lpszMenuName =  NULL
   wc%lpszClassName = LOC(lpszClassName)

   if (RegisterClass(wc) == 0) then
      WinMain = FALSE
      return 
   end if
end if  !/* class registered o.k. */


!/* Create the main window.  Return false if CreateWindow() fails */
hInst = hInstance

hwndMain = CreateWindowEx(0,&
           lpszClassName,&
           lpszClassName,&
           IOR(INT(WS_OVERLAPPEDWINDOW), INT(WS_CLIPCHILDREN)),&
           10,&
           10,&
           300,&
           300,&
           NULL,&
           NULL,&
           hInstance,&
           NULL)

if (hwndMain == 0)  then
    WinMain = .FALSE.
    return 
end if
i = ShowWindow(hwndMain, nCmdShow)
i = UpdateWindow(hwndMain)


! Loop getting messages and dispatching them. 
do while (GetMessage(mesg,NULL, 0,0) .neqv. .FALSE.)
   i = TranslateMessage(mesg)
   i = DispatchMessage(mesg)
end do

WinMain = mesg%wParam
end



!**************************************************************************
!*
!*  function:  MainWndProc()
!*
!*  input parameters:  normal window procedure parameters.
!*
!*  This is a very simple window.  On create it creates pens to draw with.
!*   They are later destroyed at destroy time.  The only interesting code
!*   is in the paint message.  We draw 6 different paths into the client
!*   area demonstrating various features of paths.
!*
!*  global variables: none.
!***************************************************************************
integer*4 function MainWndProc( hwnd, message, wParam, lParam)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MainWndProc@16' :: MainWndProc
use msfwina
use pathsinc

interface 
subroutine DrawPath(hdc, prect)
use msfwinty
integer*4   hdc 
type (T_RECT)     pRect
end subroutine DrawPath
end interface

integer*4 hwnd
integer*4 message  
integer*4 wParam   
integer*4 lParam   

integer hdc
type (T_PAINTSTRUCT)  ps
type (T_RECT)   rect1
integer*4 hrgn
integer*4 i
integer*4 hPenFill, hPenPath
character*100 varname
save hPenFill, hPenPath


select case (message) 


!**********************************************************************
!*  WM_CREATE
!*
!* Create three pens for drawing with later.
!**********************************************************************

case (WM_CREATE)
    hPenPath   = CreatePen (PS_SOLID, 2, 16#01000005)
    hPenFill   = CreatePen (PS_SOLID, 1, 16#01000002)

!**********************************************************************
!*  WM_DESTROY
!*
!* Complement of the WM_CREATE message.  Delete the pens that were
!*  created and then call postquitmessage.
!**********************************************************************
case (WM_DESTROY)
    i = DeleteObject (hPenFill)
    i = DeleteObject (hPenPath)
    call PostQuitMessage(0)

!**********************************************************************
!*  WM_PAINT
!*
!* Query the client rectangle.  Divide it into six sub rectangles
!*  (only actually compute the top left sixth).  Now, set the origin
!*  for each one of these, write text describing the operation, and
!*  then stroke or fill or whatever the path.
!**********************************************************************
case (WM_PAINT)

    hdc = BeginPaint(hwnd, ps)
    i = SetBkMode (hdc, TRANSPARENT)

    i = GetClientRect (hwnd, rect1)
    rect1%bottom = rect1%bottom / 2
    rect1%right = rect1%right / 3
    i = SelectObject(hdc, hPenPath)

! 1. Just stroke the path 
    i = SetViewportOrgEx (hdc, 0, 0, NULL_POINT)
    varname = STROKEPATHLAB
    i = TextOut (hdc, 2, 10, varname, 10 - 1)
    call DrawPath(hdc, rect1)
    i = StrokePath (hdc)


! 2. Fill the path
    i = SetViewportOrgEx (hdc, 0, rect1%bottom, NULL_POINT)
    varname = FILLPATHLAB
    i = TextOut (hdc, 2, 10, varname, 8-1)
    call DrawPath(hdc, rect1)
    i = FillPath (hdc)

!/* 3. Stroke and fill the path 
    i = SetViewportOrgEx (hdc,rect1%right, 0, NULL_POINT)
    i = SetPolyFillMode (hdc, WINDING)
    varname = STROKEANDFILLWINDLAB
    i = TextOut (hdc, 2, 10, varname, 22-1)
    call DrawPath(hdc, rect1)
    i = StrokeAndFillPath (hdc)

!/* 4. Stroke and fill it again, but with different mode. 
    i = SetViewportOrgEx (hdc,rect1%right, rect1%bottom, NULL_POINT)
    i = SetPolyFillMode (hdc, ALTERNATE)
    varname = STROKEANDFILLALTLAB
    i = TextOut (hdc, 2, 10, varname, 24-1)
    call DrawPath(hdc, rect1)
    i = StrokeAndFillPath (hdc)


!/* 5. Set the clipping region based on the path.
    i = SetViewportOrgEx (hdc,rect1%right*2, 0, NULL_POINT)
    i = SetPolyFillMode (hdc, WINDING)
    varname = CLIPPATHWINDLAB
    i = TextOut (hdc, 2, 10, varname, 17-1)
    i = SelectObject(hdc, hPenFill)
    call DrawPath(hdc, rect1)
    hrgn = PathToRegion(hdc)
    i = SelectClipRgn (hdc, hrgn)
    i = DeleteObject (hrgn)
    i = MoveToEx (hdc, rect1%right/2, rect1%bottom/2, NULL_POINT)

    do i = 0, rect1%right -1, 5
         i1 = AngleArc (hdc, rect1%right/2, rect1%bottom/2, i,0.0, 360.0)
    end do

!/* 6. Set the clipping region based on the path, with different mode.

    i = SetViewportOrgEx (hdc,rect1%right*2, rect1%bottom, NULL_POINT)
    i = SetPolyFillMode (hdc, ALTERNATE)
!/* clear the clip region so that TextOut() shows up.
    i = ExtSelectClipRgn (hdc, NULL, RGN_COPY)
    varname = CLIPPATHALTLAB
    i = TextOut (hdc, 2, 10, varname, 19-1)
    call DrawPath(hdc, rect1)
    hrgn = PathToRegion(hdc)
    i = SelectClipRgn (hdc, hrgn)
    i = DeleteObject (hrgn)
    i = MoveToEx (hdc, rect1%right/2, rect1%bottom/2, NULL_POINT)

    do i = 0, rect1%right - 1, 5
       i1 = AngleArc (hdc, rect1%right/2, rect1%bottom/2, i, 0.0,360.0)
    end do
    
    i = EndPaint (hwnd, ps)

MainWndProc = 0
return 

case default
MainWndProc = DefWindowProc(hwnd, message, wParam, lParam)
end select ! end switch */

return 

end



