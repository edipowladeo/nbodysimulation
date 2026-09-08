!*
!*  design:  There is one main window with one dialog box maskblted to fill
!*   the top of it.  The parameters for the MaskBlt() are stored in the
!*   entry fields of this dialog box.  The user may change these values and
!*   see the effect on the blt.  The top dialog also offers a chance to
!*   select from standard raster operations.
!*
!*  other modules:  track.f90  bitmap.f90
!*   (these other 2 modules are the same for all of the XBlt samples,
!*   i.e. STREBLT, PLGBLT, ...)
!*
!**************************************************************************/

use trackin
include 'maskblt.fi'
include 'bitmap.fi'
end

!**************************************************************************\
!*
!*  function:  WinMain()
!*
!*  input parameters:  c.f. generic sample
!*
!**************************************************************************/
integer*4 function WinMain(hInstance, hPrevInstance,lpCmdLine, nCmdShow)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WinMain@16' :: WinMain
use mskbltin

interface 
integer*4 function MainWndProc(HWND, UINT, WPARAM, LPARAM)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MainWndProc@16' :: MainWndProc
integer*4 HWND , UINT , WPARAM ,  LPARAM 
end function
end interface

interface 
integer*4 function DlgProc    (HWND, UINT, WPARAM, LPARAM)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DlgProc@16' :: DlgProc 
integer*4 HWND , UINT , WPARAM , LPARAM 
end function
end interface


integer*4 hInstance
integer*4 hPrevInstance
integer*4 lpCmdLine
integer*4 nCmdShow


type (T_MSG)        mesg 
type (T_RECT)       rect1 
integer*4           haccel 
character*100       lpszClassName, lpszIconName
type (T_WNDCLASS)   wc 


    lpcmdline = lpcmdline
   StandardROPs(1)%Value =  SRCCOPY
   StandardROPs(1)%String= "SRCCOPY"C
   StandardROPs(2)%Value =  SRCPAINT
   StandardROPs(2)%String= "SRCPAINT"C
   StandardROPs(3)%Value =  SRCAND
   StandardROPs(3)%String= "SRCAND"C
   StandardROPs(4)%Value =  SRCINVERT
   StandardROPs(4)%String= "SRCINVERT"C
   StandardROPs(5)%Value =  SRCERASE
   StandardROPs(5)%String= "SRCERASE"C
   StandardROPs(6)%Value =  NOTSRCCOPY
   StandardROPs(6)%String= "NOTSRCCOPY"C
   StandardROPs(7)%Value =  NOTSRCERASE
   StandardROPs(7)%String= "NOTSRCERASE"C
   StandardROPs(8)%Value =  MERGECOPY
   StandardROPs(8)%String= "MERGECOPY"C
   StandardROPs(9)%Value =  MERGEPAINT
   StandardROPs(9)%String= "MERGEPAINT"C
   StandardROPs(10)%Value =  PATCOPY
   StandardROPs(10)%String= "PATCOPY"C
   StandardROPs(11)%Value =  PATPAINT
   StandardROPs(11)%String= "PATPAINT"C
   StandardROPs(12)%Value =  PATINVERT
   StandardROPs(12)%String= "PATINVERT"C
   StandardROPs(13)%Value =  DSTINVERT
   StandardROPs(13)%String= "DSTINVERT"C
   StandardROPs(14)%Value =  BLACKNESS
   StandardROPs(14)%String= "BLACKNESS"C
   StandardROPs(15)%Value =  WHITENESS
   StandardROPs(15)%String= "WHITENESS"C
   StandardROPs(16)%Value =  #ccaa0000
   StandardROPs(16)%String= "Transparent1"C
   StandardROPs(17)%Value =  #aacc0000
   StandardROPs(17)%String= "Transparent2"C

   Patterns(1)%Value =  0
   Patterns(1)%String= "WHITE_BRUSH "C
   Patterns(2)%Value =  1
   Patterns(2)%String= "LTGRAY_BRUSH "C
   Patterns(3)%Value =  2
   Patterns(3)%String= "GRAY_BRUSH "C
   Patterns(4)%Value =  3
   Patterns(4)%String= "DKGRAY_BRUSH "C
   Patterns(5)%Value =  4
   Patterns(5)%String= "BLACK_BRUSH "C
   Patterns(6)%Value =  5
   Patterns(6)%String= "NULL_BRUSH "C


   hbmMask = NULL
   hbmSrc = NULL
   iPatternBrush = NONE
   lpszIconNAme = "MaskBltIcon"C
   lpszClassName = "MaskBlt"C

!* Check for previous instance.  If none, then register class. */
   if (hPrevInstance == 0) then
      wc%style = 0 
      wc%lpfnWndProc = LOC(MainWndProc)
      wc%cbClsExtra = 0 
      wc%cbWndExtra = 0 
      wc%hInstance = hInstance 
      wc%hIcon = LoadIcon(hInstance,LOC(lpszIconName)) 
      wc%hCursor = LoadCursor(NULL, IDC_ARROW) 
      wc%hbrBackground = GetStockObject(LTGRAY_BRUSH) 
      wc%lpszMenuName =  NULL 
      wc%lpszClassName = LOC(lpszClassName) 
      if (RegisterClass(wc) == 0) then
         WinMain = FALSE
         return 
      end if
   end if  ! class registered o.k. 


!* Create the main window.  Return false if CreateWindow() fails */
   hInst = hInstance 
   hwndMain = CreateWindowEx(0,                                         &
                  lpszClassName,                                        &
                  "MaskBlt"C,                                           &
                  IOR(INT(WS_OVERLAPPEDWINDOW),INT(WS_CLIPCHILDREN)),   &
                  CW_USEDEFAULT,                                        &
                  CW_USEDEFAULT,                                        &
                  CW_USEDEFAULT,                                        &
                  CW_USEDEFAULT,                                        &
                  NULL,                                                 &
                  NULL,                                                 &
                  hInstance,                                            &
                  NULL) 

   if (hwndMain == 0) then
      WinMain = FALSE
      return 
   end if


!* create the top dialog as a child of the main window. 
   hwndDlg = CreateDialogParam (hInst, LOC("maskbltDlg"C), hwndMain, &
                  LOC(DlgProc), 0) 

!* Send main window a WM_SIZE message so that it will size the top
!*  dialog correctly.
!*
   i = GetClientRect (hwndMain, rect1) 
   i = SendMessage (hwndMain, WM_SIZE, 0, (rect1%right - rect1%left)) 
   i = ShowWindow (hwndDlg, SW_SHOW) 
   i = ShowWindow(hwndMain, nCmdShow) 


!* Load the accelerator table that provides clipboard support. 
   haccel = LoadAccelerators (hInst, LOC("bltAccel"C)) 
   do while (GetMessage(mesg,NULL, 0,0) .neqv. .FALSE.) 
      if (TranslateAccelerator(hwndMain, haccel, mesg) == 0) then
         if (IsDialogMessage (hwndDlg, mesg) .eqv. .FALSE.) then
            i = DispatchMessage(mesg)
         end if
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
!*   iPatternBrush - Selection from combo box, set into the hdc.
!**************************************************************************/
integer*4 function MainWndProc(hwnd, message, wParam, lParam)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MainWndProc@16' :: MainWndProc
use mskbltin

interface 
recursive subroutine doTrackObject(x, y, z, w)
!MS$ ATTRIBUTES REFERENCE :: x
use trackin
type (TrackObject)  x
integer*4           y 
integer*4           z 
integer*4           w
end subroutine
end interface

interface 
subroutine DrawGrids (hdc, int1, int2)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DrawGrids@12' :: DrawGrids
integer*4 hdc, int1, int2
end subroutine
end interface

interface
subroutine DrawBitmap (HDC, HBITMAP)
integer*4 HDC, HBITMAP
end subroutine
end interface

integer*4 hwnd, message, wParam, lParam

integer*4            miniWidth 
type (T_RECT)        rect1 
integer*4            hPenGrid, hPenSeparator 
integer*4            hrgn, hdc  
type (T_PAINTSTRUCT) ps 
integer*4            X, Y, nWidth, nHeight 
integer*4            XSrc, YSrc, XMask, YMask 
integer*4            rop, ropByte 
character*(MAXCHARS) buffer
integer*4            sccess 
type (T_RECT)        cliprect 
integer*4            hbmCompat, hbmOld, mesg
integer*4            hdcCompat 
integer*4            hbm 
type (T_BITMAP)      bm 

save miniWidth, rect1, hPenGrid, hPenSeparator 

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
         mesg = TROB_NEW

         call doTrackObject (ptoDest, TROB_NEW, hwnd,0) 
         ptoDest%allowedModes = IOR(TMMOVE,TMSIZEXY)
         call doTrackObject (ptoSrc , TROB_NEW, hwnd,0) 
         ptoSrc%allowedModes = TMMOVE 
         call doTrackObject (ptoMask , TROB_NEW, hwnd,0) 
         ptoMask%allowedModes = TMMOVE 

         hPenGrid      = CreatePen (PS_SOLID, 1, GRIDCOLOR) 
         hPenSeparator = CreatePen (PS_SOLID,2*SEPARATORWIDTH,#01000000) 

   !**********************************************************************\
   !*  WM_PAINT
   !*
   !* miniWidth, rect -- set by WM_SIZE message.
   !*
   !* First shift the viewport origin down so that 0,0 is the top left
   !*  most visible point (out from underneath the top dialog).  Second,
   !*  draw the grid with wider lines on the axes.  Finally, read the
   !*  values out of the top dialog, do elementary validation, and then
   !*  try to call MaskBlt() with the values.
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
         i = SendMessage (hwnd, WM_MASKBLT, 0,0) 
         i = EndPaint (hwnd, ps) 
         MainWndProc = FALSE
         return 


      !**********************************************************************\
      !*  WM_DESTROY
      !*
      !* Complement of WM_CREATE.  Free up all of the HDCs, send all of the
      !*  track objects their delete messages, delete the pens,
      !*  then call  PostQuitMessage.
      !**********************************************************************/
      case (WM_DESTROY)
         i = ReleaseDC (hwnd, hdcSrc ) 
         i  = ReleaseDC (hwnd, hdcDest) 
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
         i = SetWindowPos (hwndDlg, NULL, 0,0, INT4(LOWORD(lParam)), DIALOGHEIGHT, 0) 
         
         i = GetClientRect (hwndMain, rect1)
         miniWidth = (rect1%right)/3 

         i = SetViewportOrgEx (hdcDest,0,           DIALOGHEIGHT, NULL_POINT) 
         i = SetViewportOrgEx (ptoDest%hdc, 0,      DIALOGHEIGHT, NULL_POINT) 
         i = SetViewportOrgEx (hdcSrc, miniWidth,   DIALOGHEIGHT, NULL_POINT) 
         i = SetViewportOrgEx (ptoSrc%hdc, miniWidth,DIALOGHEIGHT,NULL_POINT) 
         i = SetViewportOrgEx (hdcMask, 2*miniWidth, DIALOGHEIGHT, NULL_POINT) 
         i = SetViewportOrgEx (ptoMask%hdc,2*miniWidth,DIALOGHEIGHT,NULL_POINT) 

         ptoDest%rectClip%left    = 0 
         ptoDest%rectClip%top     = DIALOGHEIGHT 
         ptoDest%rectClip%right   = miniWidth-2*SEPARATORWIDTH 
         ptoDest%rectClip%bottom  = rect1%bottom 
         hrgn = CreateRectRgnIndirect (ptoDest%rectClip) 
         i  = SelectClipRgn (hdcDest,      hrgn) 
         i = SelectClipRgn (ptoDest%hdc, hrgn) 
         i = DeleteObject (hrgn) 

         ptoSrc%rectClip%left    = miniWidth 
         ptoSrc%rectClip%top     = DIALOGHEIGHT 
         ptoSrc%rectClip%right   = 2*miniWidth-2*SEPARATORWIDTH 
         ptoSrc%rectClip%bottom  = rect1%bottom 
         hrgn = CreateRectRgnIndirect (ptoSrc%rectClip) 
         i = SelectClipRgn (hdcSrc,       hrgn) 
         i = SelectClipRgn (ptoSrc%hdc,  hrgn) 
         i = DeleteObject (hrgn) 

         ptoMask%rectClip%left    = 2*miniWidth 
         ptoMask%rectClip%top     = DIALOGHEIGHT 
         ptoMask%rectClip%right   = 3*miniWidth 
         ptoMask%rectClip%bottom  = rect1%bottom 
         hrgn = CreateRectRgnIndirect (ptoMask%rectClip) 
         i   = SelectClipRgn (hdcMask,      hrgn) 
         i = SelectClipRgn (ptoMask%hdc, hrgn) 
         i = DeleteObject (hrgn) 

         i = SendMessage (hwndDlg, WM_PUTUPDESTRECT,hdcDest,LOC(ptoDest)) 
         i = SendMessage (hwndDlg, WM_PUTUPSRCRECT, hdcSrc,LOC(ptoSrc)) 
         i = SendMessage (hwndDlg, WM_PUTUPMASKPT,  hdcMask,LOC(ptoMask)) 
         ! repaint the whole window. 
         i = InvalidateRect (hwnd, NULL_RECT, .TRUE.) 

!**********************************************************************\
!*  WM_MASKBLT
!*
!* WM_USER message.  This paints the left third of the window.  It
!*  is called on the WM_PAINT message.  It is separated out here because
!*  it is common for just the MaskBlt() to need to be called and not the
!*  whole window painted.
!**********************************************************************/
      case (WM_MASKBLT)

         call doTrackObject (ptoSrc , TROB_PAINT, hwnd, 0) 
         call doTrackObject (ptoMask, TROB_PAINT, hwnd, 0) 

         i = GetClipBox (hdcDest, cliprect) 
         i = FillRect (hdcDest, cliprect, GetClassLong (hwnd, GCL_HBRBACKGROUND)) 
         i = SelectObject(hdcDest, hPenGrid) 

         call DrawGrids (hdcDest, miniWidth, rect1%bottom) 
         if (IsWindow(hwndDlg) .neqv. .FALSE.) then

            ! Grab points out of the dialog entry fields. 
            X =      GetDlgItemInt(hwndDlg, DID_X,     LOC(sccess), .TRUE.) 
            Y =      GetDlgItemInt(hwndDlg, DID_Y,     LOC(sccess), .TRUE.) 
            nWidth = GetDlgItemInt(hwndDlg, DID_WIDTH, LOC(sccess), .TRUE.) 
            nHeight= GetDlgItemInt(hwndDlg, DID_HEIGHT,LOC(sccess), .TRUE.) 
            XSrc =   GetDlgItemInt(hwndDlg, DID_XSRC,  LOC(sccess), .TRUE.) 
            YSrc =   GetDlgItemInt(hwndDlg, DID_YSRC,  LOC(sccess), .TRUE.) 
            XMask =  GetDlgItemInt(hwndDlg, DID_XMASK, LOC(sccess), .TRUE.) 
            YMask =  GetDlgItemInt(hwndDlg, DID_YMASK, LOC(sccess), .TRUE.) 

            ! get high order ROP byte and shift left by two bytes. 
            i = GetDlgItemText(hwndDlg, DID_ROP0, buffer, MAXCHARS) 
            ropByte = chartoint(LOC(buffer))
            rop = ropByte * 256 * 256 * 256 

            ! get the next ROP byte and shift left by one byte. 
            i = GetDlgItemText(hwndDlg, DID_ROP1, buffer, MAXCHARS) 
            ropByte = chartoint(LOC(buffer))
            rop = rop + (ropByte * 256 * 256)

            ! get the next ROP byte and shift left by one byte. 
            i = GetDlgItemText(hwndDlg, DID_ROP2, buffer, MAXCHARS) 
            ropByte = chartoint(LOC(buffer))
            rop = rop + (ropByte * 256)

            ! finally, get the low order ROP byte. 
            i = GetDlgItemText(hwndDlg, DID_ROP3, buffer, MAXCHARS) 
            ropByte = chartoint(LOC(buffer))
            rop =rop + ropByte 

            ! select the pattern brush.  (user selects via combo box.) */
            if (iPatternBrush .ne. NONE) then
               i = SelectObject (hdcDest, GetStockObject (iPatternBrush)) 
            end if
            i = MaskBlt (hdcDest, X, Y, nWidth, nHeight, hdcSrc, XSrc, YSrc, &
                     hbmMask, XMask, YMask, rop) 
         end if
         call doTrackObject (ptoSrc , TROB_PAINT, hwnd, 0) 
         call doTrackObject (ptoMask, TROB_PAINT, hwnd, 0) 
!**********************************************************************\
!*  WM_LBUTTONDOWN & WM_RBUTTONDOWN
!* On button down messages, hittest on the track object, and if
!*  it returns true, then send these messages to the track object.
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
!*  WM_LBUTTONUP & WM_RBUTTONDOWN & MW_MOUSEMOVE
!* If the track object is in a "tracking mode" then send it these messages.
!*  If the transform dialog is not minimized, fill it with numbers.
!*  If the mouse dialog is not minimized, fill it with numbers.
!**********************************************************************/
      case (WM_RBUTTONUP,WM_LBUTTONUP)
        ! user action complete.  Force MaskBlt() update. */
         i = PostMessage (hwndMain, WM_MASKBLT, 0,0) 
         goto 100
      case (WM_MOUSEMOVE)
100      if (ptoDest%Mode .ne. 0) then
            call doTrackObject(ptoDest, message, hwnd, lParam) 
            i = SendMessage(hwndDlg,WM_PUTUPDESTRECT,hdcDest,LOC(ptoDest)) 
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
!*  Accelerator & clipboard support.
!*
!* Certain key strokes (c.f. *.rc) will cause the following WM_COMMAND
!*  messages.  In response the app will copy a bitmap into the clipboard
!*  or paste down from it.  In both cases, it is necessary to create a
!*  new bitmap since a bitmap in the clipboard belongs to the clipboard
!*  and not to the application.
!**********************************************************************/
      case (WM_COMMAND)
         select case (INT4(LOWORD(wParam)) )

!******************************************************************\
!*  WM_COMMAND, AID_COPY
!*
!* Create a new bitmap, copy the destination HDC bits into it,
!*  and send the new bitmap to the clipboard.
!******************************************************************/
            case (AID_COPY)

               X = GetDlgItemInt(hwndDlg, DID_X, LOC(sccess), .TRUE.) 
               Y  = GetDlgItemInt(hwndDlg, DID_Y, LOC(sccess), .TRUE.) 
               nWidth = GetDlgItemInt(hwndDlg, DID_WIDTH, LOC(sccess), .TRUE.) 
               nHeight = GetDlgItemInt(hwndDlg, DID_HEIGHT,LOC(sccess),.TRUE.) 
               hdcCompat = CreateCompatibleDC(hdcDest) 
               hbmCompat = CreateCompatibleBitmap (hdcDest, nWidth, nHeight) 
               hbmOld = SelectObject(hdcCompat,hbmCompat) 
               i = BitBlt (hdcCompat,0,0,nWidth,nHeight,hdcDest,X,Y,SRCCOPY ) 
               i = SelectObject(hdcCompat,hbmOld) 
               i = DeleteDC(hdcCompat) 
               i = OpenClipboard (hwnd) 
               i = SetClipboardData (CF_BITMAP,hbmCompat) 
               i = CloseClipboard () 
               i = DeleteObject (hbmCompat) 
!******************************************************************\
!*  WM_COMMAND, AID_PASTE
!*
!* Get bitmap handle from clipboard, create a new bitmap, draw
!*  the clipboard bitmap into the new one, and store the new
!*  handle in the global hbmSrc.
!******************************************************************/
            case (AID_PASTE)
               i = OpenClipboard (hwnd) 
               hbm = GetClipboardData (CF_BITMAP)
               if (hbm .ne. 0 ) then
                  i = DeleteObject (hbmSrc) 
                  i  = GetObject (hbm, 24, LOC(bm)) 
                  hdcCompat = CreateCompatibleDC(hdcDest) 
                  hbmCompat = CreateCompatibleBitmap (hdcDest, bm%bmWidth,    &
                                                      bm%bmHeight) 
                  hbmOld = SelectObject(hdcCompat,hbmCompat) 
                  call DrawBitmap (hdcCompat, hbm) 
                  i  = SelectObject(hdcCompat,hbmOld) 
                  i = DeleteDC(hdcCompat) 
                  hbmSrc = hbmCompat 
                  i = InvalidateRect (hwnd, ptoSrc%rectClip, .TRUE.) 
                  i = InvalidateRect (hwnd, ptoDest%rectClip, .TRUE.) 
               end if
               i = CloseClipboard () 
!******************************************************************\
!*  WM_COMMAND, AID_CYCLE
!*
!* Post a COPY and PASTE command message to this window so that with
!*  one key stroke the user can copy the DEST image into the clipboard,
!*  paste it down into the SRC hdc and cause the blt.
!******************************************************************/
            case (AID_CYCLE)
               i = PostMessage (hwnd, WM_COMMAND, MAKELONG (INT2(AID_COPY) , INT2(1)), 0) 
               i = PostMessage (hwnd, WM_COMMAND, MAKELONG (INT2(AID_PASTE), INT2(1)), 0) 

            case default
                MainWndProc = DefWindowProc(hwnd, message, wParam, lParam)
                return

         end select ! end switch 
      case default
        MainWndProc = DefWindowProc(hwnd, message, wParam, lParam)
         return
   end select ! end switch 
   MainWndProc = 0
   return
end 


