module coordinate_transforms
  implicit none
  private
  public :: translate_to_ecliptic
contains
  ! Relative equatorial coordinates -> absolute ecliptic coordinates.
  ! Length units are unchanged; obliquity is in degrees.
  pure subroutine translate_to_ecliptic(origin, x, y, z, obliquity, result)
    double precision, intent(in) :: origin(3), x, y, z, obliquity
    double precision, intent(out) :: result(3)
    ! Preserve the legacy evaluation order, including translation before addition.
    result(1) = origin(1) + x
    result(2) = origin(2) + y*Dcosd(obliquity) + z*Dsind(obliquity)
    result(3) = origin(3) - y*Dsind(obliquity) + z*Dcosd(obliquity)
  end subroutine
end module
