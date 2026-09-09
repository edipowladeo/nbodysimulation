module test_coordinate_transforms
  implicit none
  private
  public :: run_test_coordinate_transforms
contains
subroutine run_test_coordinate_transforms(failures)
  use coordinate_transforms, only: translate_to_ecliptic
  implicit none
  integer, intent(out) :: failures
  double precision :: actual(3), inverse(3), original(3), zero(3)
  failures = 0
  zero = 0D0
  call translate_to_ecliptic([10D0,20D0,30D0], 1D0,2D0,3D0,0D0,actual)
  call check(maxval(abs(actual - [11D0,22D0,33D0])) == 0D0, 'identity and translation')
  call translate_to_ecliptic(zero,1D0,2D0,3D0,90D0,actual)
  call check(maxval(abs(actual - [1D0,3D0,-2D0])) < 1D-14, 'quarter turn and signs')
  original = [1D0,2D0,3D0]
  call translate_to_ecliptic(zero,original(1),original(2),original(3),23.45D0,actual)
  call check(abs(sum(actual**2)-sum(original**2)) < 1D-13, 'norm preservation')
  call translate_to_ecliptic(zero,actual(1),actual(2),actual(3),-23.45D0,inverse)
  call check(maxval(abs(inverse-original)) < 1D-14, 'inverse rotation')
  if (failures == 0) print *, 'PASS: coordinate transformation (4 cases)'
contains
  subroutine check(condition, label)
    logical, intent(in) :: condition
    character(*), intent(in) :: label
    if (.not. condition) then
      print *, 'FAIL: ', label
      failures = failures + 1
    end if
  end subroutine
end subroutine run_test_coordinate_transforms
end module test_coordinate_transforms
