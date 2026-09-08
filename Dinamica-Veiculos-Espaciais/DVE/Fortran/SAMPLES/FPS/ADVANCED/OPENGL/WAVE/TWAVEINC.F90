!******************************************************************************
!*       This is a part of the Microsoft Source Code Samples. 
!*       Copyright (C) 1993 Microsoft Corporation.
!*       All rights reserved. 
!*       This source code is only intended as a supplement to 
!*       Microsoft Development Tools and/or WinHelp documentation.
!*       See these sources for detailed information regarding the 
!*       Microsoft samples programs.
!******************************************************************************
module twaveinc
use opengl
real(8), parameter, public :: PI = 3.14159265358979323846


integer(4)  rgbValue, doubleBuffer

integer(4)  colorIndexes1(3)
integer(4)  colorIndexes2(3)
integer(4)  clearMask

integer(4)  smooth      
integer(4)  lighting    
integer(4)  depth       

integer(4)  stepMode    
integer(4)  spinMode    
integer(4)  contouring  

integer(4)  widthX, widthY
integer(4)  checkerSize
real(4)  height

integer(4)  frames, curFrame, nextFrame

type facet
    real(4) color(3)
    real(4) normal(3)
end type facet

type coord 
    real(4) vertex(3)
    real(4) normal(3)
end type coord

type mesh
    integer(4) widthX, widthY
    integer(4) numFacets
    integer(4) numCoords
    integer(4) frames
    integer(4) coords   ! pointer to coord structure
    integer(4) facets   ! pointer to facet structure
end type mesh

type(mesh) theMesh

BYTE contourTexture1(16)
BYTE contourTexture2(16)

end module twaveinc

