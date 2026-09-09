module drag_acceleration
  implicit none
  private
  public :: drag_acceleration_si
contains
  pure subroutine drag_acceleration_si(de,Cd,Ad,M4,Vx,Vy,Vz,V,Ac,Ax,Ay,Az)
    ! Density [kg/m3], coefficient, area [m2], mass [kg], velocity/speed [m/s].
    ! Outputs are the legacy drag magnitude and ECEF components [m/s2].
    ! V is supplied by the caller; the legacy singularity at V=0 is preserved.
    double precision, intent(in) :: de,Cd,Ad,M4,Vx,Vy,Vz,V
    double precision, intent(out) :: Ac,Ax,Ay,Az

    Ac  = ((0.5)*(de)*Cd*Ad*(V**2))/(M4)

    Ax  = - (Ac*Vx/V)
    Ay  = - (Ac*Vy/V)
    Az  = - (Ac*Vz/V)
  end subroutine drag_acceleration_si
end module drag_acceleration
