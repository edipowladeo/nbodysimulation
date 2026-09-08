!******************************************************************************
!*       This is a part of the Microsoft Source Code Samples. 
!*       Copyright (C) 1993 Microsoft Corporation.
!*       All rights reserved. 
!*       This source code is only intended as a supplement to 
!*       Microsoft Development Tools and/or WinHelp documentation.
!*       See these sources for detailed information regarding the 
!*       Microsoft samples programs.
!******************************************************************************
subroutine InitMesh()
use twaveinc
use opengl
use msfwin

interface
integer(4) function GETCOORD (frameNum, i, j)
!MS$ATTRIBUTES VALUE :: frameNum
!MS$ATTRIBUTES VALUE :: i
!MS$ATTRIBUTES VALUE :: j
integer(4)  frameNum, i, j
end function GETCOORD

integer(4) function GETFACET (frameNum, i, j)
!MS$ATTRIBUTES VALUE :: frameNum
!MS$ATTRIBUTES VALUE :: i
!MS$ATTRIBUTES VALUE :: j
integer(4)  frameNum, i, j
end function GETFACET
end interface

    integer(4)  pcoord  ! pointer to coord structure.
    integer(4)  pfacet  ! pointer to facet structure.
    type(coord) coord1
    type(facet) facet1

    real(4) dp1(3), dp2(3)
    integer(4)  pt1, pt2, pt3   ! pointer to real numbers.
    real(4)     r1(3), r2(3), r3(3)

    real(4)  angle, d, x, y
    
    integer(4)  numFacets, numCoords, frameNum, i, j

    theMesh%widthX = widthX
    theMesh%widthY = widthY
    theMesh%frames = frames

    numFacets = widthX * widthY
    numCoords = (widthX + 1) * (widthY + 1)

    theMesh%numCoords = numCoords
    theMesh%numFacets = numFacets

    theMesh%coords = GlobalLock(GlobalAlloc(0, frames * numCoords * 24))  !sizeof(struct coord)) = 24
    theMesh%facets = GlobalLock(GlobalAlloc(0, frames * numFacets * 24))  !sizeof(struct facet)) = 24
    if (theMesh%coords == 0 .OR. theMesh%facets == 0) then
        ! printf("Out of memory.\n")
        call fauxQuit()
    end if

    do frameNum = 0, frames-1
        do i = 0, widthX
            x = i / REAL(widthX)
            do j = 0, widthY
                y = j / REAL(widthY)

                d = sqrt(x*x+y*y)
                if (d == 0.0) then
                    d = 0.0001
                end if
                angle = 2 * PI * d + (2 * PI / frames * frameNum)

                pcoord = GETCOORD(frameNum, i, j)
                call CopyMemory(LOC(coord1), pcoord, 24) 
                coord1%vertex(1) = x - 0.5
                coord1%vertex(2) = y - 0.5
                coord1%vertex(3) = (height - height * d) * cos(angle)

                coord1%normal(1) = -(height / d) * x * ((1 - d) * 2 * PI *  &
                          sin(angle) + cos(angle))
                coord1%normal(2) = -(height / d) * y * ((1 - d) * 2 * PI *  &
                          sin(angle) + cos(angle))
                coord1%normal(3) = -1

                d = 1.0 / sqrt(coord1%normal(1)*coord1%normal(1)+   &
                            coord1%normal(2)*coord1%normal(2)+1)
                coord1%normal(1) = coord1%normal(1) * d
                coord1%normal(2) = coord1%normal(2) * d
                coord1%normal(3) = coord1%normal(3) * d
                call CopyMemory(pcoord, LOC(coord1), 24) 
            end do  ! do j
        end do  ! do i

        do i = 0, widthX-1
            do j = 0, widthY-1
                pfacet = GETFACET(frameNum, i, j)
                call CopyMemory(LOC(facet1), pfacet, 24)
                if (IEOR(MOD(i/checkerSize,2),MOD(j/checkerSize,2))) then
                    if (rgbValue) then
                        facet1%color(1) = 1.0
                        facet1%color(2) = 0.2
                        facet1%color(3) = 0.2
                    else 
                        facet1%color(1) = colorIndexes1(1)
                        facet1%color(2) = colorIndexes1(2)
                        facet1%color(3) = colorIndexes1(3)
                    end if
                else 
                    if (rgbValue) then
                        facet1%color(1) = 0.2
                        facet1%color(2) = 1.0
                        facet1%color(3) = 0.2
                    else
                        facet1%color(1) = colorIndexes2(1)
                        facet1%color(2) = colorIndexes2(2)
                        facet1%color(3) = colorIndexes2(3)
                    end if
                end if

                pt1 = GETCOORD(frameNum, i, j)
                call CopyMemory (LOC(r1), pt1, 12)

                pt2 = GETCOORD(frameNum, i, j+1)
                call CopyMemory (LOC(r2), pt2, 12)

                pt3 = GETCOORD(frameNum, i+1, j+1)
                call CopyMemory (LOC(r3), pt3, 12)

                dp1(1) = r2(1) - r1(1)
                dp1(2) = r2(2) - r1(2)
                dp1(3) = r2(3) - r1(3)

                dp2(1) = r3(1) - r2(1)
                dp2(2) = r3(2) - r2(2)
                dp2(3) = r3(3) - r2(3)

                facet1%normal(1) = dp1(2) * dp2(3) - dp1(3) * dp2(2)
                facet1%normal(2) = dp1(3) * dp2(1) - dp1(1) * dp2(3)
                facet1%normal(3) = dp1(1) * dp2(2) - dp1(2) * dp2(1)

                d = 1.0 / sqrt(facet1%normal(1)*facet1%normal(1)+  &
                        facet1%normal(2)*facet1%normal(2)+         &
                        facet1%normal(3)*facet1%normal(3))

                facet1%normal(1) =  facet1%normal(1) * d
                facet1%normal(2) =  facet1%normal(2) * d
                facet1%normal(3) =  facet1%normal(3) * d

                call CopyMemory (pfacet, LOC(facet1), 24)

            end do  ! do j
        end do  ! do i
    end do  ! do framenum
end

subroutine InitMaterials()
use opengl
use twaveinc
    real(4) ambient(4) 
    real(4) diffuse(4)
    real(4) position(4) 
    real(4) front_mat_shininess
    real(4) front_mat_specular(4)
    real(4) front_mat_diffuse(4) 
    real(4) back_mat_shininess
    real(4) back_mat_specular(4) 
    real(4) back_mat_diffuse(4) 
    real(4) lmodel_ambient(4) 
    real(4) lmodel_twoside

    data ambient /0.1, 0.1, 0.1, 1.0/
    data diffuse /0.5, 1.0, 1.0, 1.0/
    data position /90.0, 90.0, 150.0, 0.0/
    data front_mat_shininess /60.0/
    data front_mat_specular /0.2, 0.2, 0.2, 1.0/
    data front_mat_diffuse /0.5, 0.28, 0.38, 1.0/
    data back_mat_shininess /60.0/
    data back_mat_specular /0.5, 0.5, 0.2, 1.0/
    data back_mat_diffuse /1.0, 1.0, 0.2, 1.0/
    data lmodel_ambient /1.0, 1.0, 1.0, 1.0/
    data lmodel_twoside /GL_TRUE/

    call fglMatrixMode(GL_PROJECTION)
    call fgluPerspective(DBLE(450), DBLE(1.0), DBLE(0.5), DBLE(10.0))

    call fglLightfv(GL_LIGHT0, GL_AMBIENT, LOC(ambient))
    call fglLightfv(GL_LIGHT0, GL_DIFFUSE, LOC(diffuse))
    call fglLightfv(GL_LIGHT0, GL_POSITION, LOC(position))
    call fglLightModelfv(GL_LIGHT_MODEL_AMBIENT, LOC(lmodel_ambient))
    call fglLightModelfv(GL_LIGHT_MODEL_TWO_SIDE, LOC(lmodel_twoside))
    call fglEnable(GL_LIGHTING)
    call fglEnable(GL_LIGHT0)
    
    call fglMaterialfv(GL_FRONT, GL_SHININESS, LOC(front_mat_shininess))
    call fglMaterialfv(GL_FRONT, GL_SPECULAR, LOC(front_mat_specular))
    call fglMaterialfv(GL_FRONT, GL_DIFFUSE, LOC(front_mat_diffuse))
    call fglMaterialfv(GL_BACK, GL_SHININESS, LOC(back_mat_shininess))
    call fglMaterialfv(GL_BACK, GL_SPECULAR, LOC(back_mat_specular))
    call fglMaterialfv(GL_BACK, GL_DIFFUSE, LOC(back_mat_diffuse))

    if (rgbValue) then
      call fglColorMaterial(GL_FRONT_AND_BACK, GL_DIFFUSE)
    end if

    if (rgbValue) then
      call fglEnable(GL_COLOR_MATERIAL)
    else 
      call SetColorMap()
    end if
end

