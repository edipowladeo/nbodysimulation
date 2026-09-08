!******************************************************************************\
!*       This is a part of the Microsoft Source Code Samples. 
!*       Copyright (C) 1993 Microsoft Corporation.
!*       All rights reserved. 
!*       This source code is only intended as a supplement to 
!*       Microsoft Development Tools and/or WinHelp documentation.
!*       See these sources for detailed information regarding the 
!*       Microsoft samples programs.
!******************************************************************************/

!**************************************************************************\
!*  wxform.f90 -- sample program demonstrating the new "World Transform."
!*
!*  design:  There are a few global handles or pointers in this application,
!*   and different routines to operate on them.  The obvious case of this
!*   is the three window handles and their associated window procedures.
!*   There is also a unique pointer to a track object and a routine to
!*   operate on it (i.e. doTrackObject).  All communication is accomplished
!*   by sending messages between these procedures.  Each window procedure,
!*   and the track object procedure, operate on some set of messages which
!*   use (null)
!*   "WM_USER" messages (c.f. wxform.h).
!**************************************************************************/


!**************************************************************************\
!*
!*  function:  WinMain()
!*
!*  input parameters:  c.f. generic sample
!*
!**************************************************************************/
integer*4 function  WinMain (hInstance,hPrevInstance,lpCmdLine, nCmdShow) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WinMain@16' :: WinMain
use msfwina
use wxfrminc

integer*4   hInstance
integer*4   hPrevInstance
integer(4)  lpCmdLine 
integer*4 nCmdShow


interface 
integer(4)  function MainWndProc (HWND, UINT, WPARAM, LPARAM) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MainWndProc@16' :: MainWndProc
integer*4 HWND   
integer*4 UINT   
integer*4 WPARAM 
integer*4 LPARAM 
end function

integer(4) function TransformDlgProc(HWND, UINT, WPARAM, LPARAM) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_TransformDlgProc@16' :: TransformDlgProc
integer*4 HWND   
integer*4 UINT   
integer*4 WPARAM 
integer*4 LPARAM 
end function

integer(4) function MouseDlgProc    (HWND, UINT, WPARAM, LPARAM) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MouseDlgProc@16' :: MouseDlgProc
integer*4 HWND   
integer*4 UINT   
integer*4 WPARAM 
integer*4 LPARAM 
end function

subroutine doTrackObject(x, y, z, w) 
!MS$ ATTRIBUTES REFERENCE :: x
use wxfrminc
type(TrackObject)    x
integer  y 
integer  z
integer  w
end subroutine
end interface

type (T_MSG)        mesg 
integer*4         hicon 
type (T_WNDCLASS)   wc 
logical           bret
character*100     lpszClassName, lpszIconName


lpcmdline = lpcmdline

    ! Check for previous instance.  If none, then register class. 
lpszClassName = "wxform"C
lpszIconName = "TransformIcon"C
if (hPrevInstance == 0) then
   wc%style = 0 
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
      WinMain = 0
      return 
   end if
end if  ! class registered o.k. 


! Create the main window.  Return false if CreateWindow() fails 
hInst = hInstance 

hwndMain = CreateWindowEx(0,                                      &
   lpszClassName,                                                 &
   "World Transform Demonstration"C,                              &    
   IOR(INT4(WS_OVERLAPPEDWINDOW) ,WS_CLIPCHILDREN),               &
   CW_USEDEFAULT,                                                 &
   CW_USEDEFAULT,                                                 &
   CW_USEDEFAULT,                                                 &
   CW_USEDEFAULT,                                                 &
   NULL,                                                          &
   NULL,                                                          &
   hInstance,                                                     &
   NULL) 

if (hwndMain == 0) then
   WinMain = 0
   return 
end if
bret = ShowWindow(hwndMain, nCmdShow) 
bret = UpdateWindow(hwndMain) 


! create a new track object and paint it for the first time. 
call doTrackObject(ptoRect, TROB_NEW, hwndMain, 0) 
call doTrackObject(ptoRect, TROB_PAINT, hwndMain, 0) 

!*
!* load and display dialog for the world transform matrix.
!*  then fill its entry fields.  Also, get the HICON from the
!*  main window and fill it into the dialog's class structure
!*  for this application.
!*
hwndTransform = CreateDialogParam(hInst, LOC("TransformDlg"C),    &
                            hwndMain, LOC(TransformDlgProc), 0) 
hicon = GetClassLong (hwndMain, GCL_HICON) 
i = SetClassLong (hwndTransform, GCL_HICON, hicon) 
showTransform = TRUE 
i = SendMessage (hwndTransform, WM_PUTUPFLOATS, 0,                &
 LOC(ptoRect%xfmChange)) 

!*
!* load and display the dialog for the mouse position.
!*  minimize it initially.
!*
hwndMouse = CreateDialogParam(hInst, LOC("MouseDlg"C),            &
                        hwndMain, LOC(MouseDlgProc), 0) 
bret = ShowWindow (hwndMouse, SW_SHOWMINIMIZED) 
showMouse = FALSE 

!*
!* load and display the dialog with the direct manipulation help.
!*  minimize it initially.   (Don't need a unique window procedure.)
!*
hwndHelp = CreateDialogParam(hInst, LOC("helpDlg"C), hwndMain,    &
 NULL, 0) 
bret = ShowWindow (hwndHelp, SW_SHOWMINIMIZED) 

    ! Loop getting messages and dispatching them. 
do while (GetMessage(mesg, NULL, 0,0)) 
if (IsDialogMessage (hwndTransform, mesg) .EQV. .FALSE.) then
   if (IsDialogMessage (hwndMouse, mesg) .EQV. .FALSE.) then
      if (IsDialogMessage (hwndHelp, mesg) .EQV. .FALSE.) then
         bret = TranslateMessage(mesg) 
         i = DispatchMessage(mesg)
      end if
   end if
end if
end do
WinMain = mesg%wParam
return 
end 

!**************************************************************************\
!*
!*  function:  MainWndProc()
!*
!*  input parameters:  normal window procedure parameters.
!*
!*  global variables:
!*   hwndTransform,
!*   hwndMouse - information dialog box window handles.
!*   showTransform,
!*   showMouse - Booleans recording the retore/minimize state of the dialogs.
!*   ptoRect   - pointer to track object in middle of screen.
!*
!***************************************************************************/
integer*4 function MainWndProc(hwnd, message, wParam, lParam)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MainWndProc@16' :: MainWndProc
use wxfrminc
integer*4 hwnd, message, wParam, lParam

interface
recursive subroutine doTrackObject(pto, mesg, hwnd, lParam)
!MS$ ATTRIBUTES REFERENCE :: pto
use wxfrminc
type (TrackObject) pto
integer*4 mesg
integer*4 hwnd
integer*4 lParam
end subroutine doTrackObject

subroutine CenterOrigin (hwnd, hdc)
!MS$ATTRIBUTES VALUE :: hwnd
!MS$ATTRIBUTES VALUE :: hdc
integer(4)  hwnd, hdc
end subroutine CenterOrigin 
end interface


type (T_PAINTSTRUCT)  ps 
integer*4 hdc 
type (T_RECT)   rect1 
type (T_POINT)  point1 
integer*4 i 
logical(4)  bret
integer*4 hPenGrid
save hPenGrid

select case (message) 

!*********************************************************************\
!*  WM_CREATE
!*
!* create a pen for later use.
!*********************************************************************/
    case (WM_CREATE)
        hPenGrid  = CreatePen (PS_SOLID, 1, GRIDCOLOR) 


    !*********************************************************************\
    !*  WM_DESTROY
    !*
    !* Complement of WM_CREATE.  send the track object the delete messages,
    !*  then call PostQuitMessage.
    !*********************************************************************/
    case (WM_DESTROY)
        bret = DeleteObject(hPenGrid) 
        call doTrackObject(ptoRect, TROB_DELETE, hwnd, lParam) 
        call PostQuitMessage(0) 

    !*********************************************************************\
    !*  WM_SIZE
    !*
    !* Invalidate the whole window because we reset the origin on paint
    !*  messages according to the size.  Also, send the track object a
    !*  message so that it will also change its HDC's viewport origin.
    !*********************************************************************/
    case (WM_SIZE)
        bret = InvalidateRect (hwnd, NULL_RECT, .TRUE.) 
        call doTrackObject (ptoRect, TROB_CENTER, hwnd, lParam) 

    !*********************************************************************\
    !*  WM_PAINT
    !*
    !* First invalidate the whole window (forces the object to be painted
    !*  fresh, and thus it won't XOR its old self out).  Then draw the
    !*  grid and finally draw the object.
    !*********************************************************************/
    case (WM_PAINT)

        bret = InvalidateRect (hwnd, NULL_RECT, .TRUE.) 

        hdc = BeginPaint(hwnd, ps)

        call CenterOrigin (hwnd, hdc) 
        bret = GetClientRect (hwnd, rect1)
        i = GetViewportOrgEx(hdc, point1)
        i = OffsetRect(rect1, -point1%x, -point1%y ) 


        ! Draw vertical lines.  Draw three at the origin. 
        i = SelectObject(hdc, hPenGrid) 
        do i = 0, rect1%right, TICKSPACE
          bret = MoveToEx (hdc, i, rect1%top, NULL_POINT) 
          bret = LineTo (hdc, i, rect1%bottom) 
          bret = MoveToEx (hdc, -i, rect1%top, NULL_POINT) 
          bret = LineTo (hdc, -i, rect1%bottom) 
        end do
        bret = MoveToEx (hdc, -1, rect1%top, NULL_POINT) 
        bret = LineTo (hdc, -1, rect1%bottom) 
        bret = MoveToEx (hdc, 1, rect1%top, NULL_POINT) 
        bret = LineTo (hdc, 1, rect1%bottom) 


        ! Draw horizontal lines.  Draw three at the origin. */
        do i = 0, rect1%bottom, TICKSPACE
          bret = MoveToEx (hdc, rect1%left, i, NULL_POINT) 
          bret = LineTo (hdc, rect1%right, i) 
          bret = MoveToEx (hdc, rect1%left, -i, NULL_POINT) 
          bret = LineTo (hdc, rect1%right, -i) 
        end do
        bret = MoveToEx (hdc, rect1%left, -1, NULL_POINT) 
        bret = LineTo (hdc, rect1%right, -1) 
        bret = MoveToEx (hdc, rect1%left, 1, NULL_POINT) 
        bret = LineTo (hdc, rect1%right, 1) 

        i = hwnd
        j = lParam  
        call doTrackObject(ptoRect, TROB_PAINT, hwnd, lParam) 

        bret = EndPaint (hwnd, ps) 


    !*********************************************************************\
    !*  WM_LBUTTONDOWN & WM_RBUTTONDOWN
    !* On button down messages, hittest on the track object, and if
    !*  it returns true, then send these messages to the track object.
    !**********************************************************************/
    case (WM_RBUTTONDOWN)
        call doTrackObject(ptoRect, TROB_HITTEST, hwnd, lParam)
        if (glob_hittest == 1) then
           call doTrackObject(ptoRect, message, hwnd, lParam) 
        end if

    case (WM_LBUTTONDOWN)
        call doTrackObject(ptoRect, TROB_HITTEST, hwnd, lParam)
        if (glob_hittest == 1) then
           call doTrackObject(ptoRect, message, hwnd, lParam) 
        end if



    !*********************************************************************\
    !*  WM_LBUTTONUP & WM_RBUTTONDOWN & MW_MOUSEMOVE
    !* If the track object is in a "tracking mode" then send it these messages.
    !*  If the transform dialog is not minimized, fill it with numbers.
    !*  If the mouse dialog is not minimized, fill it with numbers.
    !**********************************************************************/
    case (WM_RBUTTONUP)
        if (ptoRect%Mode .NE. 0) then
          call doTrackObject(ptoRect, message, hwnd, lParam) 
          if (showTransform .NE. 0) then
            i = SendMessage (hwndTransform, WM_PUTUPFLOATS, 0,            &
                          LOC(ptoRect%xfmChange)) 
          end if
        end if

        if (showMouse .NE. 0) then
          i = SendMessage (hwndMouse, WM_PUTUPFLOATS, hwnd, lParam) 
        end if

    case (WM_LBUTTONUP)
        if (ptoRect%Mode .NE. 0) then
          call doTrackObject(ptoRect, message, hwnd, lParam) 
          if (showTransform .NE. 0) then
            i = SendMessage (hwndTransform, WM_PUTUPFLOATS, 0,            &
                          LOC(ptoRect%xfmChange)) 
          end if
        end if

        if (showMouse .NE. 0) then
          i = SendMessage (hwndMouse, WM_PUTUPFLOATS, hwnd, lParam) 
        end if

    case (WM_MOUSEMOVE)
        if (ptoRect%Mode .NE. 0) then
          call doTrackObject(ptoRect, message, hwnd, lParam) 
          if (showTransform .NE. 0) then
            i = SendMessage (hwndTransform, WM_PUTUPFLOATS, 0,            &
                          LOC(ptoRect%xfmChange)) 
          end if
        end if

        if (showMouse .NE. 0) then
          i = SendMessage (hwndMouse, WM_PUTUPFLOATS, hwnd, lParam) 
        end if

    case DEFAULT

        MainWndProc = DefWindowProc(hwnd, message, wParam, lParam)
        return

end select 
MainWndProc = 0
return 
end 







