subroutine doMetrics (hwnd)
!MS$ATTRIBUTES VALUE :: hwnd
use gtsysinc
integer     hwnd
integer     answer
integer*4   ret

include 'data.f90'

ret = SetDlgItemText (hwnd, DID_TEXT, "System Metrics"C)

do i = 1, NSYSMETRICS 
    !/*******************************************************/
    !/*******************************************************/
    answer = GetSystemMetrics (SystemMetrics(i)%Val)
    !/*******************************************************/
    !/*******************************************************/
    write(buffer, 100) SystemMetrics(i)%String, answer
100       format (A27,I5)
    ret = SendDlgItemMessage (hwnd, DID_LISTBOX, LB_ADDSTRING, 0, &
                        LOC(buffer))
end do

return
end 



subroutine doPalette(hwnd)
!MS$ATTRIBUTES VALUE :: hwnd
use gtsysinc

integer     hwnd
integer     nEntries
integer     hdc
type (T_PALETTEENTRY)   PalEntry(256)
integer*4   ret
include 'data.f90'

ret = SetDlgItemText (hwnd, DID_TEXT, "System Palette"C)

!/* this function is slightly different because the amount of information
! * is not known until run time.  First find the number of entries in the
! * palette (16 for VGA, but 256 for 8514, ...), then allocate enough
! * space to hold all of them, query the information, put it in the list
! * box, and then free up the memory allocated.
! */
hdc = GetDC (hwnd)
nEntries = GetSystemPaletteEntries (hdc, 0, 0, NULL_PALETTEENTRY)

  !/*******************************************************/
  !/*******************************************************/
nEntries = GetSystemPaletteEntries (hdc, 0,nEntries, PalEntry(1))
  !/*******************************************************/
  !/*******************************************************/

ret = ReleaseDC (hwnd, hdc)
do i = 1, nEntries
    write (buffer, 250) i-1,PalEntry(i)%peRed, PalEntry(i)%peGreen, &
                        PalEntry(i)%peBlue, PalEntry(i)%peFlags
250       format (I5, 4X, Z2, 4X, Z2, 4X, Z2, 4X, Z2 )


    ret = SendDlgItemMessage (hwnd, DID_LISTBOX, LB_ADDSTRING, 0, &
                        LOC(buffer))
end do

return
end 
