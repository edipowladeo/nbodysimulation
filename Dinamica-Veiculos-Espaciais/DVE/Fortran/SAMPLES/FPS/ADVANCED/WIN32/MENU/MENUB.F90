 
!/****************************************************************************
! *                                                                          *
! *  FUNCTION   : HandleChangeColors (hwnd)                                  *
! *                                                                          *
! *  PURPOSE    : Toggles the state of the Owner Draw item in the Colors     *
! *               menu. If it is on, the "Black", "Blue", "Red", and "Green" *
! *               individual menu text items are modified so that they will  *
! *               contain bands of color. Otherwise, the colors are replaced *
! *               by the text.                                               *
! *                                                                          *
! ****************************************************************************/
subroutine HandleChangeColors(hwnd)
!MS$ ATTRIBUTES VALUE :: hwnd
use msfwina
use menuinc
integer*4   hwnd

integer*4   hMenu
integer*4   fOwnerDraw
integer*4   ret
logical(4)  bret


!/* Get a handle to the Colors menu. This is at position 1. */
hMenu = GetSubMenu (GetMenu (hwnd), IDCOLORS_POS)

!/* Get the current state of the item */
fOwnerDraw = IAND(GetMenuState ( hMenu,                           &
                  IDM_COLOROWNERDR, MF_BYCOMMAND) , MF_CHECKED)

!/* Toggle the state of the item. */
if (fOwnerDraw .NE. 0 ) then                                      
    ret = CheckMenuItem ( hMenu,                                  &
               IDM_COLOROWNERDR,                                  &
               IOR(MF_BYCOMMAND , MF_UNCHECKED))
else
    ret = CheckMenuItem ( hMenu,                                  &
               IDM_COLOROWNERDR,                                  &
               IOR(MF_BYCOMMAND , MF_CHECKED))
end if

if (fOwnerDraw == 0) then
      !/* Change the items to owner-draw items. Pass the RGB value for the
      ! * color as the application-supplied data. This makes it easier for
      ! * us to draw the items.
      ! */
    bret = ModifyMenu(hMenu,                                       &
              IDM_BLACK,                                          &
              IOR(MF_OWNERDRAW , MF_BYCOMMAND),                   &
              IDM_BLACK,                                          &
              Rgb (INT1(0),INT1(0),INT1(0)))                                         

    bret = ModifyMenu(hMenu,                                       &
              IDM_BLUE,                                           &
              IOR(MF_OWNERDRAW , MF_BYCOMMAND),                   &
              IDM_BLUE,                                           &
              Rgb (INT1(0),INT1(0),INT1(255)))

    bret = ModifyMenu(hMenu,                                       &
              IDM_RED,                                            &
              IOR(MF_OWNERDRAW , MF_BYCOMMAND),                   &
              IDM_RED,                                            &
              Rgb (INT1(255),INT1(0),INT1(0)))

    bret = ModifyMenu(hMenu,                                       &
              IDM_GREEN,                                          &
              IOR(MF_OWNERDRAW , MF_BYCOMMAND),                   &
              IDM_GREEN,                                          &
              Rgb (INT1(0),INT1(255),INT1(0)))
else
      !/* Change the items to normal text items. */
    bret =  ModifyMenu(hMenu, IDM_BLACK, MF_BYCOMMAND, IDM_BLACK,  &
               LOC("Black"C))
    bret = ModifyMenu(hMenu, IDM_BLUE, MF_BYCOMMAND, IDM_BLUE,     &
                 LOC("Blue"C))
    bret = ModifyMenu(hMenu, IDM_RED, MF_BYCOMMAND, IDM_RED,       &
                LOC("Red"C))
    bret = ModifyMenu(hMenu, IDM_GREEN, MF_BYCOMMAND, IDM_GREEN,   &
                LOC("Green"C))
end if
end


!/****************************************************************************
! *                                                                          *
! *  FUNCTION   : HandleDrawItem ( hwnd, lpdis)                              *
! *                                                                          *
! *  PURPOSE    : Called in response to a WM_DRAWITEM message, i.e. when the *
! *               colors menu is being modified to an owner-draw menu, or    *
! *               one of the items is selected. It sizes the checkmark bitmap*
! *               to fit next to a color band and draws the color bands and  *
! *               the checkmark on the popup menu.                           *
! *                                                                          *
! ****************************************************************************/
integer*4   function HandleDrawItem( hwnd, lpdis )
!MS$ ATTRIBUTES VALUE :: hwnd
use msfwina
use menuinc
integer*4       hwnd
integer*4       lpdis

type (T_DRAWITEMSTRUCT)      dis
integer*4       hdcBitmap
integer*4       hbmSave
integer*4       hbr
type(T_RECT)    rc
integer*4       checkMarkSize
integer*4       textColorSave
integer*4       bkColorSave
logical(4)      bret


hwnd = hwnd

!/* Get the size of the checkmark so we can leave room for it since we
! * want to be able to check the selected color.
! */
checkMarkSize = GetMenuCheckMarkDimensions ()
call CopyMemory(LOC(dis), lpdis, 48)

if (dis%itemAction == ODA_SELECT                                &
            .OR. dis%itemAction == ODA_DRAWENTIRE) then

    bret = CopyRect ( rc, dis%rcItem)
    bret = InflateRect (rc, (-2 - LoWord(checkMarkSize)), -2)

    if (IAND(dis%itemState , ODS_SELECTED) .NE. 0) then
      !/* Item has been selected -- hilite with a gray frame */
        hbr = GetStockObject (GRAY_BRUSH)
        ret = FrameRect (dis%hDC, rc, hbr)
    else if (dis%itemAction == ODA_SELECT) then
      !/* Item has been de-selected -- remove gray frame */
        hbr = CreateSolidBrush (GetSysColor (COLOR_MENU))
        ret = FrameRect (dis%hDC, rc, hbr)
        bret = DeleteObject (hbr)
    end if
end if

if (dis%itemAction == ODA_DRAWENTIRE) then

    !/* Paint the color item in the color requested. */
    hbr = CreateSolidBrush (dis%itemData)
    bret = CopyRect (rc, dis%rcItem)
    bret = InflateRect (rc, -10-LoWord(checkMarkSize), -10)
    ret = FillRect (dis%hDC, rc, hbr)
    bret = DeleteObject (hbr)

    if (IAND(dis%itemState , ODS_CHECKED) .NE. 0) then
      !/* Draw the check mark if the item is checked. */
        hdcBitmap = CreateCompatibleDC (dis%hDC)
        hbmSave = SelectObject (hdcBitmap, hbmCheckOn)

        textColorSave = SetTextColor (dis%hDC, 16#00000000)
        bkColorSave   = SetBkColor (dis%hDC, 16#00FFFFFF)

      !/* Use Magic bitblt op so that monochrome bitmaps preserve
      !   background and foreground colors. */
        bret = BitBlt (dis%hDC,                                    &
               dis%rcItem%left,                                   &
               dis%rcItem%top + (MEASUREITEMHEIGHT - INT4(HiWord (checkMarkSize))) / 2, &
               INT4(LoWord (checkMarkSize)),                            &
               INT4(HiWord (checkMarkSize)),                            &
               hdcBitmap,                                         &
               0,                                                 &
               0,                                                 &
               ROP_PSDPxax)

      !/* Restore colors and bitmap and clean up */
        ret = SetTextColor (dis%hDC, textColorSave)
        ret = SetBkColor (dis%hDC, bkColorSave)
        ret = SelectObject (hdcBitmap, hbmSave)
        bret = DeleteDC (hdcBitmap)

    end if
end if
HandleDrawItem = 1
return
end

