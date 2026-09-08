!****************************************************************************
!*                                                                          *
!*  FUNCTION   : HandleFocusState(LPDRAWITEMSTRUCT, int)                    *
!*                                                                          *
!*  PURPOSE    : Handle a change in item focus state. If an item gains the  *
!*               input focus, a gray rectangular frame is drawn around that *
!*               item; if an item loses the input focus, the gray frame is  *
!*               removed.                                                   *
!*                                                                          *
!*  COMMENT    : The gray focus frame is slightly smaller than the black    *
!*               selection frame so they won't paint over each other.       *
!*                                                                          *
!****************************************************************************/
subroutine HandleFocusState(lpdis, inflate)
!MS$ATTRIBUTES VALUE :: lpdis
!MS$ATTRIBUTES VALUE :: inflate
use msfwin
use owncbinc
integer*4   lpdis, inflate

type (T_DRAWITEMSTRUCT)  dis
type (T_RECT)        rc
integer*4           hbr
integer(4)          ret
logical(4)          bret

!/* Resize rectangle to place focus frame between the selection
!* frame and the item.
!*/
call CopyMemory (LOC(dis), lpdis, SIZEOFDRAWITEMSTRUCT)
bret = CopyRect (rc, dis%rcItem)
call CopyMemory (lpdis, LOC(dis), SIZEOFDRAWITEMSTRUCT)
bret = InflateRect (rc, inflate, inflate)

if (IAND(dis%itemState , ODS_FOCUS) .NE. 0) then
    !/* gaining input focus -- paint a gray frame */
    hbr = GetStockObject(GRAY_BRUSH)
else
    !/* losing input focus -- remove (paint over) frame */
    hbr = CreateSolidBrush(GetSysColor(COLOR_WINDOW))
end if
ret = FrameRect(dis%hDC, rc, hbr)
bret = DeleteObject (hbr)
end

!****************************************************************************
!*                                                                          *
!*  FUNCTION   : DrawEntireItem(LPDRAWITEMSTRUCT, int)                      *
!*                                                                          *
!*  PURPOSE    : Draws an item and frames it with a selection frame and/or  *
!*               a focus frame when appropriate.                            *
!*                                                                          *
!****************************************************************************/
subroutine DrawEntireItem(lpdis, inflate)
!MS$ATTRIBUTES VALUE :: lpdis
!MS$ATTRIBUTES VALUE :: inflate
use msfwin
use owncbinc
integer*4   lpdis, inflate

interface
subroutine HandleFocusState(lpdis, inflate)
!MS$ATTRIBUTES VALUE :: lpdis
!MS$ATTRIBUTES VALUE :: inflate
integer(4)  lpdis
integer(4)  inflate
end subroutine HandleFocusState

subroutine HandleSelectionState(lpdis, inflate)
!MS$ATTRIBUTES VALUE :: lpdis
!MS$ATTRIBUTES VALUE :: inflate
integer(4)  lpdis
integer(4)  inflate
end subroutine HandleSelectionState

end interface


type (T_DRAWITEMSTRUCT)  dis
type (T_RECT)        rc
integer*4           hbr
logical(4)          bret
integer(4)          ret

!/* Resize rectangle to leave space for frames */
call CopyMemory (LOC(dis), lpdis, SIZEOFDRAWITEMSTRUCT)
bret = CopyRect (rc, dis%rcItem)
call CopyMemory (lpdis, LOC(dis), SIZEOFDRAWITEMSTRUCT)
bret = InflateRect (rc, inflate, inflate)

!/* Create a brush using the value in the item data field (this value
!* was initialized when we added the item to the list/combo box using
!* LB_ADDSTRING/CB_ADDSTRING) and draw the color in the list/combo box.
!*/
hbr = CreateSolidBrush (dis%itemData)
ret = FillRect (dis%hDC, rc, hbr)
bret = DeleteObject (hbr)

!/* Draw or erase appropriate frames */
call HandleSelectionState(lpdis, inflate + 4)
call HandleFocusState(lpdis, inflate + 2)
end

