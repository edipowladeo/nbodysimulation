!-----------------------------------------------------------------------
!
!  PAINTMOD.F90 - Module file for QWPAINT
!
!  Routines in this source file:
!    LOGICAL(4) FUNCTION Set(bitflag, value)
!    INTEGER(4) FUNCTION ControlNumber(ixpos, iypos)
!    SUBROUTINE DrawTriangle(x1, y1, x2, y2)
!
!  This module contains global data declarations and utility routines.
!
!  Because of the utility routines, this module's object file is needed
!  by the rest of the program.  If a module contains only declarations,
!  then only its MOD file is needed.
!
!-----------------------------------------------------------------------

MODULE QWPAINT

INTEGER(4)  BrushUnit, CanvasUnit
INTEGER(2)  drawcolor, fillcolor
INTEGER(4)  berm, scale, scalestep, shape, size, fill

CONTAINS

!-----------------------------------------------------------------------

LOGICAL(4)  FUNCTION Set(bitflag, value)
INTEGER(4)  bitflag, value

! This function returns TRUE if the bit set in bitflag is also set in
! value.  It is handy in cases like the following:
!
!   if (set(MOUSE$KS_LBUTTON, ikeystate)) then...
!
! This allows a simpler logical check based on whether any of the
! conditions for which predefined constants exist have occurred (as
! signified by callback variables such as keystate and event).

Set = (IAND(bitflag, value) == bitflag)

return
end FUNCTION

!-----------------------------------------------------------------------

INTEGER(4)  FUNCTION ControlNumber(ixpos, iypos)
INTEGER(4)  ixpos, iypos

! This function translates the position of the mouse cursor to a number
! that represents one of the graphical control boxes.

! Compensate for the grid border.
ixpos = ixpos - berm
iypos = iypos - berm

! Determine which control box was clicked upon.
!   -1 = Outside of control grid
!    0 = Anywhere in the color grid
!  1-4 = The first row of boxes above the color grid

if ((ixpos.GT.4*scale).OR.(iypos.GT.5*scale).OR. &
    (ixpos.LT.0).OR.(iypos.LT.0)) then
  ControlNumber = -1
else
  if (iypos.GE.scale) then
    ControlNumber = 0
  else
    ControlNumber = ixpos / scale + 1
  end if
end if

return
end FUNCTION

!-----------------------------------------------------------------------

SUBROUTINE DrawTriangle(x1, y1, x2, y2)

USE MSFLIB

INTEGER(2)     x1, y1, x2, y2
INTEGER(2)     v1x, v1y, v2x, v2y, v3x, v3y, xmid, ymid
TYPE(XYCOORD)  xy

! This routine takes bounding box coordinates and draws a triangle
! inside the box.  The direction of the triangle is determined by
! the global shape variable.

xmid = x1 + (x2 - x1) / 2
ymid = y1 + (y2 - y1) / 2

select case (shape)
  case (2)
    v1x = x1 ; v1y = y2 ; v2x = x2 ; v2y = y2 ; v3x = xmid ; v3y = y1
  case (3)
    v1x = x2 ; v1y = y2 ; v2x = x2 ; v2y = y1 ; v3x = x1 ; v3y = ymid
  case (4)
    v1x = x2 ; v1y = y1 ; v2x = x1 ; v2y = y1 ; v3x = xmid ; v3y = y2
  case (5)
    v1x = x1 ; v1y = y1 ; v2x = x1 ; v2y = y2 ; v3x = x2 ; v3y = ymid
end select

call moveto(v1x, v1y, xy)
i2 = lineto(v2x, v2y)
i2 = lineto(v3x, v3y)
i2 = lineto(v1x, v1y)

return
end SUBROUTINE

!-----------------------------------------------------------------------

END MODULE QWPAINT

!-----------------------------------------------------------------------
