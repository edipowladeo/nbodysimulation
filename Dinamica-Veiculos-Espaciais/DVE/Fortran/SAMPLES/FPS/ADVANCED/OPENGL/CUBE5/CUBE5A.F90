!******************************************************************************
!*       This is a part of the Microsoft Source Code Samples. 
!*       Copyright (C) 1993 Microsoft Corporation.
!*       All rights reserved. 
!*       This source code is only intended as a supplement to 
!*       Microsoft Development Tools and/or WinHelp documentation.
!*       See these sources for detailed information regarding the 
!*       Microsoft samples programs.
!******************************************************************************
!/*
! * SetDCPixelFormat sets the pixel format for teh device context in
! * preparation for creating a rendering context.
! *
! * Input parameters:
! *     hdc = Device context handle 
! *
! * Returns:
! *     Nothing
! */

subroutine SetDCPixelFormat(hdc)
!MS$  ATTRIBUTES VALUE :: hdc
use msfwina
use opengl
use cubeinc
integer(4)                      hdc
integer(4)                      hHeap
integer(4)                      nColors, i
integer(4)                      lpPalette
BYTE                            byRedMask, byGreenMask, byBlueMask
type(T_LOGPALETTE)              logpal
type(T_PIXELFORMATDESCRIPTOR)   pfd 
type(T_PALETTEENTRY)            palette(256);

logical(4)  bret

    DATA pfd / T_PIXELFORMATDESCRIPTOR (  &
         40,                & !sizeof(T_PIXELFORMATDESCRIPTOR),
         1,                 &
         #25, & !IOR(PFD_DRAW_TO_WINDOW ,IOR(PFD_SUPPORT_OPENGL , PFD_DOUBLEBUFFER)), &
         PFD_TYPE_RGBA,     &
         24,                &
         0, 0, 0, 0, 0, 0,  &
         0, 0,              &
         0, 0, 0, 0, 0,     &
         32,                &
         0,                 &
         0,                 &
         PFD_MAIN_PLANE,    &
         0,                 &
         0, 0, 0            &
      ) /

   integer(4)   nPixelFormat

   nPixelFormat = ChoosePixelFormat(hdc, pfd)
   bret = SetPixelFormat(hdc, nPixelFormat, pfd)

    i = DescribePixelFormat (hdc, nPixelFormat, 40, pfd)

    if (IAND(pfd%dwFlags , PFD_NEED_PALETTE)) then
        nColors = ISHL(1, pfd%cColorBits)
        hHeap = GetProcessHeap()

        lpPalette = HeapAlloc (hHeap, 0, 8 + (nColors * 4))
      logpal%palVersion = #300
      logpal%palNumEntries = nColors

      logPal%palPalEntry(1) = palette(1)
!     lpPalette->palVersion = #300
!       lpPalette->palNumEntries = nColors

        byRedMask   = ISHL(1, pfd%cRedBits) - 1
        byGreenMask = ISHL(1, pfd%cGreenBits) - 1
        byBlueMask  = ISHL(1, pfd%cBlueBits) - 1

        do i = 1, nColors
         palette(i)%peRed =            &
                (IAND((ISHL(i ,-pfd%cRedShift)) , byRedMask) * 255) / byRedMask
         palette(i)%peGreen =       &
                (IAND((ISHL(i ,-pfd%cGreenShift)) , byGreenMask) * 255) / byGreenMask
         palette(i)%peBlue =        &
                (IAND((ISHL(i ,-pfd%cBlueShift)) , byBlueMask) * 255) / byBlueMask
      end do

      !call CopyMemory (lpPalette, LOC(logpal), 8 + (nColors * 4))
      hPalette = CreatePalette (logpal)
      if (hPalette .NE. NULL) then
          i = SelectPalette (hdc, hPalette, .FALSE.)
          i = RealizePalette (hdc)
      end if
    end if
end

!/*
! *  InitializeRC initializes the current rendering context.
! *  
! *  Input parameters:
! *      None
! *  
! *  Returns:
! *      Nothing
! */

subroutine InitializeRC ()
use msfwina
use opengl
    real(4)     glfLightAmbient(4)
    real(4)     glfLightDiffuse(4)
    real(4)     glfLightSpecular(4)

    DATA glfLightAmbient /0.1, 0.1, 0.1, 1.0/
    DATA glfLightDiffuse /0.7, 0.7, 0.7, 1.0/
    DATA glfLightSpecular / 1.0, 0.0, 0.0, 1.0/
    !//
    !// Enable depth testing and backface culling.
    !//    
    call fglEnable(GL_DEPTH_TEST)
    call fglEnable(GL_CULL_FACE)

    !//
    !// Add a light to the scene
    !//

    call fglLightfv (GL_LIGHT0, GL_AMBIENT, LOC(glfLightAmbient))
    call fglLightfv (GL_LIGHT0, GL_DIFFUSE, LOC(glfLightDiffuse))
    call fglLightfv (GL_LIGHT0, GL_SPECULAR, LOC(glfLightSpecular))
    
    call fglEnable (GL_LIGHTING)
    call fglEnable (GL_LIGHT0)
end 


