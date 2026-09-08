!**************************************************************************\
!*  plgblt.f90 -- sample program demonstrating the new PlgBlt() API.
!*
!*  design:  There is one main window with one dialog box stretched to fill
!*   the top of it.  The parameters for the plgblt painted into the main
!*   window are stored in the entry fields of this dialog box.  The user
!*   may change these values and see the effect on the blt.
!**************************************************************************/

use msfwina
use trackin
include 'plgblt.fi'
include 'bitmap.fi'
end

!**************************************************************************\
!*
!*  function:  WinMain()
!*
!*  input parameters:  c.f. generic sample
!*
!**************************************************************************/
integer*4 function WinMain(hInstance, hPrevInstance,lpCmdLine,nCmdShow)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WinMain@16' :: WinMain
use msfwina
use trackin
use plgbltin
include 'plgblt.fi'

integer*4 hInstance
integer*4 hPrevInstance
integer*4 lpCmdLine
integer*4 nCmdShow

type (T_MSG)        mesg 
type (T_RECT)       rect1 
integer*4         haccel 
type (T_WNDCLASS)   wc 
character*100     lpszClassName, lpszMenuName, lpszIconName


    LPCMDLINE = LPCMDLINE

!     Check for previous instance.  If none, then register class. 
   lpszClassName ="plgblt"C
   lpszMenuName ="plgbltMenu"C
   lpszIconName = "plgbltIcon"C
   if (hPrevInstance == 0) then
      wc%style = 0 
      wc%lpfnWndProc = LOC(MainWndProc) 
      wc%cbClsExtra = 0 
      wc%cbWndExtra = 0 
      wc%hInstance = hInstance 
      wc%hIcon = LoadIcon(hInstance, LOC(lpszIconName)) 
      wc%hCursor = LoadCursor(NULL, IDC_ARROW) 
      wc%hbrBackground = GetStockObject(LTGRAY_BRUSH)
      wc%lpszMenuName =  LOC(lpszMenuName) 
      wc%lpszClassName = LOC(lpszClassName) 
      if (RegisterClass(wc) == 0) then
         WinMain = FALSE
         return 
      end if
   end if  ! class registered o.k. 
! Create the main window.  Return false if CreateWindow() fails 
   hInst = hInstance 
   hwndMain = CreateWindowEx(0,                                      &
      lpszClassName,                                            &
      lpszClassName,                                            &
      IOR(INT(WS_OVERLAPPEDWINDOW),INT(WS_CLIPCHILDREN)),            &
      CW_USEDEFAULT,                                                 &
      CW_USEDEFAULT,                                                 &
      CW_USEDEFAULT,                                                 &
      CW_USEDEFAULT,                                                 &
      NULL,                                                          &
      NULL,                                                          &
      hInstance,                                                     &
      NULL) 
   if (hwndMain == 0) then
      WinMain = FALSE
      return 
   end if
   !  create the top dialog as a child of the main window. */
   hwndDlg = CreateDialogParam (hInst, LOC("plgbltDlg"C), hwndMain, LOC(DlgProc), 0) 

   !* Send main window a WM_SIZE message so that it will size the top
   !*  dialog correctly.
   !*
   i = GetClientRect (hwndMain, rect1) 
   i = SendMessage (hwndMain, WM_SIZE, 0, (rect1%right - rect1%left)) 
   i = ShowWindow (hwndDlg, SW_SHOW) 
   i = ShowWindow(hwndMain, nCmdShow) 
   ! get global handle to the menu 
   ! Load the accelerator table that provides clipboard support. */
   haccel = LoadAccelerators (hInst, LOC("bltAccel"C))

   do while (GetMessage(mesg,NULL, 0,0) .neqv. .FALSE.) 
      if (TranslateAccelerator(hwndMain, haccel, mesg) == 0) then
         if (IsDialogMessage (hwndDlg, mesg) .neqv. .TRUE.) then
            i = DispatchMessage(mesg)
         end if
      end if

   ! if no messages, and we are spinning, then post spin message. */
      if ((PeekMessage (mesg, hwndMain, 0,0, PM_NOREMOVE) .eqv. .FALSE.) .and. (nSpin .ne. 0)) then
         i = PostMessage (hwndMain, WM_SPIN, 0,0) 
      end if
   end do

!* Return the value from PostQuitMessage 
   WinMain = mesg%wParam 
   return 
end

!**************************************************************************\
!*
!*  function:  MainWndProc()
!*
!*  input parameters:  normal window procedure parameters.
!*
!*  There are 6 different HDCs used for the main window (in addition to the
!*   temporary one returned from BeginPaint).  There are two for each of the
!*   three thirds of the window.  The first one contains the bitmap.  The
!*   second one is for the track object and is stored in the TRACKOBJECT
!*   structure.
!*
!*  global variables:
!*   hwndDlg - dialog with entry fields containing parameters.
!*   ptoDest, ptoSrc, ptoMask - pointers to the direct manipulation objects
!*   hdcDest, hdcSrc, hdcMask - HDCs for the 3 sub regions of the window.
!*   hbmSrc, hbmMask          - bitmap handles for source and mask.
!**************************************************************************/
integer*4 function MainWndProc(hwnd, message, wParam, lParam)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MainWndProc@16' :: MainWndProc
use msfwina
use trackin
use plgbltin

interface 
integer function About    (HWND, UINT, WPARAM, LPARAM)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_About@16' :: About
integer*4 HWND , UINT , WPARAM ,  LPARAM 
end function
end interface

interface
recursive subroutine doTrackObject(pto, mesg, hwnd, lParam)
!MS$ ATTRIBUTES REFERENCE :: pto
use trackin
type (TrackObject)  pto
integer*4 mesg
integer*4 hwnd
integer*4 lParam
end subroutine doTrackObject
end interface

integer*4            hwnd, message, wParam, lParam
integer*4            miniWidth 
type (T_RECT)        rect1 
integer*4            hPenGrid, hPenSeparator 
integer*4            hMenu, hrgn, hdc 
type (T_PAINTSTRUCT) ps 
type (T_POINT)       lpPoint(3) 
integer              XSrc, YSrc, nWidth, nHeight, XMask, YMask 
integer*4            sccess 
type (T_RECT)        cliprect 
integer*4            hbmCompat, hbmOld 
integer*4            hdcCompat 
integer*4            X(4),Y(4) 
integer*4            Xmin, Ymin, Xmax, Ymax 
integer*4            hbm 
type (T_BITMAP)      bm 
type (T_XFORM)       x1 
real                 M11, M12, M21, M22 
integer*4            nSteps 
type (T_POINT)       pivot 
type (T_POINT)       lpRgnErase(4), lpRgnBmp(4) 
logical*4            l1
integer*4            hrgnErase, hrgnBmp 
save                 miniWidth, rect1, hPenGrid, hPenSeparator 

   select case (message) 

      !**********************************************************************\
      !*  WM_CREATE
      !*
      !* Get three new HDCs, then create three new track objects.
      !*  Each track object has different allowed tracking modes.
      !*  Finally create two pens for drawing later on.
      !**********************************************************************/
      case (WM_CREATE)
         hdcSrc  = GetDC (hwnd) 
         hdcDest = GetDC (hwnd) 
         hdcMask = GetDC (hwnd) 
         call doTrackObject (ptoDest, TROB_NEW, hwnd,0) 
         ptoDest%allowedModes = TMALL 
         call doTrackObject (ptoSrc , TROB_NEW, hwnd,0) 
         ptoSrc%allowedModes = IOR(TMMOVE,TMSIZEXY )
         call doTrackObject (ptoMask , TROB_NEW, hwnd,0) 
         ptoMask%allowedModes = TMMOVE 

         hPenGrid      = CreatePen (PS_SOLID, 1, GRIDCOLOR) 
         hPenSeparator = CreatePen (PS_SOLID,2*SEPARATORWIDTH,#01000000) 
         hMenu = GetMenu (hwnd) 

         i = CheckMenuItem(hMenu, IDM_SPINTOPLEFT, MF_CHECKED) 
         i = CheckMenuItem(hMenu, IDM_SPINOFF    , MF_CHECKED) 

         nSpin = FALSE 

      !**********************************************************************\
      !*  WM_DESTROY
      !*
      !* Complement of WM_CREATE.  Free up all of the HDCs, send all of the
      !*  track objects their delete messages, delete the pens,
      !*  then call PostQuitMessage.
      !**********************************************************************/
      case (WM_DESTROY)
         i = ReleaseDC (hwnd, hdcSrc ) 
         i = ReleaseDC (hwnd, hdcDest) 
         i = ReleaseDC (hwnd, hdcMask) 
         call doTrackObject (ptoDest, TROB_DELETE, hwnd,0) 
         call doTrackObject (ptoSrc , TROB_DELETE, hwnd,0) 
         call doTrackObject (ptoMask, TROB_DELETE, hwnd,0) 

         i = DeleteObject(hPenGrid) 
         i = DeleteObject(hPenSeparator) 

         call PostQuitMessage(0) 
      !**********************************************************************\
      !*  WM_SIZE
      !*
      !* Stretch the top dialog to fill the width of the main window.
      !* Adjust the viewport origins of the 6 HDCs.
      !* Set the clip regions of the 6 HDCs.
      !**********************************************************************/
      case (WM_SIZE)
         i = SetWindowPos (hwndDlg, NULL, 0,0, INT4(LOWORD(lParam)) ,DIALOGHEIGHT, 0) 
         i = GetClientRect (hwndMain, rect1) 
         miniWidth = rect1%right/3 

         i = SetViewportOrgEx (hdcDest,0, DIALOGHEIGHT, NULL_POINT) 
         i = SetViewportOrgEx (ptoDest%hdc, 0, DIALOGHEIGHT, NULL_POINT) 
         i = SetViewportOrgEx (hdcSrc, miniWidth,   DIALOGHEIGHT, NULL_POINT) 
         i = SetViewportOrgEx (ptoSrc%hdc, miniWidth,DIALOGHEIGHT,NULL_POINT) 
         i = SetViewportOrgEx (hdcMask, 2*miniWidth, DIALOGHEIGHT, NULL_POINT) 
         i = SetViewportOrgEx (ptoMask%hdc,2*miniWidth,DIALOGHEIGHT,NULL_POINT) 

         ptoDest%rectClip%left    = 0 
         ptoDest%rectClip%top     = DIALOGHEIGHT 
         ptoDest%rectClip%right   = miniWidth-2*SEPARATORWIDTH 
         ptoDest%rectClip%bottom  = rect1%bottom 

         hrgn = CreateRectRgnIndirect (ptoDest%rectClip) 
         i = SelectClipRgn (hdcDest,      hrgn) 
         i = SelectClipRgn (ptoDest%hdc, hrgn) 
         i = DeleteObject (hrgn) 

         ptoSrc%rectClip%left    = miniWidth 
         ptoSrc%rectClip%top     = DIALOGHEIGHT 
         ptoSrc%rectClip%right   = 2*miniWidth-2*SEPARATORWIDTH 
         ptoSrc%rectClip%bottom  = rect1%bottom 
         hrgn = CreateRectRgnIndirect (ptoSrc%rectClip) 
         i = SelectClipRgn (hdcSrc, hrgn) 
         i = SelectClipRgn (ptoSrc%hdc,  hrgn) 
         i = DeleteObject (hrgn) 
         ptoMask%rectClip%left    = 2*miniWidth 
         ptoMask%rectClip%top     = DIALOGHEIGHT 
         ptoMask%rectClip%right   = 3*miniWidth 
         ptoMask%rectClip%bottom  = rect1%bottom 
         hrgn = CreateRectRgnIndirect (ptoMask%rectClip) 
         i = SelectClipRgn (hdcMask,      hrgn) 
         i = SelectClipRgn (ptoMask%hdc, hrgn) 
         i = DeleteObject (hrgn) 
         i = SendMessage (hwndDlg, WM_PUTUPLPOINTS, hdcDest,LOC(ptoDest)) 
         i = SendMessage (hwndDlg, WM_PUTUPSRCRECT, hdcSrc,LOC(ptoSrc)) 
         i = SendMessage (hwndDlg, WM_PUTUPMASKPT,  hdcMask,LOC(ptoMask)) 
         ! repaint the whole window. 
         i = InvalidateRect (hwnd, NULL_RECT,.TRUE.) 
         MainWndProc = FALSE
         return 

     !**********************************************************************\
     !*  WM_PAINT
     !*
     !* miniWidth, rect -- set by WM_SIZE message.
     !*
     !* First shift the viewport origin down so that 0,0 is the top left
     !*  most visible point (out from underneath the top dialog).  Second,
     !*  draw the grid with wider lines on the axes.  Finally, read the
     !*  values out of the top dialog, do elementary validation, and then
     !*  try to call plgblt() with the values.
     !**********************************************************************/
      case (WM_PAINT)
         hdc = BeginPaint(hwnd, ps) 
         ! Draw Separator lines for the three miniareas 
         i = SelectObject(hdc, hPenSeparator) 
         i = MoveToEx (hdc,   miniWidth-SEPARATORWIDTH,0, NULL_POINT) 
         i = LineTo   (hdc,   miniWidth-SEPARATORWIDTH, rect1%bottom) 
         i = MoveToEx (hdc, 2*miniWidth-SEPARATORWIDTH,0, NULL_POINT) 
         i = LineTo   (hdc, 2*miniWidth-SEPARATORWIDTH, rect1%bottom) 

         ! Grid the HDCs 
         i = SelectObject(hdcSrc, hPenGrid) 
         call DrawGrids (hdcSrc, miniWidth, rect1%bottom) 
         i = SelectObject(hdcMask, hPenGrid) 
         call DrawGrids (hdcMask, miniWidth, rect1%bottom) 

         ! Draw bitmaps if any, then draw track objects over them. 
         if (hbmSrc .ne. 0) then
            call DrawBitmap (hdcSrc, hbmSrc) 
         end if
         if (hbmMask .ne. 0) then
            call DrawBitmap (hdcMask, hbmMask) 
         end if
         call doTrackObject (ptoSrc , TROB_PAINT, hwnd, 0) 
         call doTrackObject (ptoMask, TROB_PAINT, hwnd, 0) 

         ! paint the left third of the window. 
         i = SendMessage (hwnd, WM_PLGBLT, 0,0) 
         i = EndPaint (hwnd, ps) 
         MainWndProc = FALSE
         return 
      !**********************************************************************\
      !*  WM_PLGBLT
      !*
      !* WM_USER message.  This paints the left third of the window.  It
      !*  is called on the WM_PAINT message.  It is separated out here because
      !*  it is common for just the plgblt() to need to be called and not the
      !*  whole window painted.
      !**********************************************************************/
      case (WM_PLGBLT)

         call doTrackObject (ptoSrc , TROB_PAINT, hwnd, 0) 
         call doTrackObject (ptoMask, TROB_PAINT, hwnd, 0) 
         
         i  = GetClipBox (hdcDest, cliprect) 
         i = FillRect (hdcDest, cliprect, GetClassLong (hwnd, GCL_HBRBACKGROUND)) 
         
         i = SelectObject(hdcDest, hPenGrid) 
         call DrawGrids (hdcDest, miniWidth, rect1%bottom) 
         
         if (IsWindow(hwndDlg) .eqv. .TRUE.) then
            ! Grab points out of the dialog entry fields. 
            lpPoint(1)%x = GetDlgItemInt(hwndDlg, DID_P1X, LOC(sccess), .TRUE.) 
            lpPoint(1)%y = GetDlgItemInt(hwndDlg, DID_P1Y, LOC(sccess), .TRUE.) 
            lpPoint(2)%x = GetDlgItemInt(hwndDlg, DID_P2X, LOC(sccess), .TRUE.) 
            lpPoint(2)%y = GetDlgItemInt(hwndDlg, DID_P2Y, LOC(sccess), .TRUE.) 
            lpPoint(3)%x = GetDlgItemInt(hwndDlg, DID_P3X, LOC(sccess), .TRUE.) 
            lpPoint(3)%y = GetDlgItemInt(hwndDlg, DID_P3Y, LOC(sccess), .TRUE.) 
         
            XSrc = GetDlgItemInt(hwndDlg, DID_XSRC, LOC(sccess), .TRUE.) 
            YSrc = GetDlgItemInt(hwndDlg, DID_YSRC, LOC(sccess), .TRUE.) 
            nWidth = GetDlgItemInt(hwndDlg, DID_WIDTH, LOC(sccess), .TRUE.) 
            nHeight = GetDlgItemInt(hwndDlg, DID_HEIGHT, LOC(sccess),.TRUE.) 
            XMask = GetDlgItemInt(hwndDlg, DID_XMASK, LOC(sccess), .TRUE.) 
            YMask = GetDlgItemInt(hwndDlg, DID_YMASK, LOC(sccess), .TRUE.) 
            i = PlgBlt (hdcDest,lpPoint(1), hdcSrc, XSrc, YSrc, nWidth, nHeight,&
                  hbmMask, XMask, YMask) 
         end if
         
         call doTrackObject (ptoSrc , TROB_PAINT, hwnd, 0) 
         call doTrackObject (ptoMask, TROB_PAINT, hwnd, 0) 
      !**********************************************************************\
      !*  WM_LBUTTONDOWN & WM_RBUTTONDOWN
      !* On button down messages, hittest on the track object, and if
      !*  it returns true, then send these messages to the track object%
      !**********************************************************************/
      case (WM_RBUTTONDOWN,WM_LBUTTONDOWN)
         call doTrackObject(ptoDest, TROB_HITTEST, hwnd, lParam)
         if (glob_hittest == 1) then
            call doTrackObject(ptoDest, message, hwnd, lParam) 
         else
            call doTrackObject(ptoSrc, TROB_HITTEST, hwnd, lParam)
            if (glob_hittest == 1) then
               call doTrackObject(ptoSrc, message, hwnd, lParam) 
            else
               call doTrackObject(ptoMask, TROB_HITTEST, hwnd, lParam)
               if (glob_hittest == 1) then
                  call doTrackObject(ptoMask, message, hwnd, lParam) 
               end if
            end if
         end if

      !**********************************************************************\
      !*    WM_LBUTTONUP & WM_RBUTTONDOWN & MW_MOUSEMOVE
      !* If the track object is in a "tracking mode" then send it these messages.
      !*  If the transform dialog is not minimized, fill it with numbers.
      !*  If the mouse dialog is not minimized, fill it with numbers.
      !**********************************************************************/
      case (WM_RBUTTONUP,WM_LBUTTONUP)
         ! user action complete.  Force PlgBlt() update. */
         i = PostMessage (hwndMain, WM_PLGBLT, 0,0) 
         if (ptoDest%Mode .ne. 0) then
            call doTrackObject(ptoDest, message, hwnd, lParam) 
            i = SendMessage(hwndDlg,WM_PUTUPLPOINTS,hdcDest,LOC(ptoDest)) 
         end if
         if (ptoSrc%Mode .ne. 0) then
            call doTrackObject(ptoSrc, message, hwnd, lParam) 
            i = SendMessage (hwndDlg, WM_PUTUPSRCRECT, hdcSrc,LOC(ptoSrc)) 
         end if
         if (ptoMask%Mode .ne. 0) then
            call doTrackObject(ptoMask, message, hwnd, lParam) 
            i = SendMessage (hwndDlg, WM_PUTUPMASKPT, hdcMask, LOC(ptoMask)) 
         end if
         !WM_LBUTTONUP

      case (WM_MOUSEMOVE)
         if (ptoDest%Mode .ne. 0) then
            call doTrackObject(ptoDest, message, hwnd, lParam) 
            i = SendMessage(hwndDlg,WM_PUTUPLPOINTS,hdcDest,LOC(ptoDest)) 
         end if
         if (ptoSrc%Mode .ne. 0) then
            call doTrackObject(ptoSrc, message, hwnd, lParam) 
            i = SendMessage (hwndDlg, WM_PUTUPSRCRECT, hdcSrc,LOC(ptoSrc)) 
         end if
         if (ptoMask%Mode .ne. 0) then
            call doTrackObject(ptoMask, message, hwnd, lParam) 
            i = SendMessage (hwndDlg, WM_PUTUPMASKPT, hdcMask, LOC(ptoMask)) 
         end if
      !**********************************************************************\
      !*  WM_SETFOCUS
      !*
      !* The main window should never have the focus.  Set it back
      !*  to the top dialog.
      !**********************************************************************/
      case (WM_SETFOCUS)
         i = SetFocus (hwndDlg) 
         MainWndProc = 0 
         return

      !**********************************************************************\
      !*  Menu item support.
      !*
      !**********************************************************************/
      case (WM_COMMAND)
         select case (INT4(LOWORD(wParam)) )
         !******************************************************************\
         !*  WM_COMMAND, IDM_COPY
         !*
         !* Create a new bitmap, copy the destination HDC bits into it,
         !*  and send the new bitmap to the clipboard.
         !******************************************************************/
            case (IDM_COPY)
               do i = 1, 3 
                  X(i) = GetDlgItemInt(hwndDlg, DID_P1X + 2*i, LOC(sccess), .TRUE.) 
                  Y(i) = GetDlgItemInt(hwndDlg, DID_P1Y + 2*i, LOC(sccess), .TRUE.) 
               end do

               X(4) = (X(2) - X(1)) + X(3) 
               Y(4) = (Y(3) - Y(1)) + Y(2) 
               Xmin = X(1) 
               Xmax = X(1) 
               Ymin = X(1) 
               Ymax = Y(1) 

               do i = 2, 4   
                  if (X(i) < Xmin) then
                     Xmin = X(i) 
                  else
                     Xmin = Xmin 
                  end if
                  if (Y(i) < Ymin) then
                     Ymin = Y(i) 
                  else
                     Ymin = Ymin 
                  end if
                  if (X(i) > Xmax) then
                     Xmax = X(i) 
                  else
                     Xmax = Xmax 
                  end if
                  if (Y(i) > Ymax) then
                     Ymax = Y(i) 
                  else
                     Ymax = Ymax 
                  end if
               end do
               nWidth = Xmax - Xmin 
               nHeight = Ymax - Ymin 
               hdcCompat = CreateCompatibleDC(hdcDest) 
               hbmCompat = CreateCompatibleBitmap (hdcDest, nWidth, nHeight) 
               hbmOld = SelectObject(hdcCompat,hbmCompat) 
               i = BitBlt (hdcCompat, 0,0,nWidth, nHeight, hdcDest, Xmin,Ymin, SRCCOPY ) 
               i = SelectObject(hdcCompat,hbmOld) 
               i  = DeleteDC(hdcCompat) 
               i = OpenClipboard (hwnd) 
               i = SetClipboardData (CF_BITMAP,hbmCompat) 
               i = CloseClipboard () 
               i = DeleteObject (hbmCompat) 
            !*****************************************************************\
            !*  WM_COMMAND, IDM_PASTE
            !*
            !* Get bitmap handle from clipboard, create a new bitmap, draw
            !*  the clipboard bitmap into the new one, and store the new
            !*  handle in the global hbmSrc.
            !******************************************************************/
            case (IDM_PASTE)
               i = OpenClipboard (hwnd) 
               hbm = GetClipboardData (CF_BITMAP)
               if (hbm .ne. 0 ) then
                  i = DeleteObject (hbmSrc) 
                  i = GetObject (hbm, 24, LOC(bm)) 
                  hdcCompat = CreateCompatibleDC(hdcDest) 
                  hbmCompat = CreateCompatibleBitmap (hdcDest, bm%bmWidth,bm%bmHeight) 
                  hbmOld = SelectObject(hdcCompat,hbmCompat) 
                  call DrawBitmap (hdcCompat, hbm) 
                  i = SelectObject(hdcCompat,hbmOld) 
                  i = DeleteDC(hdcCompat) 
                  hbmSrc = hbmCompat 
                  i = InvalidateRect (hwnd, ptoSrc%rectClip, .TRUE.) 
                  i = InvalidateRect (hwnd, ptoDest%rectClip, .TRUE.) 
               end if
               i = CloseClipboard () 
            !******************************************************************\
            !*  WM_COMMAND, IDM_BOTH
            !*
            !* Post a COPY and PASTE command message to this window so that with
            !*  one key stroke the user can copy the DEST image into the clipboard,
            !*  paste it down into the SRC hdc and cause the blt%
            !******************************************************************/
            case (IDM_BOTH)
               i = PostMessage (hwnd, WM_COMMAND, MAKELONG (INT2(IDM_COPY) , INT2(1)), 0) 
               i = PostMessage (hwnd, WM_COMMAND, MAKELONG (INT2(IDM_PASTE), INT2(1)), 0) 
            !******************************************************************\
            !*  WM_COMMAND, IDM_MODE_*
            !*
            !* manage mutually exclusive menu.
            !*  call SetStretchBltMode() for the global destination hdc.
            !******************************************************************/
            case (IDM_MODE_BLACKONWHITE)
               hMenu = GetMenu (hwnd) 
               i  = CheckMenuItem(hMenu, IDM_MODE_BLACKONWHITE, MF_CHECKED) 
               i = CheckMenuItem(hMenu, IDM_MODE_COLORONCOLOR, MF_UNCHECKED) 
               i = CheckMenuItem(hMenu, IDM_MODE_WHITEONBLACK, MF_UNCHECKED) 
               i = CheckMenuItem(hMenu, IDM_MODE_HALFTONE    , MF_UNCHECKED) 
               i = SetStretchBltMode (hdcDest,BLACKONWHITE) 
               i = SendMessage (hwndMain, WM_PLGBLT, 0,0) 
               MainWndProc = 0 
               return 
            case (IDM_MODE_COLORONCOLOR)
               hMenu = GetMenu (hwnd) 
               i = CheckMenuItem(hMenu, IDM_MODE_BLACKONWHITE, MF_UNCHECKED) 
               i  = CheckMenuItem(hMenu, IDM_MODE_COLORONCOLOR, MF_CHECKED) 
               i = CheckMenuItem(hMenu, IDM_MODE_WHITEONBLACK, MF_UNCHECKED) 
               i = CheckMenuItem(hMenu, IDM_MODE_HALFTONE    , MF_UNCHECKED) 
               i = SetStretchBltMode (hdcDest,COLORONCOLOR) 
               i = SendMessage (hwndMain, WM_PLGBLT, 0,0) 
               MainWndProc = 0 
               return 
            case (IDM_MODE_WHITEONBLACK)
               hMenu = GetMenu (hwnd) 
               i  = CheckMenuItem(hMenu, IDM_MODE_BLACKONWHITE, MF_UNCHECKED) 
               i = CheckMenuItem(hMenu, IDM_MODE_COLORONCOLOR, MF_UNCHECKED) 
               i = CheckMenuItem(hMenu, IDM_MODE_WHITEONBLACK, MF_CHECKED) 
               i = CheckMenuItem(hMenu, IDM_MODE_HALFTONE    , MF_UNCHECKED) 
               i = SetStretchBltMode (hdcDest,WHITEONBLACK) 
               i = SendMessage (hwndMain, WM_PLGBLT, 0,0) 
               MainWndProc = 0 
               return 
            case (IDM_MODE_HALFTONE)
               hMenu = GetMenu (hwnd) 
               i = CheckMenuItem(hMenu, IDM_MODE_BLACKONWHITE, MF_UNCHECKED) 
               i = CheckMenuItem(hMenu, IDM_MODE_COLORONCOLOR, MF_UNCHECKED) 
               i = CheckMenuItem(hMenu, IDM_MODE_WHITEONBLACK, MF_UNCHECKED) 
               i = CheckMenuItem(hMenu, IDM_MODE_HALFTONE    , MF_CHECKED) 
               i = SetStretchBltMode (hdcDest,HALFTONE) 
               i = SendMessage (hwndMain, WM_PLGBLT, 0,0) 
               MainWndProc = 0 
               return 
            !******************************************************************\
            !*  WM_COMMAND, IDM_SPIN*
            !*
            !* manage mutually exclusive menu.
            !*
            !******************************************************************/
            case (IDM_SPINOFF)
               hMenu = GetMenu (hwnd) 
               i  = CheckMenuItem(hMenu, IDM_SPINOFF, MF_CHECKED) 
               i = CheckMenuItem(hMenu, IDM_SPIN5  , MF_UNCHECKED) 
               i = CheckMenuItem(hMenu, IDM_SPIN10 , MF_UNCHECKED) 
               i = CheckMenuItem(hMenu, IDM_SPIN30 , MF_UNCHECKED) 
               i = CheckMenuItem(hMenu, IDM_SPIN60 , MF_UNCHECKED) 
               i = CheckMenuItem(hMenu, IDM_SPIN90 , MF_UNCHECKED) 
               nSpin = FALSE 
               i = SendMessage (hwndMain, WM_PLGBLT, 0,0) 
               MainWndProc = 0 
               return 

            case (IDM_SPIN5)
               hMenu = GetMenu (hwnd) 
               i = CheckMenuItem(hMenu, IDM_SPINOFF, MF_UNCHECKED) 
               i = CheckMenuItem(hMenu, IDM_SPIN5  , MF_CHECKED) 
               i = CheckMenuItem(hMenu, IDM_SPIN10 , MF_UNCHECKED) 
               i = CheckMenuItem(hMenu, IDM_SPIN30 , MF_UNCHECKED) 
               i = CheckMenuItem(hMenu, IDM_SPIN60 , MF_UNCHECKED) 
               i = CheckMenuItem(hMenu, IDM_SPIN90 , MF_UNCHECKED) 
               nSpin = 5 
               MainWndProc = 0 
               return 

            case (IDM_SPIN10)
               hMenu = GetMenu (hwnd) 
               i = CheckMenuItem(hMenu, IDM_SPINOFF, MF_UNCHECKED) 
               i = CheckMenuItem(hMenu, IDM_SPIN5  , MF_UNCHECKED) 
               i = CheckMenuItem(hMenu, IDM_SPIN10 , MF_CHECKED) 
               i = CheckMenuItem(hMenu, IDM_SPIN30 , MF_UNCHECKED) 
               i = CheckMenuItem(hMenu, IDM_SPIN60 , MF_UNCHECKED) 
               i = CheckMenuItem(hMenu, IDM_SPIN90 , MF_UNCHECKED) 
               nSpin = 10 
               MainWndProc = 0 
               return 

            case (IDM_SPIN30)
               hMenu = GetMenu (hwnd) 
               i = CheckMenuItem(hMenu, IDM_SPINOFF, MF_UNCHECKED) 
               i = CheckMenuItem(hMenu, IDM_SPIN5  , MF_UNCHECKED) 
               i = CheckMenuItem(hMenu, IDM_SPIN10 , MF_UNCHECKED) 
               i = CheckMenuItem(hMenu, IDM_SPIN30 , MF_CHECKED) 
               i = CheckMenuItem(hMenu, IDM_SPIN60 , MF_UNCHECKED) 
               i = CheckMenuItem(hMenu, IDM_SPIN90 , MF_UNCHECKED) 
               nSpin = 30 
               MainWndProc = 0 
               return 

            case (IDM_SPIN60)
               hMenu = GetMenu (hwnd) 
               i = CheckMenuItem(hMenu, IDM_SPINOFF, MF_UNCHECKED) 
               i = CheckMenuItem(hMenu, IDM_SPIN5  , MF_UNCHECKED) 
               i = CheckMenuItem(hMenu, IDM_SPIN10 , MF_UNCHECKED) 
               i = CheckMenuItem(hMenu, IDM_SPIN30 , MF_UNCHECKED) 
               i = CheckMenuItem(hMenu, IDM_SPIN60 , MF_CHECKED) 
               i = CheckMenuItem(hMenu, IDM_SPIN90 , MF_UNCHECKED) 
               nSpin = 60 
               MainWndProc = 0 
               return 

            case (IDM_SPIN90)
               hMenu = GetMenu (hwnd) 
               i = CheckMenuItem(hMenu, IDM_SPINOFF, MF_UNCHECKED) 
               i = CheckMenuItem(hMenu, IDM_SPIN5  , MF_UNCHECKED) 
               i = CheckMenuItem(hMenu, IDM_SPIN10 , MF_UNCHECKED) 
               i = CheckMenuItem(hMenu, IDM_SPIN30 , MF_UNCHECKED) 
               i = CheckMenuItem(hMenu, IDM_SPIN60 , MF_UNCHECKED) 
               i = CheckMenuItem(hMenu, IDM_SPIN90 , MF_CHECKED) 
               nSpin = 90 
               MainWndProc = 0 
               return 

            case (IDM_FLIPONCE)
               nSpin = 90 
               i = SendMessage (hwndMain, WM_SPIN, 0,0) 
               nSpin = FALSE 
               MainWndProc = 0 
               return 

            case (IDM_SPINTOPLEFT)
               hMenu = GetMenu (hwnd) 
               i = CheckMenuItem(hMenu, IDM_SPINTOPLEFT, MF_CHECKED) 
               i = CheckMenuItem(hMenu, IDM_SPINCENTER , MF_UNCHECKED) 
               MainWndProc = 0 
               return 

            case (IDM_SPINCENTER)
               hMenu = GetMenu (hwnd) 
               i = CheckMenuItem(hMenu, IDM_SPINTOPLEFT, MF_UNCHECKED) 
               i = CheckMenuItem(hMenu, IDM_SPINCENTER , MF_CHECKED) 
               MainWndProc = 0 
               return 
            !******************************************************************\
            !*  WM_COMMAND, DID_NEW*
            !*
            !* menu equivalents for buttons on top dialog.  Just pass along
            !*  WM_COMMAND messages to the dialog.
            !*
            !******************************************************************/
            case (DID_NEWSRC,DID_NEWMASK)
               i = SendMessage (hwndDlg, message, wParam, lParam) 
               MainWndProc = 0 
               return 
            !******************************************************************\
            !*  WM_COMMAND, IDM_ABOUT
            !*
            !******************************************************************/
            case (IDM_ABOUT)
               i  = DialogBoxParam (hInst, LOC("aboutBox"C), hwnd, LOC(About), 0) 
               MainWndProc = 0 
               return 
         end select  ! end switch 
         !******************************************************************\
         !*  WM_SPIN
         !*
         !* Set up a transform to modify the destination points.
         !*  (Note that the transform in hdcDest remains the identity.)
         !*  Loop through, reblitting to the transformed points.
         !*  Erase behind the old bitmap by keeping track of the region uncovered.
         !*
         !******************************************************************/
      case (WM_SPIN)
         ! validate the dialog on top with the parameters in it. */
         if (IsWindow(hwndDlg) .eqv. .FALSE.) then
            MainWndProc = 0
            return
         end   if

         ! Grab points out of the dialog entry fields. 
         lpPoint(1)%x = GetDlgItemInt(hwndDlg, DID_P1X, LOC(sccess), .TRUE.) 
         lpPoint(1)%y = GetDlgItemInt(hwndDlg, DID_P1Y, LOC(sccess), .TRUE.) 
         lpPoint(2)%x = GetDlgItemInt(hwndDlg, DID_P2X, LOC(sccess), .TRUE.) 
         lpPoint(2)%y = GetDlgItemInt(hwndDlg, DID_P2Y, LOC(sccess), .TRUE.) 
         lpPoint(3)%x = GetDlgItemInt(hwndDlg, DID_P3X, LOC(sccess), .TRUE.) 
         lpPoint(3)%y = GetDlgItemInt(hwndDlg, DID_P3Y, LOC(sccess), .TRUE.) 
         XSrc = GetDlgItemInt(hwndDlg, DID_XSRC, LOC(sccess), .TRUE.) 
         YSrc = GetDlgItemInt(hwndDlg, DID_YSRC, LOC(sccess), .TRUE.) 
         nWidth = GetDlgItemInt(hwndDlg, DID_WIDTH, LOC(sccess), .TRUE.) 
         nHeight = GetDlgItemInt(hwndDlg, DID_HEIGHT, LOC(sccess), .TRUE.) 
         XMask = GetDlgItemInt(hwndDlg, DID_XMASK, LOC(sccess), .TRUE.) 
         YMask = GetDlgItemInt(hwndDlg, DID_YMASK, LOC(sccess), .TRUE.) 
      
        ! get an HDC we can use to play with transforms. 
         hdc = GetDC (hwnd) 
         i = SetGraphicsMode (hdc, GM_ADVANCED) 
        
        ! check menu check to pivot on top-left corner, or pivot on center. */
         hMenu = GetMenu (hwnd) 

         if (IAND(GetMenuState(hMenu, IDM_SPINCENTER, MF_BYCOMMAND), MF_CHECKED) .ne. 0) then
            pivot%x = (lpPoint(2)%x +lpPoint(3)%x)/2 
            pivot%y = (lpPoint(2)%y +lpPoint(3)%y)/2 
         else 
            pivot%x = lpPoint(1)%x 
            pivot%y = lpPoint(1)%y 
         end if

      !* nSpin contains values reflecting the number of degrees per step%
      !*  fill in the number of steps required (360 / nSpin), and fill in
      !*  the precomputed transformation matrices.
      !*
         select case (nSpin) 
            case (5)
               nSteps = 72 
               M11 = 0.9961946980917 
               M22 = 0.9961946980917 
               M12 = -0.08715574274766  
               M21 = 0.08715574274766 
            case (10)
               nSteps = 36 
               M11 = 0.984808                   
               M22 = 0.984808 
               M12 = -0.173648  
               M21 = 0.173648 
            case (30)
               nSteps = 12 
               M11 = 0.866025 
               M22 = 0.866025 
               M12 = -0.5       
               M21 = 0.5 
            case (60)
               nSteps = 6 
               M11 = 0.5      
               M22 = 0.5      
               M12 = -0.866025  
               M21 = 0.866025 
            case (90)
               nSteps = 4 
               M11 = 0.0 
               M22 = 0.0 
               M12 = -1.0       
               M21 = 1.0 
            case default
               i = MessageBox (hwnd, "nSpin invalid."C, "Internal app error"C, MB_ICONHAND) 
               MainWndProc = 0
               return
         end select  ! end switch nSpin 

! translate objects from pivot point to origin. 
         x1%eM11 = 1.0 
         x1%eM12 = 0.0 
         x1%eM21 = 0.0 
         x1%eM22 = 1.0 
         x1%eDx = -pivot%x 
         x1%eDy = -pivot%y 
         i = ModifyWorldTransform (hdc, x1, MWT_RIGHTMULTIPLY) 

! rotate object about origin. 
         x1%eM11 = M11 
         x1%eM12 = M12 
         x1%eM21 = M21 
         x1%eM22 = M22 
         x1%eDx = 0.0 
         x1%eDy = 0.0 
         i = ModifyWorldTransform (hdc, x1, MWT_RIGHTMULTIPLY) 

! translate objects back to pivot point. 
         x1%eM11 = 1.0 
         x1%eM12 = 0.0 
         x1%eM21 = 0.0 
         x1%eM22 = 1.0 
         x1%eDx = pivot%x 
         x1%eDy = pivot%y 
         i = ModifyWorldTransform (hdc, x1, MWT_RIGHTMULTIPLY) 

! fill in initial region for erasure... the region containing bmp 
         lpRgnErase(1) = lpPoint(1) 
         lpRgnErase(2) = lpPoint(2) 
         lpRgnErase(4) = lpPoint(3) 
         lpRgnErase(3)%x =  lpPoint(2)%x - lpPoint(1)%x 
         lpRgnErase(3)%x =lpRgnErase(3)%x + lpPoint(3)%x - lpPoint(1)%x 
         lpRgnErase(3)%x =lpRgnErase(3)%x + lpPoint(1)%x 
         lpRgnErase(3)%y =  lpPoint(2)%y - lpPoint(1)%y 
         lpRgnErase(3)%y =lpRgnErase(3)%y + lpPoint(3)%y - lpPoint(1)%y 
         lpRgnErase(3)%y =lpRgnErase(3)%y + lpPoint(1)%y 

        ! loop through transforming the points on each step. 
         do i= 0, nSteps-1
            hrgnErase = CreatePolygonRgn (lpRgnErase(1), 4, ALTERNATE) 
         ! TRANSFORM the lpPoint() destination extent points 
            i1 = LPtoDP (hdc, lpPoint(1), 3) 
         ! create a region containing the new bitmap extents 
            lpRgnBmp(1) = lpPoint(1) 
            lpRgnBmp(2) = lpPoint(2) 
            lpRgnBmp(4) = lpPoint(3) 
            lpRgnBmp(3)%x =  lpPoint(2)%x - lpPoint(1)%x 
            lpRgnBmp(3)%x =lpRgnBmp(3)%x + lpPoint(3)%x - lpPoint(1)%x 
            lpRgnBmp(3)%x =lpRgnBmp(3)%x + lpPoint(1)%x 
            lpRgnBmp(3)%y =  lpPoint(2)%y - lpPoint(1)%y 
            lpRgnBmp(3)%y =lpRgnBmp(3)%y + lpPoint(3)%y - lpPoint(1)%y 
            lpRgnBmp(3)%y =lpRgnBmp(3)%y + lpPoint(1)%y 
            hrgnBmp = CreatePolygonRgn (lpRgnBmp(1), 4, ALTERNATE) 

            ! subtract the new bitmap extents region from the erasure region. 
            i1 = CombineRgn (hrgnErase, hrgnErase, hrgnBmp, RGN_DIFF) 
            ! while we are here, get points ready for the next loop erasure 
            lpRgnErase(1) = lpPoint(1) 
            lpRgnErase(2) = lpPoint(2) 
            lpRgnErase(4) = lpPoint(3) 
            lpRgnErase(3)%x =  lpPoint(2)%x - lpPoint(1)%x 
            lpRgnErase(3)%x =lpRgnErase(3)%x + lpPoint(3)%x - lpPoint(1)%x 
            lpRgnErase(3)%x =lpRgnErase(3)%x + lpPoint(1)%x 
            lpRgnErase(3)%y =  lpPoint(2)%y - lpPoint(1)%y 
            lpRgnErase(3)%y = lpRgnErase(3)%y +lpPoint(3)%y - lpPoint(1)%y 
            lpRgnErase(3)%y = lpRgnErase(3)%y +lpPoint(1)%y 
  !**********************************************************/
            i1 = PlgBlt (hdcDest, lpPoint(1), hdcSrc, XSrc, YSrc, nWidth, nHeight,&
                           hbmMask, XMask, YMask) 
  !**********************************************************/

    ! need to flush graphics buffer, or regions are erased
    !  before the bitmap is drawn.
    !
            i1 = GdiFlush() 
        ! erase the newly uncovered region. */
            l1 = FillRgn (hdcDest, hrgnErase, INT(BACKGROUNDBRUSH )) 
            i1 = DeleteObject (hrgnErase) 
            i1 = DeleteObject (hrgnBmp) 
         end do ! end for loop 
! because of roundoff error, the 'nSteps'th rotation will not
!  always bring the parallelogram around to the 0th position.
!  So we special case the last position, and do one more erase.
!  Try commenting this out, and see the little glitches left
!  on the screen if this comment is unclear.
!
         lpRgnErase(1) = lpPoint(1) 
         lpRgnErase(2) = lpPoint(2) 
         lpRgnErase(4) = lpPoint(3) 
         lpRgnErase(3)%x =  lpPoint(2)%x - lpPoint(1)%x 
         lpRgnErase(3)%x = lpRgnErase(3)%x +lpPoint(3)%x - lpPoint(1)%x 
         lpRgnErase(3)%x = lpRgnErase(3)%x +lpPoint(1)%x 
         lpRgnErase(3)%y =  lpPoint(2)%y - lpPoint(1)%y 
         lpRgnErase(3)%y = lpRgnErase(3)%y +lpPoint(3)%y - lpPoint(1)%y 
         lpRgnErase(3)%y = lpRgnErase(3)%y +lpPoint(1)%y 
         hrgnErase = CreatePolygonRgn (lpRgnErase(1), 4, ALTERNATE) 
         lpPoint(1)%x = GetDlgItemInt(hwndDlg, DID_P1X, LOC(sccess), .TRUE.) 
         lpPoint(1)%y = GetDlgItemInt(hwndDlg, DID_P1Y, LOC(sccess), .TRUE.) 
         lpPoint(2)%x = GetDlgItemInt(hwndDlg, DID_P2X, LOC(sccess), .TRUE.) 
         lpPoint(2)%y = GetDlgItemInt(hwndDlg, DID_P2Y, LOC(sccess), .TRUE.) 
         lpPoint(3)%x = GetDlgItemInt(hwndDlg, DID_P3X, LOC(sccess), .TRUE.) 
         lpPoint(3)%y = GetDlgItemInt(hwndDlg, DID_P3Y, LOC(sccess), .TRUE.) 
         lpRgnBmp(1) = lpPoint(1) 
         lpRgnBmp(2) = lpPoint(2) 
         lpRgnBmp(4) = lpPoint(3) 
         lpRgnBmp(3)%x =  lpPoint(2)%x - lpPoint(1)%x 
         lpRgnBmp(3)%x =lpRgnBmp(3)%x + lpPoint(3)%x - lpPoint(1)%x 
         lpRgnBmp(3)%x = lpRgnBmp(3)%x +lpPoint(1)%x 
         lpRgnBmp(3)%y =  lpPoint(2)%y - lpPoint(1)%y 
         lpRgnBmp(3)%y = lpRgnBmp(3)%y +lpPoint(3)%y - lpPoint(1)%y 
         lpRgnBmp(3)%y = lpRgnBmp(3)%y +lpPoint(1)%y 
         hrgnBmp = CreatePolygonRgn (lpRgnBmp(1), 4, ALTERNATE) 
         i = CombineRgn (hrgnErase, hrgnErase, hrgnBmp, RGN_DIFF) 
         i = FillRgn (hdcDest, hrgnErase, GetStockObject(LTGRAY_BRUSH)) 
         i = DeleteObject (hrgnErase) 
         i = DeleteObject (hrgnBmp) 
         i = ReleaseDC (hwnd, hdc) 
         MainWndProc = 0  ! end WM_SPIN message 
         return 

      case default
         MainWndProc = DefWindowProc(hwnd, message, wParam, lParam)
         return
   end select  ! end switch 

   MainWndProc = 0
   return
end 
