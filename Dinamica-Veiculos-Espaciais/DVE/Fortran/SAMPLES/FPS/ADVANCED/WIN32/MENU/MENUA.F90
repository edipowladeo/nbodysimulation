!/****************************************************************************
! *                                                                          *
! *  FUNCTION   : HandleCreate ( hwnd )                                      *
! *                                                                          *
! *  PURPOSE    : Creates a new (empty) menu and appends to it the "State"   *
! *               menu items. It sets up the user-defined checkmarks for the *
! *               menu. It then inserts this menu into the main menu bar.    *
! *                                                                          *
! ****************************************************************************/
subroutine HandleCreate (hwnd)
!MS$ATTRIBUTES VALUE :: hwnd
use msfwin
use menuinc

integer*4   hwnd

interface
integer*4 function ShrinkBitmap ( hwnd, hbm )
!MS$ ATTRIBUTES VALUE :: hwnd
!MS$ ATTRIBUTES VALUE :: hbm
integer(4)  hwnd
integer(4)  hbm
end function ShrinkBitmap 
end interface



integer*4   hMenu
integer*4   hWndMenu
logical(4)  bret

!/* Create a new menu into the menubar on the fly */
hMenu = CreateMenu ()
if (hMenu == 0) then
    iret = messagebox(NULL,"Create Menu Failed","ERROR",MB_OK)
    return
end if

!/* Append the state menu items to it */
bret = AppendMenu (hMenu,MF_STRING,IDM_STATE1, LOC("SouthDakota"C))
bret = AppendMenu (hMenu,MF_STRING,IDM_STATE2, LOC("Washington"C))
bret = AppendMenu (hMenu,MF_STRING,IDM_STATE3, LOC("California"C))

if (AppendMenu (hMenu,MF_STRING,IDM_STATE4, LOC("OreGon"C)) .EQV. .FALSE.)&
                                             then
  !/* It is unlikely the other appends will fail and this will succeed.
  ! * So just check this one. And if it fails, Destroy the menu for
  ! * good measure and return.
  ! */
    bret = DestroyMenu(hMenu)
    return
end if
hbmCheckOn  = ShrinkBitmap (hwnd, LoadBitmap (hInst, LOC("checkon"C)))
hbmCheckOff = ShrinkBitmap (hwnd, LoadBitmap (hInst, LOC("checkoff"C)))

!/* Set up the user-defined check marks */
bret = SetMenuItemBitmaps (hMenu, 0, MF_BYPOSITION, hbmCheckOff,   &
                        hbmCheckOn)
bret = SetMenuItemBitmaps (hMenu, 1, MF_BYPOSITION, hbmCheckOff,   &
                        hbmCheckOn)
bret = SetMenuItemBitmaps (hMenu, 2, MF_BYPOSITION, hbmCheckOff,   &
                        hbmCheckOn)
bret = SetMenuItemBitmaps (hMenu, 3, MF_BYPOSITION, hbmCheckOff,   &
                        hbmCheckOn)

!/* Now insert the menu into the main menu bar. */
hWndMenu = GetMenu (hwnd)
bret = InsertMenu (hWndMenu, 2, IOR(MF_POPUP,MF_BYPOSITION), hMenu,& 
                    LOC("States"C))

return
end

!/****************************************************************************
! *                                                                          *
! *  FUNCTION   : HandlePaint ( hwnd )                                       *
! *                                                                          *
! *  PURPOSE    : Handles the repainting of the main app's client area.      *
! *                                                                          *
! ****************************************************************************/
subroutine HandlePaint (hwnd)
use msfwin
use menuinc
integer*4   hwnd

integer*4   hdc
type (T_PAINTSTRUCT)  ps
type (T_RECT)         rc

hdc = BeginPaint (hwnd, ps)

!/* Center the text in the client area */
bret = GetClientRect (hwnd,rc)

bret = DrawText (hdc,                                   &
         "Down click in the window for a popup menu"C,  &
          41, rc, IOR(DT_CENTER , DT_WORDBREAK))

bret = EndPaint(hwnd, ps)
end
