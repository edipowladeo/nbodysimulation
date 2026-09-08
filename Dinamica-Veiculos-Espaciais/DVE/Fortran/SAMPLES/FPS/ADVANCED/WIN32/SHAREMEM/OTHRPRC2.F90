!*************************************************************************\
!*
!*  FUNCTION:  subroutine ReadProc ()
!*
!*  PURPOSE:   A thread which continually reads the shared memory for new
!*             X and Y coordinates, and then draws the bitmap where indicated.
!*
!*  VARIABLES USED:
!*
!*    - hCrossHair:
!*             A handle to the bitmap.
!*
!*    - lParam, oldParam:
!*             LONGs used to hold the new and the old mouse coordinates.
!*
!*    - hDC, hDCMem:
!*             The DC of the window, and a memory DC used as the source
!*             of the bitmap.
!*
!*    - X, Y:  Integers representing the X and Y coordinates taken from
!*             the shared memory and used to locate the bitmap.
!*
!*    - hBrush:
!*             Handle to a brush, used to erase the old bitmap before
!*             redrawing it in the new location.
!*
!*    - rect:  A RECT, used to blot out the old bitmap (erasing it) 
!*
!*    - bm:    a BITMAP structure for the bitmap.
!*
!*    - ptSize, ptOrg:
!*             POINTS used in transforming the coordinates for the bitmap.
!*
!*  COMMENTS:
!*
!*    This function first uses structured exception handling to try to
!*    read the shared memory a first time.  If successful, it's assumed
!*    that the rest of the read will not cause an exception.  The code then
!*    sets a brush for erasing the bitmap, and loads the bitmap.  It then
!*    begins to loop.  Each loop reads the memory.  If the value has
!*    changed since the last read the old bitmap is erased by drawing a
!*    rectangle over the old coordinates, and then the bitmap is moved
!*    and redrawn using the new coordinates.
!*
!*************************************************************************/
subroutine ReadProc()
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ReadProc@0' :: ReadProc
use msfwin
use otherinc

integer*4       hCrossHair 
integer*4       lParam, oldParam 
integer*4       hDC, hDCMem 
integer*4       X, Y 
integer*4       hBrush 
type (T_RECT)   Rect1 
type (T_BITMAP) bm 
type (T_POINT)  ptSize, ptOrg 

call CopyMemory (LOC(lParam), MapView, 4)

if (MapView == 0) then
   go to 1000
end if

hBrush = GetStockObject(WHITE_BRUSH) 
X = LOWORD(lParam) 
Y = HIWORD(lParam) 
hCrossHair = LoadBitmap(hInst, LOC("CrossHair"C)) 

do while (1 == 1)
    call CopyMemory (LOC(lParam), MapView, 4)
   
  if (lParam .NE. oldParam) then

      hDC = GetDC(hWnd1) 

      Rect1%top = Y  
      Rect1%left = X  
      Rect1%bottom = Y+16  
      Rect1%right = X+16 
      i = FillRect(hDC, Rect1, hBrush) 

      X = LOWORD(lParam) 
      Y = HIWORD(lParam) 
    
      hDCMem = CreateCompatibleDC(hDC) 
      i = SelectObject(hDCMem, hCrossHair) 
      i = SetMapMode(hDCMem, GetMapMode(hDC)) 
      
      i = GetObject(hCrossHair, 24, LOC(bm) )
      
      ptSize%x = bm%bmWidth 
      ptSize%y = bm%bmHeight 
      i = DPtoLP (hDC, ptSize, 1) 

      ptOrg%x = 0 
      ptOrg%y = 0 
      i = DPtoLP (hDCMem, ptOrg, 1) 

      i = BitBlt(hDC, X, Y, ptSize%x, ptSize%y,                       &
          hDCMem, ptOrg%x, ptOrg%y, SRCCOPY) 

      oldParam = lParam 

      i = SetDlgItemInt (hWndDlg, IDE_XCOORD, X, .FALSE.) 
      i = SetDlgItemInt (hWndDlg, IDE_YCOORD, Y, .FALSE.) 
      i = ReleaseDC(hWnd1, hDC) 
      i = DeleteDC(hDCMem) 
    end if
end do
return 
1000 end 
