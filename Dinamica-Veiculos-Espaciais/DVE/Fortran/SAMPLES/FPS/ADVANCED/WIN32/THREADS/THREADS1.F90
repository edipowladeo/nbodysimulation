!*************************************************************************\
!*
!*  FUNCTION:  ThreadProc (integer)
!*
!*  PURPOSE:   A thread procedure which calculates position on the window
!*             and draws a colored rectangle.  The color of the rectangle
!*             is determined by the input parameter, it's border is
!*             always black (or whatever the pen color is) and since
!*             the window does not paint between rectangle draws, the
!*             rectangle leaves a black path in it's wake.
!*
!*  VARIABLES USED:
!*
!*    - horizontal, vertical:
!*             Local int used to indicate the next directional move the
!*             rectangle will make.
!*
!*    - ulx, uly:
!*             Local DWORD used for the Upper Left X corner and Upper
!*             Upper Left Y position of the rectangle.
!*
!*    - rect:  A RECT structure used to determin the current size of the
!*             window (in case the user resizes it).
!*
!*    - hdc:   HDC of the rectangle.
!*
!*    - Time:  A SYSTEMTIME structure.  It's milli-second field is used
!*             to create an apparent random starting point for the
!*             rectangles.
!*
!*    -hBrush: A handle to a Brush object, used to set the color of the
!*             rectangle.
!*
!*    -width, height:
!*             Local DWORDs used for the width and height of the rectangles.
!*
!*  CALLED BY:
!*
!*    MainWndProc()
!*
!*************************************************************************/


recursive integer function ThreadProc(color)
!MS$ ATTRIBUTES STDCALL, ALIAS :'_ThreadProc@4' :: ThreadProc

use msfwina
use threadin

integer                 color
integer*4               horizontal, vertical
integer*4               ulx, uly
type (T_RECT)           rect1
integer*4               hDC
type (T_SYSTEMTIME)     Time
integer*4               hBrush
integer*4               width, height
integer*4               NewColor


   call CopyMemory(LOC(NewColor),color,4)

   width =  10
   height = 10

   call GetSystemTime (Time)                     ! Get the time.
   
   
   do while(GetClientRect(hWnd2, rect1) .eqv. .FALSE.)    ! Loop, making sure window  exists.
      i = 1
   end do

   ulx = (mod((Time%wMilliseconds) ,(rect1%right)))   ! Use MOD to get a random
   uly = (mod((Time%wMilliseconds) ,(rect1%bottom)))  ! position.

   if(mod(Time%wMilliseconds , 2) == 0) then         ! Use MOD to pick random
      horizontal = 1                                            ! directions.
      vertical = 1
   else
      horizontal = 1
      vertical = -1
   end if

   ! Set color as per input parameter.
   hBrush = CreateSolidBrush(NewColor) 

   do  while (1 == 1)
      i = GetClientRect( hWnd2, rect1)
      if ( (ulx+width) > rect1%right) then   ! ... check for right edge,
         ulx = rect1%right - width
         horizontal = -1                       !   ... if so change direction
      end if

      if ((uly+height) > rect1%bottom) then ! ... check for bottom edge,
         uly = rect1%bottom - height            !   ... if so change dir.
         vertical = -1
      end if
      if (uly <= 1)  then                         ! ... check for right edge,
         uly = 1
         vertical = 1
      end if
      if  (ulx <= 1) then
         ulx = 1
         horizontal = 1
      end if

      hDC = GetDC(hWnd2)                           ! ... Get DC,
      i = SelectObject(hDC,hBrush)               ! ... Set brush color,
                                                ! ... Draw rectangle,
      i = Rectangle (hDC, ulx, uly, ulx+width, uly+height)
      i = ReleaseDC(hWnd2, hDC)                       ! ... Release DC

      ulx = ulx + horizontal                      ! ... Increment/decrement
      uly = uly + vertical                        ! ... position.
   end do
   ThreadProc = 1
   return
end 
