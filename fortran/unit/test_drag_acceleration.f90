module test_drag_acceleration
  use, intrinsic :: ieee_arithmetic, only: ieee_is_finite
  use drag_acceleration, only: drag_acceleration_si
  implicit none
  private
  public :: run_test_drag_acceleration
contains
  subroutine run_test_drag_acceleration(failures)
    integer, intent(out) :: failures
    double precision :: magnitude, acceleration(3), baseline(3), base_magnitude
    double precision, parameter :: velocity(3) = [3D0,-4D0,12D0], speed = 13D0
    failures = 0

    call drag_acceleration_si(2D0,2D0,5D0,10D0,velocity(1),velocity(2),velocity(3), &
                              speed,magnitude,acceleration(1),acceleration(2),acceleration(3))
    ! Unit coefficient in front of speed squared: magnitude=169, components=-13*v.
    if (.not. ieee_is_finite(magnitude) .or. .not. all(ieee_is_finite(acceleration))) failures = failures + 1
    if (abs(magnitude-169D0) > 1D-12) failures = failures + 1
    if (any(abs(acceleration-[-39D0,52D0,-156D0]) > 1D-12)) failures = failures + 1
    if (dot_product(acceleration,velocity) >= 0D0) failures = failures + 1
    if (any(acceleration*velocity >= 0D0)) failures = failures + 1
    baseline = acceleration
    base_magnitude = magnitude

    call drag_acceleration_si(2D0,2D0,10D0,10D0,velocity(1),velocity(2),velocity(3), &
                              speed,magnitude,acceleration(1),acceleration(2),acceleration(3))
    if (abs(magnitude-2*base_magnitude) > 1D-12) failures = failures + 1
    if (.not. ieee_is_finite(magnitude) .or. .not. all(ieee_is_finite(acceleration))) failures = failures + 1
    if (any(abs(acceleration-2*baseline) > 1D-12)) failures = failures + 1
    call drag_acceleration_si(2D0,2D0,5D0,20D0,velocity(1),velocity(2),velocity(3), &
                              speed,magnitude,acceleration(1),acceleration(2),acceleration(3))
    if (abs(magnitude-base_magnitude/2) > 1D-12) failures = failures + 1
    if (.not. ieee_is_finite(magnitude) .or. .not. all(ieee_is_finite(acceleration))) failures = failures + 1
    if (any(abs(acceleration-baseline/2) > 1D-12)) failures = failures + 1

    call drag_acceleration_si(0D0,2D0,5D0,10D0,velocity(1),velocity(2),velocity(3), &
                              speed,magnitude,acceleration(1),acceleration(2),acceleration(3))
    if (magnitude /= 0D0 .or. any(acceleration /= 0D0)) failures = failures + 1
    call drag_acceleration_si(2D0,2D0,0D0,10D0,velocity(1),velocity(2),velocity(3), &
                              speed,magnitude,acceleration(1),acceleration(2),acceleration(3))
    if (magnitude /= 0D0 .or. any(acceleration /= 0D0)) failures = failures + 1
    if (failures == 0) print *, 'PASS: drag acceleration (magnitude, direction, area/mass scaling, zero density/area)'
  end subroutine run_test_drag_acceleration
end module test_drag_acceleration
