program test_time_normalization
  use time_normalization, only: days_to_normalized_time, normalized_time_to_days
  implicit none
  double precision :: pi, period, time, day
  integer :: j
  pi = acos(-1D0)
  period = 27.32166D0
  if (days_to_normalized_time(0D0,period,pi) /= 0D0) stop 1
  if (normalized_time_to_days(0D0,period,pi) /= 0D0) stop 2
  time = days_to_normalized_time(period,period,pi)
  if (abs(time-2*pi) > 2D-15) stop 3
  if (abs(normalized_time_to_days(2*pi,period,pi)-period) > 1D-14) stop 4
  do j = -30, 30
    day = dble(j)
    time = days_to_normalized_time(day,period,pi)
    if (abs(normalized_time_to_days(time,period,pi)-day) > 1D-14) stop 5
  end do
  print *, 'PASS: time normalization (zero, period, 61 signed round trips)'
end program
