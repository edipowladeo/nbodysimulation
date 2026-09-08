!/****************************************************************************
! *                                                                          *
! *  FUNCTION   : MenuWndProc (hWnd, message, wParam, lParam)                *
! *                                                                          *
! *  PURPOSE    : Window function for the main app. window. Processes all the*
! *               menu selections and oter messages.                         *
! *                                                                          *
! ****************************************************************************/
integer*4 function MenuWndProc (hwnd, message, wParam, lParam)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MenuWndProc@16' :: MenuWndProc
use msfwin
use menuinc
integer*4       hwnd, message, wParam, lParam

interface 
integer(4) function About ( hDlg, message, wParam, lParam )
!MS$ ATTRIBUTES STDCALL, ALIAS : '_About@16' :: About
integer*4   hDlg 
integer*4   message 
integer*4   wParam 
integer*4   lParam 
end function About
end interface

interface 
integer(4) function HandleDrawItem ( hwnd, lpdis )
!MS$ ATTRIBUTES VALUE :: hwnd
integer*4   hwnd 
integer*4   lpdis
end function HandleDrawItem
end interface

interface 
subroutine HandleChangeColors(hwnd)
!MS$ ATTRIBUTES VALUE :: hwnd
integer*4   hwnd 
end subroutine HandleChangeColors
end interface 

interface 
subroutine HandlePopupMenu (hwnd, pt)
!MS$ ATTRIBUTES VALUE :: hwnd
!MS$ ATTRIBUTES VALUE :: pt
use msfwinty
integer(4)     hwnd
type (T_POINT)   pt  
end subroutine HandlePopupMenu
end interface 

interface 
subroutine HandleCreate(hwnd)
!MS$ ATTRIBUTES VALUE :: hwnd
integer*4   hwnd 
end subroutine HandleCreate
end interface 

integer*4       hMenu
type (T_RECT)    rc
type (T_POINT)   pt
type (T_MEASUREITEMSTRUCT)  mis
integer*4       ret
integer(4)      temp
character*100   lpszDlgName



temp = message

select case (message)

    case (WM_SYSCOMMAND)
        !/* Show the About ... dialog */
        if (wParam == ID_ABOUT) then
            ret = DialogBoxParam (hInst, LOC("AboutBox"C), hWnd, LOC(About), 0)
        else
            MenuWndProc =  DefWindowProc (hWnd, message, wParam, lParam)
            return
        end if
        

    case (WM_CREATE)
      !/* Create the menu */
        call HandleCreate (hWnd)
        MenuWndProc = 0
        return


    case (WM_PAINT)
            call HandlePaint (hWnd)
            MenuWndProc = 0
            return


    case (WM_COMMAND)
        !// LoWord added for portability
         menuid = Loword(wParam)
         select case (menuid)
            case (IDM_EXIT)
                ret = DestroyWindow (hWnd)
            case (IDM_ABOUT)
               !/* Bring up the About.. dialog box */
               lpszDlgName = "AboutBox"C
               ret = DialogBoxParam (hInst, LOC(lpszDlgName), hWnd, LOC(About), 0)
            case (IDM_COLOROWNERDR)
               !/* Change colors in color menu depending on state of this
               !   menu item. */
                call HandleChangeColors (hWnd)

            case (IDM_STATE1, IDM_STATE2, IDM_STATE3, IDM_STATE4)
               !/* Get a handle to the states menu... */
                hMenu = GetSubMenu (GetMenu (hWnd), IDSTATES_POS)

               !/* Uncheck all the items. */
                ret = CheckMenuItem (hMenu, IDM_STATE1, IOR(MF_BYCOMMAND , MF_UNCHECKED))
                ret = CheckMenuItem (hMenu, IDM_STATE2, IOR(MF_BYCOMMAND , MF_UNCHECKED))
                ret = CheckMenuItem (hMenu, IDM_STATE3, IOR(MF_BYCOMMAND , MF_UNCHECKED))
                ret = CheckMenuItem (hMenu, IDM_STATE4, IOR(MF_BYCOMMAND , MF_UNCHECKED))

                !/* ...and just check the selected one.*/
                ret = CheckMenuItem (hMenu, wParam, IOR(MF_BYCOMMAND , MF_CHECKED))
           
            case (IDM_BLACK, IDM_RED, IDM_BLUE, IDM_GREEN)
            !/* Get a handle to the Colors menu. */
                hMenu = GetSubMenu (GetMenu (hWnd),IDCOLORS_POS)
                
                ret = MessageBox (NULL,                        &
                              "COLOR MENU"C,           &     
                              "Popup Menu Alert"C ,              &
                               MB_OK)

            !/* Uncheck all the items. */
                ret = CheckMenuItem (hMenu, IDM_BLACK, IOR(MF_BYCOMMAND , MF_UNCHECKED))
                ret = CheckMenuItem (hMenu, IDM_RED, IOR(MF_BYCOMMAND , MF_UNCHECKED))
                ret = CheckMenuItem (hMenu, IDM_BLUE, IOR(MF_BYCOMMAND , MF_UNCHECKED))
                ret = CheckMenuItem (hMenu, IDM_GREEN, IOR(MF_BYCOMMAND , MF_UNCHECKED))

            !/* ...and just check the selected one.*/
                ret = CheckMenuItem (hMenu, wParam, IOR(MF_BYCOMMAND , MF_CHECKED))

            case (IDM_FONT)
            !/* Messages sent to us from TrackPopupMenu when
            ! * items are selected from the "floating" popups
            ! */
                ret = MessageBox (NULL,                        &
                              "A font was selected"C,           &     
                              "Popup Menu Alert"C ,              &
                               MB_OK)

            case (IDM_SIZE)
                ret = MessageBox (NULL,                       &
                                "A size was selected"C ,       & 
                                "Popup Menu Alert"C  ,         &
                                 MB_OK)
            
            case (IDM_STYLE)
                ret = MessageBox (NULL,                        &
                                "A style was selected"C   , &             
                                "Popup Menu Alert"C, &
                                 MB_OK)
       end select

    case (WM_SIZE)
        if (lParam .NE. 0) then
          !/* If window is being sized to a non zero value...
          ! * invalidate it's client area.
          ! */
            ret = InvalidateRect (hWnd, NULL_RECT, .TRUE.)
        end if

    case (WM_MEASUREITEM)
      !/* Use the same width for all items. We could examine the item id
      !   and use different widths/heights for each item. */
        mis%itemWidth  = MEASUREITEMWIDTH
        mis%itemHeight = MEASUREITEMHEIGHT
        call CopyMemory (lParam, LOC(mis), 24)
        MenuWndProc = TRUE
        return

    case (WM_DRAWITEM)
      !/* Redraw the "colors" menu in normal/ownerdrawmode */
        ret = HandleDrawItem (hwnd, lParam)
        MenuWndProc = TRUE
        return

    case (WM_DESTROY)
      !/* Delete the on/off bitmaps so that they don't waste memory. */
        ret = DeleteObject (hbmCheckOn)
        ret = DeleteObject (hbmCheckOff)

        call PostQuitMessage (0)

    case (WM_LBUTTONDOWN)
      !/* Draw the "floating" popup in the app's client area */
        ret = GetClientRect (hWnd, rc)

        pt%x = INT4(LOWORD(lparam))
        pt%y = INT4(HIWORD(lparam))

        if (PtInRect (rc, pt) .NEQV. .FALSE.) then
            call HandlePopupMenu (hWnd, pt)
        end if

    case DEFAULT
          MenuWndProc = DefWindowProc(hWnd, message, wParam, lParam)
          return
end select

MenuWndProc = 0
return

end

!/****************************************************************************
! *                                                                          *
! *  FUNCTION   : ShrinkBitmap(hwnd, hbm)                                    *
! *                                                                          *
! *  PURPOSE    : This function shrinks a 64x64 bitmap into a bitmap useable *
! *               for the user-defined checkmark for menu items. This can be *
! *               easily generalized to shrink bitmaps of any size.          *
! *                                                                          *
! *  RETURNS    : HBITMAP - A handle to the new bitmap.                      *
! *                                                                          *
! ****************************************************************************/
integer*4 function ShrinkBitmap ( hwnd, hbm )
!MS$ ATTRIBUTES VALUE :: hwnd
!MS$ ATTRIBUTES VALUE :: hbm
use msfwin
use menuinc
integer*4   hwnd, hbm

integer*4   hdc
integer*4   hmemorydcNew
integer*4   hmemorydcOld
integer*4   checkMarkSize
integer*4   hCheckBitmap
integer*4   hOldBitmapSave
integer*4   hNewBitmapSave
integer(4)  ret
logical(4)  bret
integer*4   err 


hdc = GetDC (hwnd)
err = GetLastError()
!/* Create DCs for the source (old) and target (new) bitmaps */
hmemorydcNew = CreateCompatibleDC (hdc)
hmemorydcOld = CreateCompatibleDC (hdc)

!/* Determine the dimensions of the default menu checkmark and
! * create a target bitmap of the same dimensions
! */
checkMarkSize = GetMenuCheckMarkDimensions ()
hCheckBitmap  = CreateCompatibleBitmap (hdc,                      &
                                 INT4(LoWord (checkMarkSize)),          &
                                 INT4(HiWord (checkMarkSize)))

!/* Select the source bitmap and the target bitmap into their
! * respective DCs.
! */
hOldBitmapSave = SelectObject (hmemorydcNew, hCheckBitmap)
hNewBitmapSave = SelectObject (hmemorydcOld, hbm)

!/* Shrink the source bitmap into the target DC */
bret = StretchBlt (hmemorydcNew,                                   &
           0,                                                     &
           0,                                                     &
           INT4(LoWord(checkMarkSize)),                           &
           INT4(HiWord(checkMarkSize)),                           &
           hmemorydcOld,                                          &
           0,                                                     &
           0,                                                     &
           64,                                                    &
           64,                                                    &
           SRCCOPY)

!/* De-select the bitmaps and clean up .. */
ret = SelectObject (hmemorydcNew, hOldBitmapSave)
ret = SelectObject (hmemorydcOld, hNewBitmapSave)
bret = DeleteDC (hmemorydcNew)
bret = DeleteDC (hmemorydcOld)
bret = ReleaseDC (hwnd, hdc)

!/* .. and return a handle to the target bitmap */
ShrinkBitMap = hCheckBitmap
return
end

