module time_normalization
  implicit none
  private
  public :: days_to_normalized_time, normalized_time_to_days
contains
  pure function days_to_normalized_time(days, period_days, pi) result(time)
    double precision, intent(in) :: days, period_days, pi
    double precision :: time
    time = (2*pi/period_days)*days
  end function

  pure function normalized_time_to_days(time, period_days, pi) result(days)
    double precision, intent(in) :: time, period_days, pi
    double precision :: days
    days = (period_days*time)/(2*pi)
  end function
end module
