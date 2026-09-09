program test_orbital_state
  use orbital_state, only: elements_to_relative_state
  implicit none
  double precision :: p,r,s,x,y,z,vx,vy,vz,h(3),energy

  ! Circular equatorial orbit: radius 4, mu 16, speed 2, at +y.
  call elements_to_relative_state(4D0,0D0,0D0,0D0,0D0,90D0,16D0,p,r,s,x,y,z,vx,vy,vz)
  call check([p,r,s,x,y,z,vx,vy,vz], [4D0,4D0,2D0,0D0,4D0,0D0,-2D0,0D0,0D0],1)

  ! Eccentric equatorial pericenter: a=4, e=.5, mu=12.
  call elements_to_relative_state(4D0,.5D0,0D0,0D0,0D0,0D0,12D0,p,r,s,x,y,z,vx,vy,vz)
  call check([p,r,s,x,y,z,vx,vy,vz], [3D0,2D0,3D0,2D0,0D0,0D0,0D0,3D0,0D0],2)

  ! Polar circular orbit at +z: orbital plane normal is -y.
  call elements_to_relative_state(4D0,0D0,90D0,0D0,0D0,90D0,16D0,p,r,s,x,y,z,vx,vy,vz)
  call check([p,r,s,x,y,z,vx,vy,vz], [4D0,4D0,2D0,0D0,0D0,4D0,-2D0,0D0,0D0],3)

  ! Generic eccentric inclined orbit: independent energy/angular momentum identities.
  call elements_to_relative_state(4D0,.3D0,37D0,53D0,29D0,123D0,16D0,p,r,s,x,y,z,vx,vy,vz)
  h = [y*vz-z*vy,z*vx-x*vz,x*vy-y*vx]
  energy = (vx*vx+vy*vy+vz*vz)/2 - 16D0/sqrt(x*x+y*y+z*z)
  call check([sqrt(x*x+y*y+z*z),sqrt(vx*vx+vy*vy+vz*vz),energy,sum(h*h)], &
             [r,s,-2D0,16D0*4D0*(1-.3D0**2)],4)
  call check(h/sqrt(sum(h*h)), [Dsind(37D0)*Dsind(53D0),-Dsind(37D0)*Dcosd(53D0),Dcosd(37D0)],5)
  print *, 'PASS: orbital state (circular, pericenter, polar, inclined invariants)'
contains
  subroutine check(actual,expected,case_id)
    double precision, intent(in) :: actual(:),expected(:)
    integer, intent(in) :: case_id
    if (any(.not.(abs(actual-expected) <= 1D-13))) then
      print *, 'FAIL: orbital state case ',case_id,actual,expected
      stop 1
    end if
  end subroutine
end program
