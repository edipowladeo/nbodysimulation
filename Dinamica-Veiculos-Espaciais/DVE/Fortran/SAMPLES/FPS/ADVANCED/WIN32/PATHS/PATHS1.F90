!**************************************************************************
!*
!*  function:  DrawPath()
!*
!* The path used here is a simple rectangle with an ellipse inside of it.
!*  The InflateRect() calls have nothing to do with the path, but are just
!*  used for convenience.
!**************************************************************************
subroutine DrawPath( hdc, pRect)
use msfwina
use pathsinc
integer*4 hdc
type (T_RECT) prect
type (T_RECT) destRect

!/* make a copy that we can modify with impunity. */
i = CopyRect (destRect, prect)

i = BeginPath (hdc)

i = InflateRect (destRect, &
      ((destRect%left- destRect%right)/5),&
      ((destRect%top- destRect%bottom)/5))

i = Rectangle (hdc, destRect%left, destRect%top, destRect%right, destRect%bottom)

i = InflateRect (destRect, &
      ((destRect%left- destRect%right)/4), &
      ((destRect%top- destRect%bottom)/4))

i = Ellipse (hdc, destRect%left, destRect%top,&
                  destRect%right, destRect%bottom)

i = EndPath (hdc)
end
