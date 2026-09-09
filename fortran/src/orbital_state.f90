module orbital_state
  implicit none
  private
  public :: elements_to_relative_state
contains
  ! Relative equatorial state; angles in degrees and normalized lengths/mu.
  ! Retain the legacy expressions and order, including the speed diagnostic.
  pure subroutine elements_to_relative_state(an,e,i,om,w,f,mu,p,radius,speed,x,y,z,vx,vy,vz)
    double precision, intent(in) :: an,e,i,om,w,f,mu
    double precision, intent(out) :: p,radius,speed,x,y,z,vx,vy,vz
          p    =  an*(1-(e**2))
          radius   =  p/(1+e*Dcosd(f))
          speed   =  Dsqrt(mu*( (2/radius) - (1/an) ))

          x   =  radius*(Dcosd(om)*Dcosd(w + f)         - Dsind(om)*Dcosd(i)*Dsind(w + f))
          y   =  radius*(Dsind(om)*Dcosd(w + f)         + Dcosd(om)*Dcosd(i)*Dsind(w + f))
          z   =  radius*Dsind(i)*Dsind(w + f)

          vx  = - Dsqrt(mu/p)*( Dcosd(om)*(Dsind(w+f) + e*Dsind(w))        + Dsind(om)*Dcosd(i)*(Dcosd(w+f) + e*Dcosd(w)) )
          vy  = - Dsqrt(mu/p)*( Dsind(om)*(Dsind(w+f) + e*Dsind(w))        - Dcosd(om)*Dcosd(i)*(Dcosd(w+f) + e*Dcosd(w)) )
          vz  =   Dsqrt(mu/p)*( Dsind(i)*(Dcosd(w+f) + e*Dcosd(w)))

  end subroutine
end module
