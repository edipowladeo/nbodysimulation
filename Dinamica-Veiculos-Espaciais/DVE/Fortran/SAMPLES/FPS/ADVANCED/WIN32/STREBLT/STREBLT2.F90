!*************************************************************************\
!*
!*  function:  DlgProc()
!*
!*  input parameters:  normal window procedure parameters.
!*
!*  This is the dialog that sits on top of the window (it is streblted on the
!*   WM_SIZE message of the main window).  In this window procedure, handle
!*   the command messages that arise as the user selects buttons on this
!*   dialog.  Also handle user messages for filling in entry field values.
!*
!*  global variables:
!*   hwndMain - the main window.  also the parent of this dialog
!*   ptoSrc   - pointer to the source track object
!*   hdcSrc   - device context for the right half the window.
!*   ptoDest  - pointer to the destination track object
!*   hdcDest  - device context for the left half the window.
!*   hbmSrc   - bitmap handle for the source bitmap.
!*
!*   strebltMode - Selection from combo box, to be used in SetStretchMode()
!*   iPatternBrush - Selection from combo box, set into the hdc.
!**************************************************************************/

integer*4 function DlgProc(hwnd, message, wParam, lParam)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DlgProc@16' :: DlgProc
use msfwina
use trackin
use strbltin


interface 
integer function MainWndProc(HWND, UINT, WPARAM, LPARAM)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MainWndProc@16' :: MainWndProc
integer*4 HWND , UINT, WPARAM , LPARAM 
end function
end interface

interface 
subroutine DrawGrids (hdc, int1, int2)
integer*4 hdc, int1, int2
end subroutine
end interface

interface 
recursive subroutine doTrackObject(x, y, z, w)
use trackin
type (TrackObject) x
integer*4 y, z, w
end subroutine
end interface

interface 
integer*4 function GetBitmap (hdc, hInst, monochrome)
integer*4 hdc
integer*4 hInst
logical*4 monochrome
end function
end interface


integer*4            hwnd, message, wParam, lParam
character*(MAXCHARS) buffer
type (T_POINT)       p1,p2, origin 
type (TrackObject)   pto 
integer*4            hdc, hbm ,rop
logical(4)           bret   


   select case (message) 
      !*********************************************************************\
      !*  WM_INITDIALOG
      !*
      !* Fill the entry fields with sensible original values.
      !*  Also fill the combo boxes with the text entries from lookup tables.
      !*********************************************************************/
      case (WM_INITDIALOG)
         do  i = DID_X, DID_SRCHEIGHT 
            bret = SetDlgItemText(hwnd, i , "0"C) 
         end do
         i = SRCCOPY

         bret = SetDlgItemText(hwnd, DID_ROP0  , "cc"C)  
         bret = SetDlgItemText(hwnd, DID_ROP1  , "00"C) 
         bret = SetDlgItemText(hwnd, DID_ROP2  , "20"C) 

         do i = 1, NMODES  
            i1 = SendDlgItemMessage (hwnd, DID_CB_MODE, CB_INSERTSTRING,    &
                       -1, LOC(strebltModes(i).String)) 
         end do

         do i = 1, NPATTERNS  
            i1 = SendDlgItemMessage (hwnd, DID_CB_PATTERN, CB_INSERTSTRING, &
                       -1, LOC(Patterns(i).String))
         end do                           

         do i = 1, NROPS  
            i1 = SendDlgItemMessage (hwnd, DID_CB_ROPS, CB_INSERTSTRING,    &
                       -1, LOC(StandardROPs(i).String)) 
         end do

         DlgProc = TRUE 
         return 

      !*********************************************************************\
      !*  WM_PUTUPDESTRECT
      !*
      !* wParam -  HDC with the needed world transform.
      !* lParam -  Pointer to the track object.
      !*
      !* Fill the entry fields for the destination rectangle points.
      !*  Conditionally change <x,y> or <width,height> depending on tracking mode.
      !**********************************************************************/
      case (WM_PUTUPDESTRECT)

         hdc = wParam 
         call copymemory(LOC(pto), lParam, 96)
         i   = GetViewportOrgEx (hdc, origin) 

         p1%x = pto%rect1%left 
         p1%y = pto%rect1%top 
         i = LPtoDP (pto%hdc, p1, 1) 

         p2%x = pto%rect1%right 
         p2%y = pto%rect1%bottom 
         i = LPtoDP (pto%hdc, p2, 1) 
         p2%x =p2%x -   p1%x  
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

      !*********************************************************************\
      !*  WM_PUTUPSRCRECT
      !*
      !* wParam -  HDC with the needed world transform.
      !* lParam -  Pointer to the track object.
      !*
      !* Fill the entry fields for the source rectangle points.
      !*  Conditionally change <x,y> or <width,height> depending on tracking mode.
      !*********************************************************************/
      case (WM_PUTUPSRCRECT)

         hdc = wParam 
         call copymemory(LOC(pto), lParam , 96)
         i  = GetViewportOrgEx (hdc, origin) 

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
            i    = SetDlgItemInt(hwnd, DID_YSRC, p1%y, .TRUE.) 
         end if

         if (IAND(pto%Mode,TMMOVE) == 0) then
            i = SetDlgItemInt(hwnd, DID_SRCWIDTH,  p2%x, .TRUE.) 
            i = SetDlgItemInt(hwnd, DID_SRCHEIGHT, p2%y, .TRUE.) 
         end if
         DlgProc = FALSE
         return 

      case (WM_COMMAND)
         select case (INT4(LOWORD(wParam)) )

            !*****************************************************************\
            !*  WM_COMMAND, DID_DRAW
            !*
            !* Draw button hit - send main window message to call StretchBlt().
            !*****************************************************************/
            case (DID_DRAW)
               i = SendMessage (hwndMain, WM_STRETCHBLT, 0,0) 
            !*****************************************************************\
            !*  WM_COMMAND, DID_NEWSRC
            !*
            !* Try to get a new source bitmap. If successful, store it in the
            !*  global handle (hbmSrc) then invalidate two sub windows so that
            !*  we force a complete repaint in both.
            !*****************************************************************/
            case (DID_NEWSRC)
               hbm = GetBitmap (hdcSrc, hInst, .FALSE.)
               if (hbm .ne. 0 ) then
                  i  = DeleteObject (hbmSrc) 
                  hbmSrc = hbm 
                  i = InvalidateRect (hwndMain, ptoSrc%rectClip, .TRUE.) 
                  i = InvalidateRect (hwndMain, ptoDest%rectClip, .TRUE.) 
               end if
            !*****************************************************************\
            !*  WM_COMMAND, DID_CB_MODE
            !*
            !*    A new streblt mode was selected.  Look up the value, store it
            !*  in a global variable (strebltMode), then force a new StretchBlt
            !*****************************************************************/
            case (DID_CB_MODE)
               if (HIWORD (wParam) == CBN_SELCHANGE) then
                  iSel = SendMessage (lParam, CB_GETCURSEL, 0,0) 
                  strebltMode = strebltModes(iSel+1).Value 
                  i = SendMessage (hwndMain, WM_STRETCHBLT, 0,0) 
               end if
            !*****************************************************************\
            !*  WM_COMMAND, DID_CB_PATTERN
            !*
            !* A  new pattern brush was selected.  Look up the value, store it
            !*  in a global variable (iPatternBrush), then force a new StretchBlt
            !*****************************************************************/
            case (DID_CB_PATTERN)
               if (HIWORD (wParam) == CBN_SELCHANGE) then
                  iSel = SendMessage (lParam, CB_GETCURSEL, 0,0) 
                  iPatternBrush = Patterns(iSel+1).Value 
                  i  = SendMessage (hwndMain, WM_STRETCHBLT, 0,0) 
               end if
            !*****************************************************************\
            !*    WM_COMMAND, DID_CB_ROPS
            !*
            !* A new standard rop entry was selected.  Lookup the value,
            !*  then break it into three parts, convert to hex, and put
            !*  it in the proper entry fields.
            !*****************************************************************/
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
         end select  ! end switch */
         DlgProc = FALSE  ! end WM_COMMAND */
         return 
      end select ! end switch */
      DlgProc = FALSE  
      return 
end 

!**************************************************************************\
!*
!*  function:  DrawGrids()
!*
!*  input parameters:
!*   hdc - Device context to draw into.
!*   width, height - size of the rectangle to fill with grids.
!*
!*  global variables:  none.
!*
!**************************************************************************/
subroutine DrawGrids (hdc, width, height)
use msfwina
use trackin
use strbltin

integer*4 hdc, width, height

! Draw vertical lines. Double at the axis 
   do i = 0  ,width, TICKSPACE
      i1 = MoveToEx (hdc, i, 0, NULL_POINT) 
      i1 = LineTo (hdc, i, height) 
   end do
   i1 = MoveToEx (hdc, 1, 0, NULL_POINT) 
   i1 = LineTo (hdc, 1, height) 

! Draw horizontal lines. Double at the axis 
   do i = 0, height, TICKSPACE
      i1 = MoveToEx (hdc, 0,i, NULL_POINT) 
      i1 = LineTo (hdc, width,i) 
   end do
   i1 = MoveToEx (hdc, 0, 1, NULL_POINT) 
   i1 = LineTo (hdc, width,1) 
   return 
end 
