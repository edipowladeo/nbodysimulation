module test_time_normalization
  implicit none
  private
  public :: run_test_time_normalization
contains
subroutine run_test_time_normalization(failures)
  use time_normalization, only: days_to_normalized_time, normalized_time_to_days
  implicit none
  integer, intent(out) :: failures
  double precision :: pi, period, time, day
  integer :: j
  failures = 0
  pi = acos(-1D0)
  period = 27.32166D0
  if (days_to_normalized_time(0D0,period,pi) /= 0D0) failures = failures + 1
  if (normalized_time_to_days(0D0,period,pi) /= 0D0) failures = failures + 1
  time = days_to_normalized_time(period,period,pi)
  if (abs(time-2*pi) > 2D-15) failures = failures + 1
  if (abs(normalized_time_to_days(2*pi,period,pi)-period) > 1D-14) failures = failures + 1
  do j = -30, 30
    day = dble(j)
    time = days_to_normalized_time(day,period,pi)
    if (abs(normalized_time_to_days(time,period,pi)-day) > 1D-14) failures = failures + 1
  end do
  if (failures == 0) print *, 'PASS: time normalization (zero, period, 61 signed round trips)'
end subroutine run_test_time_normalization
end module test_time_normalization
