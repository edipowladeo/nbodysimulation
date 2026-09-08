!******************************************************************************
!*       This is a part of the Microsoft Source Code Samples. 
!*       Copyright (C) 1993 Microsoft Corporation.
!*       All rights reserved. 
!*       This source code is only intended as a supplement to 
!*       Microsoft Development Tools and/or WinHelp documentation.
!*       See these sources for detailed information regarding the 
!*       Microsoft samples programs.
!******************************************************************************
subroutine Animate()
!MS$ATTRIBUTES STDCALL, ALIAS : '_Animate@0' :: Animate
use twaveinc
use msfwin
use opengl
interface

integer(4) function GETFACET (frame, x, y)
!MS$ATTRIBUTES VALUE :: frame
!MS$ATTRIBUTES VALUE :: x
!MS$ATTRIBUTES VALUE :: y
integer(4)  frame, x, y
end function GETFACET

integer(4) function GETCOORD (frame, x, y)
!MS$ATTRIBUTES VALUE :: frame
!MS$ATTRIBUTES VALUE :: x
!MS$ATTRIBUTES VALUE :: y
integer(4)  frame, x, y
end function GETCOORD

end interface



    integer(4)  pcoord     ! pointer to coord structure
    integer(4)  pfacet     ! pointer to facet structure
    integer(4)  lastColor    ! pointer to real number
    integer(4)  thisColor    ! pointer to real number
    type(coord) coord1
    type(facet) facet1
    integer(4)  i, j
    integer(4)  tc0, lc0

    call fglClear(clearMask)

    if (nextFrame .OR. NOT(stepMode)) then
        curFrame = curFrame + 1
    end if

    if (curFrame >= theMesh%frames) then
        curFrame = 0
    end if

    if ((nextFrame .OR. NOT(stepMode)) .AND. spinMode) then
        call fglRotatef(5.0, 0.0, 0.0, 1.0)
    end if
    nextFrame = 0

    do i = 0, theMesh%widthX - 1
      call fglBegin(GL_QUAD_STRIP)
      lastColor = 0
      do j = 0, theMesh%widthY - 1 
         pfacet = GETFACET(curFrame, i, j)
         call CopyMemory (LOC(facet1), pfacet, 24)
         if (NOT(smooth) .AND. lighting) then
                call fglNormal3fv(LOC(facet1%normal))
                end if
                if (lighting) then
                if (rgbValue) then
                        thisColor = LOC(facet1%color)
                        call fglColor3fv(LOC(facet1%color))
                else
                        thisColor = LOC(facet1%color)
                        call fglMaterialfv(GL_FRONT_AND_BACK, GL_COLOR_INDEXES, LOC(facet1%color))
                end if
                else 
                if (rgbValue) then
                        thisColor = LOC(facet1%color)
                        call fglColor3fv(LOC(facet1%color))
                else 
                        thisColor = LOC(facet1%color)
                        call CopyMemory (LOC(c1), pfacet+4, 4)
                        call fglIndexf(c1)
                end if
                end if
                call CopyMemory (LOC(tc0), thiscolor, 4)
                if (lastcolor) then
                    call CopyMemory (LOC(lc0), lastcolor, 4)
                else
                    lc0 = 0
                end if
                
                if (NOT(lastColor) .OR. (tc0 .NE. lc0 .AND. smooth)) then
                if (lastColor) then
                        call fglEnd()
                        call fglBegin(GL_QUAD_STRIP)
                end if
                pcoord = GETCOORD(curFrame, i, j)
                call CopyMemory (LOC(coord1), pcoord, 24)
                if (smooth .AND. lighting) then
                        call fglNormal3fv(LOC(coord1%normal))
                end if

                call fglVertex3fv(LOC(coord1%vertex))

                pcoord = GETCOORD(curFrame, i+1, j)
                call CopyMemory (LOC(coord1), pcoord, 24)
                if (smooth .AND. lighting) then
                        call fglNormal3fv(LOC(coord1%normal))
                end if

                call fglVertex3fv(LOC(coord1%vertex))
                end if

                pcoord = GETCOORD(curFrame, i, j+1)
                call CopyMemory (LOC(coord1), pcoord, 24)
                if (smooth .AND. lighting) then
                call fglNormal3fv(LOC(coord1%normal))
                end if
                call fglVertex3fv(LOC(coord1%vertex))

                pcoord = GETCOORD(curFrame, i+1, j+1)
                call CopyMemory (LOC(coord1), pcoord, 24)
                if (smooth .AND. lighting) then
                call fglNormal3fv(LOC(coord1%normal))
                end if
                call fglVertex3fv(LOC(coord1%vertex))

                lastColor = thisColor
        end do
        call fglEnd()
    end do

    call fglFlush()
    if (doubleBuffer) then
        call fauxSwapBuffers()
    end if
end 

subroutine SetColorMap() 
use twaveinc
use opengl
use msfwin
    real(4) green(3) 
    real(4) red(3)          
    integer(4) color        ! pointer to real number
    real(4) percent
    integer(4) indexes
    integer(4) entries, i, j
    integer(4)  i0, i1, i2
    real(4)     c0, c1, c2

    save green, red
    data green /0.2, 1.0, 0.2/ , red /1.0, 0.2, 0.2/

    entries = fauxGetColorMapSize()

    colorIndexes1(1) = 1
    colorIndexes1(2) = 1 + INT((entries - 1) * 0.3)
    colorIndexes1(3) = INT((entries - 1) * 0.5)
    colorIndexes2(1) = 1 + INT((entries - 1) * 0.5)
    colorIndexes2(2) = 1 + INT((entries - 1) * 0.8)
    colorIndexes2(3) = entries - 1

    do i = 0, 1
         select case (i)
            case (0)
               color = LOC(green)
               indexes = LOC(colorIndexes1)
            case (1)
               color = LOC(red)
               indexes = LOC(colorIndexes2)
         end select

         call CopyMemory(LOC(i0), LOC(indexes), 4)
         call CopyMemory(LOC(i1), LOC(indexes+4), 4)
         call CopyMemory(LOC(i2), LOC(indexes+8), 4)
         call CopyMemory(LOC(c0), LOC(color), 4)
         call CopyMemory(LOC(c1), LOC(color+4), 4)
         call CopyMemory(LOC(c2), LOC(color+8), 4)
         
         do j = i0, i1 -1 
            percent = 0.2 + 0.8 * (j - i0) / REAL(i1 - i0)
            call fauxSetOneColor(j, percent*c0, percent*c1, percent*c2)
         end do

         call CopyMemory(LOC(i2), LOC(indexes+8), 4)
         do j = i1, i2
            percent = (j - i1) / REAL(i2 - i1)
            call fauxSetOneColor(j, percent*(1-c0)+c0,  &
                     percent*(1-c1)+c1,                 &
                     percent*(1-c2)+c2)
         end do
    end do
end


