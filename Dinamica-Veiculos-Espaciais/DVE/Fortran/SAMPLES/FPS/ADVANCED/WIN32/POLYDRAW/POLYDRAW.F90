 
!******************************************************************************
!*       This is a part of the Microsoft Source Code Samples. 
!*       Copyright (C) 1993 Microsoft Corporation.
!*       All rights reserved. 
!*       This source code is only intended as a supplement to 
!*       Microsoft Development Tools and/or WinHelp documentation.
!*       See these sources for detailed information regarding the 
!*       Microsoft samples programs.
!******************************************************************************

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


!/**************************************************************************\
!*
!*  function:  WinMain()
!*
!*  input parameters:  c.f. generic sample
!*
!\**************************************************************************/
integer*4 function WinMain( hInstance, hPrevInstance, lpCmdLine, nCmdShow)
!MS$ATTRIBUTES STDCALL, ALIAS : '_WinMain@16' :: WinMain
use msfwin
use polyinc
integer*4 hInstance, hPrevInstance, lpCmdLine, nCmdShow

interface 
integer(4) function MainWndProc(hwnd, message, wParam, lParam)
!MS$ATTRIBUTES STDCALL, ALIAS : '_MainWndProc@16' :: MainWndProc
integer*4 hwnd 
integer*4 message 
integer*4 wParam 
integer*4 lParam 
end function
end interface

integer*4 hInst
integer*4 hwndMain
type (T_MSG)     mesg
type (T_WNDCLASS)  wc
logical(4)  bret
character*100  lpszClassName, lpszIconName, lpszAppName

lpcmdline = lpcmdline

! Check for previous instance.  If none, then register class. 
lpszIconName ="polydraw"C
lpszClassName ="polydraw"C

if (hPrevInstance == 0) then

   wc%style = IOR(CS_HREDRAW , CS_VREDRAW)
   wc%lpfnWndProc = LOC(MainWndProc)
   wc%cbClsExtra = 0
   wc%cbWndExtra = 0
   wc%hInstance = hInstance
   wc%hIcon = LoadIcon(hInstance, LOC(lpszIconNAme))
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
lpszAppNAme = "Polydraw"C
hwndMain = CreateWindowEx(0,                                      &
      lpszClassName,                                           &
      lpszAppName,                                           &
      IOR(INT4(WS_OVERLAPPEDWINDOW), WS_CLIPCHILDREN), & !#FF0000,      
      CW_USEDEFAULT,                                              &
      CW_USEDEFAULT,                                              &
      CW_USEDEFAULT,                                              &
      CW_USEDEFAULT,                                              &
      NULL,                                                       &
      NULL,                                                       &
      hInstance,                                                  &
      NULL)

if (hwndMain == 0)  then
    WinMain = 0
    return 
end if
i = ShowWindow(hwndMain, nCmdShow)
i = UpdateWindow(hwndMain)


! Loop getting messages and dispatching them. 
do while (GetMessage(mesg,NULL, 0,0))
   bret = TranslateMessage(mesg)
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
!MS$ATTRIBUTES STDCALL, ALIAS : '_MainWndProc@16' :: MainWndProc
use msfwin
use polyinc
integer*4 hwnd
integer*4 message  
integer*4 wParam   
integer*4 lParam   
type (T_PAINTSTRUCT)  ps
type (T_RECT)   rect1

character*100 varname
integer*4 hPenGray,hPenLine,hPenpolydraw
type (T_POINT)  svpoints(MAXPOINTS)
integer*1  svtypes(MAXPOINTS)
integer*4 svNumDown, svIndex 
integer*4 i,hdc,height,x,y

 
type (T_RECT)  rectNear

save      svNumDown, svIndex
save      hPenGray,hPenLine,hPenpolydraw
 


select case (message) 


!**********************************************************************
!*  WM_CREATE
!*
!* Create three pens for drawing with later.
!**********************************************************************

case (WM_CREATE)
      svNumDown = NONE
      svIndex = NONE
      hPenLine     = CreatePen (PS_SOLID, 1, 16#0100000f)
      hPenpolydraw = CreatePen (PS_SOLID, 1, 16#01000005)
      hPenGray     = CreatePen (PS_SOLID, 1, 16#01000007)
 
!**********************************************************************
!*  WM_DESTROY
!*
!* Complement of the WM_CREATE message.  Delete the pens that were
!*  created and then call postquitmessage.
!**********************************************************************
case (WM_DESTROY)
     ret = DeleteObject (hPenLine)
     ret = DeleteObject (hPenpolydraw)
     ret = DeleteObject (hPenGray)

    call PostQuitMessage(0)
 
!**********************************************************************\
!*  WM_LBUTTONDOWN
!*
!* Hittest to see if the user is selecting an existing point.
!*  If not, check for point overflow.
!*  If o.k. then add a new point to the current list.
!**********************************************************************/
 case (WM_LBUTTONDOWN)

!      /* Construct a rectangle around the mouse point. */
    rectNear%left   = LOWORD(lParam) - HITSIZE
    rectNear%right  = LOWORD(lParam) + HITSIZE
    rectNear%top    = HIWORD(lParam) - HITSIZE
    rectNear%bottom = HIWORD(lParam) + HITSIZE

!      /* step through all points so far.  hittest mouse location against
!       *  each one.  If we hit one, set index, capture mouse and exit
!       *  window procedure.
!       */

    do i = 1, svNumDown+1
     if (PtInRect (rectNear, svPoints(i)) .EQV. .TRUE. ) then
            svIndex = i
            ret = SetCapture (hwnd)
                   MainWndProc = 0
            return 
     end if
   end do

!      /* we did not hit an old point, watch for overflow. */
!      if (svNumDown == (MAXPOINTS-1)) {
  if (svNumDown == MAXPOINTS ) then
         ret = MessageBox (hwnd,                                  &
          "Points may be dragged with left mouse button."C,  &
          "No more points allowed"C,                         &
          IOR (MB_OK , MB_ICONSTOP))
             MainWndProc = 0
         return
  end if

!      /* don't have old point, still room for more.  Put down one more. */
if ( GetCapture() .NE.  hwnd) then
  svNumDown = svNumDown + 1
  svPoints(svNumDown).x = LOWORD(lParam)
  svPoints(svNumDown).y = HIWORD(lParam)

!        /* set the type value in the array dependent upon keyboard state. */
  if (IAND (wParam, MK_SHIFT) .NE. 0 ) then
       svTypes (svNumDown) = PT_MOVETO
  else if ( IAND (wParam , MK_CONTROL) .NE. 0 ) then
       svTypes (svNumDown) = PT_BEZIERTO
  else  
       svTypes (svNumDown) = PT_LINETO
      end if
  ret = InvalidateRect (hwnd, NULL_RECT, .TRUE.)

end if

!**********************************************************************\
!*    WM_MOUSEMOVE
!*
!*    If the curve is tracking the mouse, the erase the old curve by drawing
!*    over it with the grey pen.  Redraw the new curves with the proper pens.
!**********************************************************************/
case (WM_MOUSEMOVE)
               
    if (GetCapture() == hwnd) then

       hdc = GetDC (hwnd)
!        MoveToEx (hdc, svPoints[0].x, svPoints[0].y, NULL_POINT);
       ret = MoveToEx (hdc, svPoints(1).x, svPoints(1).y, NULL_POINT)

!        /* Erase the old lines and curves. */
      ret =  SelectObject(hdc, hPenGray)
      ret =  Polyline (hdc, svPoints(1), svNumDown+1)
!        PolyDraw (hdc, &svPoints[1], &svTypes[1], svNumDown);
      ret = PolyDraw (hdc, svPoints(2), LOC(svTypes(2)),     &
                      svNumDown - 1)

!        /* Change the point to match the new mouse position. */
     svPoints(svIndex).x = int4(LOWORD(lParam))
     svPoints(svIndex).y = int4(HIWORD(lParam))

     ret = MoveToEx (hdc, svPoints(1).x, svPoints(1).y, NULL_POINT)
     ret = SelectObject(hdc, hPenLine)
     ret = Polyline (hdc, svPoints(1), svNumDown)
     ret = SelectObject(hdc, hPenpolydraw)
!        PolyDraw (hdc, &svPoints[1], &svTypes[1], svNumDown)
     ret = PolyDraw (hdc, svPoints(2), LOC(svTypes(2)),      &
                      svNumDown- 1)

     ret = ReleaseDC (hwnd, hdc)
   end if

!**********************************************************************\
!*       WM_LBUTTONUP
!*
!* Finished tracking.  Release the mouse capture, and force repaint.
!**********************************************************************/
case (WM_LBUTTONUP)

    if (GetCapture() == hwnd) then
        ret = SetCapture (0)
        ret = InvalidateRect (hwnd, NULL_RECT, .FALSE.)
    endif


!**********************************************************************\
!*     WM_RBUTTONDOWN
!*
!*     Re-Initialize the static variables, and force a repaint
!**********************************************************************/
case (WM_RBUTTONDOWN)
    svNumDown = NONE
    svIndex = NONE
    ret = InvalidateRect (hwnd, NULL_RECT, .TRUE.)


!**********************************************************************
!*  WM_PAINT
!*
!*     Write the instructions at the bottom of the window.  (Note that these
!*     lines may be erased by user MOUSEMOVE actions.)  Draw the polyline
!*     then draw the PolyDraw.
!**********************************************************************
case (WM_PAINT)

    hdc = BeginPaint(hwnd, ps)
    i = SetBkMode (hdc, TRANSPARENT)

   height = GetSystemMetrics (SM_CYCAPTION)
   ret =  GetClientRect (hwnd, rect1)
   x = rect1%left + 10
   y = rect1%bottom - 4*height
   varname = instruction0
   ret = TextOut (hdc, x,y, varname,62)
   y = rect1%bottom - 3*height
   varname = instruction1
   ret = TextOut (hdc, x,y, varname,22)
   y = rect1%bottom - 2*height
   varname = instruction2
   ret = TextOut (hdc, x,y, varname,22)
   y = rect1%bottom - 1*height
   varname = instruction3
   ret = TextOut (hdc, x,y, varname,22)
     



!      /* Move to the first point in the array and then call polydraw */
   ret = MoveToEx (hdc, svPoints(1).x, svPoints(1).y, NULL_POINT)

  ret = SelectObject(hdc, hPenLine)
  ret = Polyline (hdc, svPoints(1), svNumDown)
  ret = SelectObject(hdc, hPenpolydraw)
!      PolyDraw (hdc, &svPoints[1], &svTypes[1], svNumDown);
  ret = PolyDraw (hdc, svPoints(2), LOC(svTypes(2)),         &
                      svNumDown - 1)

    i = EndPaint (hwnd, ps)

MainWndProc = 0
return 

case default
MainWndProc = DefWindowProc(hwnd, message, wParam, lParam)
end select ! end switch */

return 

end

