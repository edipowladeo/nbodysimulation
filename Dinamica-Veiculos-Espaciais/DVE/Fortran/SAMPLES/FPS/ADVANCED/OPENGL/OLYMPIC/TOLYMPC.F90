subroutine ReInit()
use olympinc
real(4) MyRand [EXTERN]

   integer(4)   i
   real(4) deviation

   deviation = MyRand() / 2
   deviation = deviation * deviation
   do i = 1, RINGS
      offsets(i,1) = MyRand()
      offsets(i,2) = MyRand()
      offsets(i,3) = MyRand()
      angs(i) = 260.0 * MyRand()
      rotAxis(i,1) = MyRand()
      rotAxis(i,2) = MyRand()
      rotAxis(i,3) = MyRand()
      iters(i) = (deviation * MyRand() + 60.0)
   end do
end 

subroutine Init()
use opengl
use olympinc

INTERFACE
SUBROUTINE GETARG(N, BUFFER, STATUS)
INTEGER*2 N
CHARACTER*(*) BUFFER
INTEGER*2, OPTIONAL :: STATUS      
END SUBROUTINE
END INTERFACE

interface
subroutine FillTorus (rc, numc, rt, numt)
!MS$ATTRIBUTES VALUE :: rc
!MS$ATTRIBUTES VALUE :: numc
!MS$ATTRIBUTES VALUE :: rt
!MS$ATTRIBUTES VALUE :: numt
real(4)     rc
integer(4)  numc
real(4)     rt
integer(4)  numt
end subroutine FillTorus

subroutine srand (seed)
!MS$ ATTRIBUTES C, ALIAS : '_srand' :: srand
integer(4)  seed
end subroutine srand    

integer(4) function time (timer)
!MS$ ATTRIBUTES C, ALIAS : '_time' :: time
integer(4)  timer
end function time

end interface


EXTERNAL ReInit
   real(4) base, height
   real(4) aspect, x, y
   integer i
   real(4) top_y  
   real(4) bottom_y 
   real(4) top_z    
   real(4) bottom_z 
   real(4) spacing  
   real(4) lmodel_ambient(4) 
   real(4) lmodel_twoside(1) 
   real(4) lmodel_local(1)    
   real(4) light0_ambient(4)  
   real(4) light0_diffuse(4)  
   real(4) light0_position(4) 
   real(4) light0_specular(4) 
   real(4) bevel_mat_ambient(4)   
   real(4) bevel_mat_shininess(1) 
   real(4) bevel_mat_specular(4)  
   real(4) bevel_mat_diffuse(4)   

   DATA top_y /1.0/, bottom_y /0.0/
   DATA top_z /0.15/, bottom_z /0.69/, spacing /2.5/
   DATA lmodel_ambient        /0.0, 0.0, 0.0, 0.0/
   DATA lmodel_twoside        /GL_FALSE/
   DATA lmodel_local          /GL_FALSE/
   DATA light0_ambient        /0.1, 0.1, 0.1, 1.0/
   DATA light0_diffuse        /1.0, 1.0, 1.0, 0.0/
   DATA light0_position       /0.8660254, 0.5, 1, 0/
   DATA light0_specular       /1.0, 1.0, 1.0, 0.0/
   DATA bevel_mat_ambient     /0.0, 0.0, 0.0, 1.0/
   DATA bevel_mat_shininess   /40.0/
   DATA bevel_mat_specular    /1.0, 1.0, 1.0, 0.0/
   DATA bevel_mat_diffuse     /1.0, 0.0, 0.0, 0.0/

    call srand(time(NULL))
   call ReInit()
   do i = 1, RINGS
      rgb_colors(i,1) = 0
      rgb_colors(i,2) = 0
      rgb_colors(i,3) = 0
   end do

   rgb_colors(BLUERING,3)     = 255
   rgb_colors(REDRING,1)      = 255
   rgb_colors(GREENRING,2)    = 255
   rgb_colors(YELLOWRING,1)   = 255
   rgb_colors(YELLOWRING,2)   = 255
   mapped_colors(BLUERING)    = BLUE
   mapped_colors(REDRING)     = RED
   mapped_colors(GREENRING)   = GREEN
   mapped_colors(YELLOWRING)  = YELLOW
   mapped_colors(BLACKRING)   = BLACK

   dests(BLUERING,1) = -spacing
   dests(BLUERING,2) = top_y
   dests(BLUERING,3) = top_z

   dests(BLACKRING,1) = 0.0
   dests(BLACKRING,2) = top_y
   dests(BLACKRING,3) = top_z

   dests(REDRING,1) = spacing
   dests(REDRING,2) = top_y
   dests(REDRING,3) = top_z

   dests(YELLOWRING,1) = -spacing / 2.0
   dests(YELLOWRING,2) = bottom_y
   dests(YELLOWRING,3) = bottom_z

   dests(GREENRING,1) = spacing / 2.0
   dests(GREENRING,2) = bottom_y
   dests(GREENRING,3) = bottom_z

   base = 2.0
   height = 2.0
   theTorus = fglGenLists(1)
   call fglNewList(theTorus, GL_COMPILE)
   call FillTorus(0.1, 8, 1.0, 25)
   call fglEndList()

   x = real(XSIZE)
   y = real(YSIZE)
   aspect = x / y
   call fglEnable(GL_CULL_FACE)
   call fglCullFace(GL_BACK)
   call fglEnable(GL_DEPTH_TEST)
   call fglClearDepth(DBLE(1.0))

   if (rgbmode) then
      call fglClearColor(0.5, 0.5, 0.5, 0.0)
      call fglLightfv(GL_LIGHT0, GL_AMBIENT, LOC(light0_ambient))
      call fglLightfv(GL_LIGHT0, GL_DIFFUSE, LOC(light0_diffuse))
      call fglLightfv(GL_LIGHT0, GL_SPECULAR, LOC(light0_specular))
      call fglLightfv(GL_LIGHT0, GL_POSITION, LOC(light0_position))
      call fglEnable(GL_LIGHT0)

      call fglLightModelfv(GL_LIGHT_MODEL_LOCAL_VIEWER, LOC(lmodel_local))
      call fglLightModelfv(GL_LIGHT_MODEL_TWO_SIDE, LOC(lmodel_twoside))
      call fglLightModelfv(GL_LIGHT_MODEL_AMBIENT, LOC(lmodel_ambient))
      call fglEnable(GL_LIGHTING)

      call fglMaterialfv(GL_FRONT, GL_AMBIENT, LOC(bevel_mat_ambient))
      call fglMaterialfv(GL_FRONT, GL_SHININESS, LOC(bevel_mat_shininess))
      call fglMaterialfv(GL_FRONT, GL_SPECULAR, LOC(bevel_mat_specular))
      call fglMaterialfv(GL_FRONT, GL_DIFFUSE, LOC(bevel_mat_diffuse))

      call fglColorMaterial(GL_FRONT_AND_BACK, GL_DIFFUSE)
      call fglEnable(GL_COLOR_MATERIAL)
      call fglShadeModel(GL_SMOOTH)

   else 
      call fglClearIndex(BACKGROUND)
      call fglShadeModel(GL_FLAT)
   end if

   call fglMatrixMode(GL_PROJECTION)
   call fgluPerspective(DBLE(45), DBLE(1.33), DBLE(0.1), DBLE(100.0))
   call fglMatrixMode(GL_MODELVIEW)
end 

