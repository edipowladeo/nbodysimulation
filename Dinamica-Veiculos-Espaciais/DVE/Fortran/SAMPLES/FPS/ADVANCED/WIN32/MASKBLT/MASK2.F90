!**************************************************************************\
!*
!*  function:  DlgProc()
!*
!*  input parameters:  normal window procedure parameters%
!*
!*  Respond to user button presses by getting new bitmaps or by sending
!*   the main window a WM_MASKBLT message%  Also handle special user messages
!*   for updating the entry fields with the contents of the direct manipulation
!*   objects%
!*
!*  global variables:
!*   hwndMain - the main window%  also the parent of this dialog
!*   ptoDest, ptoSrc, ptoMask - pointers to the direct manipulation objects
!*   hdcDest, hdcSrc, hdcMask - HDCs for the 3 sub regions of the window%
!*   hbmSrc, hbmMask          - bitmap handles for source and mask%
!**************************************************************************/
integer*4 function DlgProc(hwnd, message, wParam, lParam)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DlgProc@16' :: DlgProc
use mskbltin

integer*4 hwnd, message, wParam, lParam
integer*4 GetBitmap [extern]

character*(MAXCHARS)    buffer
integer*4               hbm,rop,irop
type (T_POINT)          p1,p2, origin 
type (TrackObject)      pto 

integer hdc 


   select case (message) 
   
      !**********************************************************************\
      !*  WM_INITDIALOG
      !*
      !* Fill the entry fields with sensible original values%
      !**********************************************************************/
      case (WM_INITDIALOG)
         do i = DID_X , DID_YMASK  
            i1 = SetDlgItemText(hwnd, i, "0"C)
         end do
         ! these are the three bytes from SRCCOPY */
         i = SRCCOPY
         write (buffer, '(I10)') i
         i = SetDlgItemText(hwnd, DID_ROP0  , "00"c)
         i = SetDlgItemText(hwnd, DID_ROP1  , "204"C)
         i = SetDlgItemText(hwnd, DID_ROP2  , "00"C) 
         i = SetDlgItemText(hwnd, DID_ROP3  , "32"C) 

         do i = 1,NROPS  
            i1 = SendDlgItemMessage (hwnd, DID_CB_ROPS, CB_INSERTSTRING,    &
                       -1, LOC(StandardROPs(i).String)) 
         end do
         do i = 1, NPATTERNS  
            i1 = SendDlgItemMessage (hwnd, DID_CB_PATTERN, CB_INSERTSTRING, &
                       -1, LOC(Patterns(i).String)) 
         end do
         DlgProc = TRUE 
         return
      !**********************************************************************\
      !*  WM_PUTUPDESTRECT
      !*
      !* wParam -  HDC with the needed world transform%
      !* lParam -  Pointer to the track object%
      !*
      !* Fill the entry fields for the destination rectangle points%
      !*  Conditionally change <x,y> or <width,height> depending on tracking mode%
      !**********************************************************************/
      case (WM_PUTUPDESTRECT)
         hdc = wParam 
         call CopyMemory(LOC(pto), lParam, 96)
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
            i = SetDlgItemInt(hwnd, DID_X, p1%x, .TRUE.) 
            i = SetDlgItemInt(hwnd, DID_Y, p1%y, .TRUE.) 
         end if

         if (IAND(pto%Mode,TMMOVE) == 0) then
            i = SetDlgItemInt(hwnd, DID_WIDTH,  p2%x, .TRUE.) 
            i = SetDlgItemInt(hwnd, DID_HEIGHT, p2%y, .TRUE.) 
         end if
         DlgProc = FALSE
         return
         !**********************************************************************\
         !*  WM_PUTUPSRCRECT
         !*
         !* wParam -  HDC with the needed world transform%
         !* lParam -  Pointer to the track object%
         !*
         !* Fill the entry fields for the source location point%
         !**********************************************************************/
      case (WM_PUTUPSRCRECT)
         hdc = wParam 
         call CopyMemory(LOC(pto), lParam, 96)
         i = GetViewportOrgEx (hdc, origin) 

         p1%x = pto%rect1%left 
         p1%y = pto%rect1%top 
         i   = LPtoDP (pto%hdc, p1, 1) 

         p1%x =p1%x - origin%x  
         p1%y =p1%y - origin%y 

         i = SetDlgItemInt(hwnd, DID_XSRC, p1%x, .TRUE.) 
         i = SetDlgItemInt(hwnd, DID_YSRC, p1%y, .TRUE.) 

         DlgProc = FALSE
         return
         !**********************************************************************\
         !*  WM_PUTUPMASKPT
         !*
         !* wParam -  HDC with the needed world transform%
         !* lParam -  Pointer to the track object%
         !*
         !* Fill the entry fields for the mask location point%
         !**********************************************************************/
      case (WM_PUTUPMASKPT)
         hdc = wParam 
         call CopyMemory(LOC(pto), lParam, 96)
         i = GetViewportOrgEx (hdc, origin) 

         p1%x = pto%rect1%left 
         p1%y = pto%rect1%top 
         i = LPtoDP (pto%hdc, p1, 1) 
         p1%x =p1%x - origin%x  
         p1%y =p1%y - origin%y 

         i = SetDlgItemInt(hwnd, DID_XMASK, p1%x, .TRUE.) 
         i = SetDlgItemInt(hwnd, DID_YMASK, p1%y, .TRUE.) 

         DlgProc = FALSE
         return

      case (WM_COMMAND)
         select case (INT4(LOWORD(wParam)) )
         !******************************************************************\
         !*  WM_COMMAND, DID_DRAW
         !*
         !* Draw button hit - send main window message to call MaskBlt().
         !******************************************************************/
            case (DID_DRAW)
               i = SendMessage (hwndMain, WM_MASKBLT, 0,0) 
         !**********************************************************************\
         !*  WM_COMMAND, DID_NEWSRC
         !*
         !* Try to get a new source bitmap%  Then
         !*  invalidate two sub windows so that we force a repaint%
         !**********************************************************************/
            case (DID_NEWSRC)
               hbm = GetBitmap (hdcSrc, hInst, .FALSE.)
               if ( hbm .ne. 0) then
                  i = DeleteObject (hbmSrc) 
                  hbmSrc = hbm 
                  i = InvalidateRect (hwndMain, ptoSrc%rectClip, .TRUE.) 
                  i = InvalidateRect (hwndMain, ptoDest%rectClip, .TRUE.) 
               end if

            !**********************************************************************\
            !*  WM_COMMAND, DID_NEWMASK
            !*
            !* Try to get a new mask bitmap.  Then
            !*  invalidate two sub windows so that we force a repaint.
            !**********************************************************************/
            case (DID_NEWMASK)
               hbm = GetBitmap (hdcMask, hInst, .TRUE.)
               if ( hbm .ne. 0) then
                  i = DeleteObject (hbmMask) 
                  hbmMask = hbm 
                  i = InvalidateRect (hwndMain, ptoMask%rectClip, .TRUE.) 
                  i = InvalidateRect (hwndMain, ptoDest%rectClip, .TRUE.) 
               end if
            !******************************************************************\
            !*  WM_COMMAND, DID_CB_ROPS
            !*
            !* A new standard rop entry was selected%  Lookup the value,
            !*  then break it into four parts, convert to hex, and put
            !*  it in the proper entry fields%
            !******************************************************************/
            case (DID_CB_ROPS)
               if (HIWORD (wParam) == CBN_SELCHANGE) then
                  iSel = SendMessage (lParam, CB_GETCURSEL, 0,0) 
                  rop = StandardROPs(iSel+1).Value

                  irop = IAND(rop,#000000ff)
                  write (buffer, 2100) irop
2100              FORMAT (I12)
                  i = SetDlgItemText(hwnd, DID_ROP2, buffer)

                  rop = rop /256 
                  
                  irop = IAND(rop ,#000000ff)
                  write (buffer, 2100) irop
                  i = SetDlgItemText(hwnd, DID_ROP1, buffer)


                  rop = rop /256 

                  irop = IAND(rop ,#000000ff)
                  write (buffer, 2100) irop
                  i = SetDlgItemText(hwnd, DID_ROP0, buffer)

                  i = SendMessage (hwndMain, WM_STRETCHBLT, 0,0) 
               end if

         !******************************************************************\
         !*  WM_COMMAND, DID_CB_PATTERN
         !*
         !* A new pattern brush was selected%  Look up the value, store it
         !*  in a global variable (iPatternBrush), then force a new StretchBlt
         !******************************************************************/
            case (DID_CB_PATTERN)
               if (HIWORD (wParam) == CBN_SELCHANGE) then
                  iSel = SendMessage (lParam, CB_GETCURSEL, 0,0) 
                  iPatternBrush = Patterns(iSel+1).Value 
                  i = SendMessage (hwndMain, WM_MASKBLT, 0,0) 
               end if
         end select
         DlgProc = FALSE  ! end WM_COMMAND */
         return 
     end select ! end switch */
     DlgProc = FALSE  
      return 
end 

!!**************************************************************************\
!*
!*  function:  DrawGrids()
!*
!*  input parameters:
!*   hdc - Device context to draw into%
!*   width, height - size of the rectangle to fill with grids%
!*
!*  global variables:  none%
!*
!**************************************************************************/
subroutine DrawGrids (hdc, width, height)
!MS$ ATTRIBUTES STDCALL, ALIAS :'_DrawGrids@12' :: DrawGrids
use msfwina
use mskbltin
integer*4 hdc, width, height
logical*4 l1


! Draw vertical lines. Double at the axis 
   iwidth = width
   iheight = height
   nullify(NULL_POINT)
   do i = 0,width, TICKSPACE
      l1 = MoveToEx (hdc,i, 0, NULL_POINT)
      l1 = LineTo (INT(hdc), INT(i), INT(height) )
   end do
    l1 = MoveToEx (hdc, 1, 0, NULL_POINT) 
    l1 = LineTo   (hdc, 1, height) 

! Draw horizontal lines. Double at the axis 
   do i = 0, height, TICKSPACE
      l1 = MoveToEx (hdc, 0,i, NULL_POINT) 
      l1 = LineTo (hdc, width,i) 
   end do
   l1 = MoveToEx (hdc, 0, 1, NULL_POINT) 
   l1 = LineTo (hdc, width,1) 

   return 
end 
