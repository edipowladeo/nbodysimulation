!**************************************************************************\
!*
!*  function:  DlgProc()
!*
!*  input parameters:  normal window procedure parameters.
!*
!*  Respond to user button presses by getting new bitmaps or by sending
!*   the main window a WM_PLGBLT message.  Also handle special user messages
!*   for updating the entry fields with the contents of the direct manipulation
!*   objects.
!*
!*  global variables:
!*   hwndMain - the main window.  also the parent of this dialog
!*   ptoDest, ptoSrc, ptoMask - pointers to the direct manipulation objects
!*   hdcDest, hdcSrc, hdcMask - HDCs for the 3 sub regions of the window.
!*   hbmSrc, hbmMask          - bitmap handles for source and mask.
!**************************************************************************/
integer*4 function DlgProc(hwnd, message, wParam, lParam)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DlgProc@16' :: DlgProc
use msfwina
use trackin
use plgbltin
include 'bitmap.fi'

integer*4         hwnd, message, wParam, lParam
type (T_POINT)      p, origin, p1,p2 
type (TrackObject)  pto 
integer*4         hdc 
integer*4         hbm 


   select case (message) 
!**********************************************************************\
!*  WM_INITDIALOG
!*
!* Fill the entry fields with sensible original values.
!**********************************************************************/
      case  (WM_INITDIALOG)
         i = SetDlgItemText(hwnd, DID_P1X     , "0"C) 
         i = SetDlgItemText(hwnd, DID_P1Y     , "0"C) 
         i = SetDlgItemText(hwnd, DID_P2X     , "0"C) 
         i = SetDlgItemText(hwnd, DID_P2Y     , "0"C) 
         i = SetDlgItemText(hwnd, DID_P3X     , "0"C) 
         i = SetDlgItemText(hwnd, DID_P3Y     , "0"C) 
         i = SetDlgItemText(hwnd, DID_XSRC    , "0"C) 
         i = SetDlgItemText(hwnd, DID_YSRC    , "0"C) 
         i = SetDlgItemText(hwnd, DID_WIDTH   , "0"C) 
         i = SetDlgItemText(hwnd, DID_HEIGHT  , "0"C) 
         i = SetDlgItemText(hwnd, DID_XMASK   , "0"C) 
         i = SetDlgItemText(hwnd, DID_YMASK   , "0"C) 
         DlgProc = TRUE 
         return 
!**********************************************************************\
!*  WM_PUTUPLPOINTS
!*
!* wParam -  HDC with the needed world transform.
!* lParam -  Pointer to the track object.
!*
!* Fill the entry fields for the array of 3 dest parallelogram points.
!*  Conditionally change the first point depending on tracking mode.
!**********************************************************************/
      case (WM_PUTUPLPOINTS)
         hdc = wParam 
         call copymemory(LOC(pto), lParam, 96)
         i = GetViewportOrgEx (hdc, origin)
         if (IAND(pto%Mode,TMMOVE) .ne. 0) then
            p%x = pto%rect1%left 
            p%y = pto%rect1%top 
            i  = LPtoDP (pto%hdc, p, 1) 
            p%x =p%x - origin%x  
            p%y =p%y - origin%y 
            i = SetDlgItemInt(hwnd, DID_P1X, p%x, .TRUE.) 
            i = SetDlgItemInt(hwnd, DID_P1Y, p%y, .TRUE.) 
         end if
         p%x = pto%rect1%right 
         p%y = pto%rect1%top 
         i = LPtoDP (pto%hdc, p, 1) 
         p%x =p%x - origin%x  
         p%y =p%y - origin%y 
         i   = SetDlgItemInt(hwnd, DID_P2X, p%x, .TRUE.) 
         i = SetDlgItemInt(hwnd, DID_P2Y, p%y, .TRUE.) 
         p%x = pto%rect1%left 
         p%y = pto%rect1%bottom 
         i = LPtoDP (pto%hdc, p, 1) 
         p%x =p%x - origin%x  
         p%y =p%y - origin%y 
         i = SetDlgItemInt(hwnd, DID_P3X, p%x, .TRUE.) 
         i = SetDlgItemInt(hwnd, DID_P3Y, p%y, .TRUE.) 
         DlgProc = FALSE 
         return 
!**********************************************************************\
!*  WM_PUTUPSRCRECT
!*
!* wParam -  HDC with the needed world transform.
!* lParam -  Pointer to the track object.
!*
!* Fill the entry fields for the source rectangle points.
!*  Conditionally change <x,y> or <width,height> depending on tracking mode.
!**********************************************************************/
      case (WM_PUTUPSRCRECT)
         hdc = wParam 
         call copymemory(LOC(pto), lParam, 96)
         i = GetViewportOrgEx (hdc, origin) 
         p1%x = pto%rect1%left 
         p1%y = pto%rect1%top 
         i = LPtoDP (pto%hdc, p1, 1) 
         p2%x = pto%rect1%right 
         p2%y = pto%rect1%bottom 
         i = LPtoDP (pto%hdc, p2, 1) 
         p2%x =p2%x - p1%x  
         p2%y =p2%y - p1%y 
         p1%x =p1%x - origin%x  
         p1%y =p1%y - origin%y 
         if (IAND(pto%Mode,TMSIZEXY) == 0) then
            i = SetDlgItemInt(hwnd, DID_XSRC, p1%x, .TRUE.) 
            i = SetDlgItemInt(hwnd, DID_YSRC, p1%y, .TRUE.) 
         end if
         if (IAND(pto%Mode,TMMOVE) == 0) then
            i = SetDlgItemInt(hwnd, DID_WIDTH,  p2%x, .TRUE.) 
            i = SetDlgItemInt(hwnd, DID_HEIGHT, p2%y, .TRUE.) 
         end if
         DlgProc = FALSE 
         return 

!**********************************************************************\
!*  WM_PUTUPMASKPT
!*
!* wParam -  HDC with the needed world transform.
!* lParam -  Pointer to the track object.
!*
!* Fill the entry fields for the mask location point.
!**********************************************************************/
      case (WM_PUTUPMASKPT)
         hdc = wParam 
         call copymemory(LOC(pto), lParam, 96)
         i = GetViewportOrgEx (hdc, origin) 
         p1%x = pto%rect1%left 
         p1%y = pto%rect1%top 
         i = LPtoDP (pto%hdc, p1, 1) 
         p1%x = p1%x - origin%x  
         p1%y = p1%y - origin%y 
         i = SetDlgItemInt(hwnd, DID_XMASK, p1%x, .TRUE.) 
         i = SetDlgItemInt(hwnd, DID_YMASK, p1%y, .TRUE.) 
         DlgProc = FALSE 
         return 
!**********************************************************************\
!*  WM_COMMAND, DID_DRAW
!*
!* Draw button hit - send main window message to call PlgBlt().
!**********************************************************************/
      case (WM_COMMAND)
         if (LOWORD(wParam) == DID_DRAW) then
            i = SendMessage (hwndMain, WM_PLGBLT, 0,0) 


!**********************************************************************\
!*  WM_COMMAND, DID_NEWSRC
!*
!* Try to get a new source bitmap.  Then
!*  invalidate two sub windows so that we force a repaint.
!**********************************************************************/
         else 
            if (LOWORD(wParam) == DID_NEWSRC) then
               hbm = GetBitmap (hdcSrc, hInst, .FALSE.)
               if (hbm .ne. 0 ) then
                  i = DeleteObject (hbmSrc) 
                  hbmSrc = hbm 
                  i = InvalidateRect (hwndMain, ptoSrc%rectClip, .TRUE.) 
                  i = InvalidateRect (hwndMain, ptoDest%rectClip, .TRUE.)
               end if 

!**********************************************************************\
!*  WM_COMMAND, DID_Mask
!*
!* Try to get a new mask bitmap.  Then
!*  invalidate two sub windows so that we force a repaint.
!**********************************************************************/
            else 
               if (LOWORD(wParam) == DID_NEWMASK) then
                  hbm = GetBitmap (hdcMask,  hInst, .TRUE.)
                  if (hbm .ne. 0) then
                     i = DeleteObject (hbmMask) 
                     hbmMask = hbm 
                     i = InvalidateRect (hwndMain, ptoMask%rectClip, .TRUE.) 
                     i = InvalidateRect (hwndMain, ptoDest%rectClip, .TRUE.) 
                  end if
               end if
            end if
         end if
         DlgProc = FALSE  ! end WM_COMMAND 
         return
   end select  ! end switch 
   DlgProc = 0 
   return
end
