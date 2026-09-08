subroutine DrawScene()
!MS$ATTRIBUTES STDCALL, ALIAS : '_DrawScene@0' :: DrawScene
use opengl
use olympinc
interface
real(4) function Clamp (iters_left, t)
!MS$ATTRIBUTES VALUE :: iters_left
!MS$ATTRIBUTES VALUE :: t

integer(4)  iters_left
real(4)     t
end function Clamp
end interface

   integer(4)  i, j

   do i = 1, RINGS
      if (iters(i)) then
         do j = 1, 3
            offsets(i,j) = Clamp(iters(i), offsets(i,j))
         end do
         angs(i) = Clamp(iters(i), angs(i))
         iters(i) = iters(i)-1
      end if
   end do

   call fglPushMatrix()
   
   call fglClear(IOR(GL_COLOR_BUFFER_BIT,GL_DEPTH_BUFFER_BIT))
   call fgluLookAt(DBLE(0), DBLE(0), DBLE(10), DBLE(0), DBLE(0), DBLE(0), DBLE(0), DBLE(1), DBLE(0))

   do i = 1, RINGS
      if (rgbmode) then
         call fglColor3ubv(LOC(rgb_colors(i,1)))
      else 
         call fglIndexi(mapped_colors(i))
      end if
      call fglPushMatrix()
      call fglTranslatef(dests(i,1)+offsets(i,1), dests(i,2)+offsets(i,2),   &
               dests(i,3)+offsets(i,3))
      call fglRotatef(angs(i), rotAxis(i,1), rotAxis(i,2), rotAxis(i,3))
      call fglCallList(theTorus)
      call fglPopMatrix()
   end do

   call fglPopMatrix()

   call fglFlush()

   if (doubleBuffer) then
      call fauxSwapBuffers()
   end if
end

