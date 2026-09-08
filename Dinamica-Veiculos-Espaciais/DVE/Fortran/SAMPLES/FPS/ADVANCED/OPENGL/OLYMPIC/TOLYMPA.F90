subroutine FillTorus (rc, numc, rt, numt) 
!MS$ATTRIBUTES VALUE :: rc
!MS$ATTRIBUTES VALUE :: numc
!MS$ATTRIBUTES VALUE :: rt
!MS$ATTRIBUTES VALUE :: numt
use opengl
real(4)  rc, rt   
integer(4)  numc, numt
integer(4)  i, j, k
   real(8) s, t
   real(8) x, y, z
   real(8) pi, twopi

   pi = 3.14159265358979323846
   twopi = 2 * pi

   do i = 0, numc-1 
      call fglBegin(GL_QUAD_STRIP)
      do j = 0, numt
         do k = 1, 0, -1
            s = MOD((i + k) , numc) + 0.5
            t = MOD(j , numt)

            x = cos(t*twopi/numt) * cos(s*twopi/numc)
            y = sin(t*twopi/numt) * cos(s*twopi/numc)
            z = sin(s*twopi/numc)
            call fglNormal3f(REAL(x), REAL(y), REAL(z))

            x = (rt + rc * cos(s*twopi/numc)) * cos(t*twopi/numt)
            y = (rt + rc * cos(s*twopi/numc)) * sin(t*twopi/numt)
            z = rc * sin(s*twopi/numc)
            call fglVertex3f(REAL(x), REAL(y), REAL(z))
         end do
      end do
      call fglEnd()
   end do
end 

real(4) function Clamp (iters_left, t)
!MS$ATTRIBUTES VALUE :: iters_left
!MS$ATTRIBUTES VALUE :: t
integer(4)  iters_left
real(4) t
   if (iters_left < 3) then
      Clamp = 0.0
      return 
   end if
   Clamp = (iters_left-2)*t/iters_left
   return
end

