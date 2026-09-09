program tester
  use, intrinsic :: iso_fortran_env, only: error_unit
  use testdrive, only: new_unittest, unittest_type, error_type, check, run_testsuite
  use test_atmosphere_density, only: run_test_atmosphere_density
  use test_coordinate_transforms, only: run_test_coordinate_transforms
  use test_orbital_state, only: run_test_orbital_state
  use test_time_normalization, only: run_test_time_normalization
  implicit none
  integer :: stat
  stat = 0
  call run_testsuite(collect, error_unit, stat)
  if (stat /= 0) stop 1
contains
  subroutine collect(tests)
    type(unittest_type), allocatable, intent(out) :: tests(:)
    tests = [ &
      new_unittest('atmosphere_density', test_atmosphere_density), &
      new_unittest('coordinate_transforms', test_coordinate_transforms), &
      new_unittest('orbital_state', test_orbital_state), &
      new_unittest('time_normalization', test_time_normalization) ]
  end subroutine
  subroutine test_atmosphere_density(error)
    type(error_type), allocatable, intent(out) :: error
    integer :: failures
    call run_test_atmosphere_density(failures)
    call check(error, failures, 0, 'atmosphere_density checks failed')
  end subroutine
  subroutine test_coordinate_transforms(error)
    type(error_type), allocatable, intent(out) :: error
    integer :: failures
    call run_test_coordinate_transforms(failures)
    call check(error, failures, 0, 'coordinate_transforms checks failed')
  end subroutine
  subroutine test_orbital_state(error)
    type(error_type), allocatable, intent(out) :: error
    integer :: failures
    call run_test_orbital_state(failures)
    call check(error, failures, 0, 'orbital_state checks failed')
  end subroutine
  subroutine test_time_normalization(error)
    type(error_type), allocatable, intent(out) :: error
    integer :: failures
    call run_test_time_normalization(failures)
    call check(error, failures, 0, 'time_normalization checks failed')
  end subroutine
end program tester
