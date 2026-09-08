!     WHERE.F90     Example of WHERE statement and construct

      REAL     temp (4,3), pressure (4,3), reduce_temp, inc_pressure
      LOGICAL  raining (4,3)

      temp = 90.
      temp(1:4:2,2:3:2) = 105.    ! does not allow range exceeding dimension
      pressure = 1.1
      pressure(2:4:2,1:3:2) = .9
      raining = .false.
      reduce_temp = 7.
      inc_pressure = 0.3

      write (*,*)  'Before:'
      write (*,900) temp
      write (*,*)
      write (*,900) pressure

!     Statement
      WHERE (temp > 100.0) temp = temp - reduce_temp     

!     Construct
*+(elsewh)
      WHERE (pressure <= 1.0)
        pressure = pressure + inc_pressure
        temp = temp - 5.0
      ELSEWHERE
        raining = .TRUE.
      END WHERE
*-(elsewh)

      write (*,*)  'After:'
      write (*,900) temp
      write (*,*)
      write (*,900) pressure
      write (*,*)
      write (*,910) raining

 900  format (5x,4f9.1)
 910  format (5x,4l9)
      END
