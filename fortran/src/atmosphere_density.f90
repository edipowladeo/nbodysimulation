module atmosphere_density
  implicit none
  private
  public :: us76_density
contains
  ! Legacy US76 density for altitude h in km. R is the caller's effective
  ! denominator (Arrasto passes geocentric radius in m, not the gas constant).
  ! Outside [0,1000] km, preserve de without assigning a fallback.
  pure subroutine us76_density(h,R,de)
    double precision, intent(in) :: h,R
    double precision, intent(inout) :: de
    double precision :: TMo,P,A,B,C,D,E
              If((h >= 0).and.(h < 86)) then

                  If((h >= 0).and.(h < 11)) then

                      TMo = 288.15 - 6.5*h

                      P   = 101325.0*(( 288.15/(288.15 - 6.5*h) )**(-5.255876923))

                  Else if((h >= 11).and.(h < 20)) then

                      TMo = 216.65

                      P   = 22632.06*(Dexp( -34.1632*(h - 11)/216.65 ))

                  Else if((h >= 20).and.(h < 32)) then

                      TMo = 196.65 + h

                      P   = 5474.889*(( 216.65/(216.65 + (h - 20)) )**(34.1632))

                  Else if((h >= 32).and.(h < 47)) then

                      TMo = 139.05 + 2.8*h

                      P   = 868.0187*(( 228.65/(228.65 + 2.8*(h - 32)) )**(12.20114286))

                  Else if((h >= 47).and.(h < 51)) then

                      TMo = 270.65

                      P   = 110.9063*(Dexp( -34.1632*(h -47)/270.65 ))

                  Else if((h >= 51).and.(h < 71)) then

                      TMo =  413.45 - 2.8*h

                      P   =  66.93887*(( 270.65/(270.65 - 2.8*(h-51)))**(-12.20114286))

                  Else if((h >= 71).and.(h < 86)) then

                      TMo =  356.65 - 2.0*h

                      P   =  3.956420*(( 214.65/(214.65 - 2*(h - 71)) )**(-17.0816))

                  Endif

                  de  = P/(R*TMo)

              Else if((h >= 86).and.(h <= 1000)) then

                  If((h >= 86).and.(h < 91)) then

                      A   =     0.0000000D+00
                      B   =    -3.3226220D-06
                      C   =     9.1114600D-04
                      D   =    -0.2609971D+00
                      E   = 	  5.9446940D+00

                  Else if((h >= 91).and.(h < 100)) then

                      A   =     0.0000000D+00
                      B   =     2.8734050D-05
                      C   =    -0.008492037D+00
                      D   =     0.6541179D+00
                      E   =   -23.6201000D+00

                  Else if((h >= 100).and.(h < 110)) then

                      A   =    -1.2407740D-05
                      B   =     0.005162063D-00
                      C   =    -0.8048342D-00
                      D   =    55.5599600D+00
                      E   = -1443.3380000D+00

                  Else if((h >= 110).and.(h < 120)) then

                      A   =     0.0000000D+00
                      B   =    -8.8541640D-05
                      C   =     0.033732540D+00
                      D   =    -4.3908370D+00
                      E   =   176.5294000D+00

                  Else if((h >= 120).and.(h < 150)) then

                      A   =     3.6617710D-07
                      B   =    -2.1543440D-04
                      C   =     0.048092140D+00
                      D   =    -4.8847440D+00
                      E   =   172.3597000D+00

                  Else if((h >= 150).and.(h < 200)) then

                      A   =     1.9060320D-08
                      B   =    -1.5277990D-05
                      C   =     0.004724294D+00
                      D   =    -0.6992340D+00
                      E   =    20.5092100D+00

                  Else if((h >= 200).and.(h < 300)) then

                      A   =     1.1992820D-09
                      B   =    -1.4510510D-06
                      C   =     6.9104740D-04
                      D   =    -0.1736220D+00
                      E   =    -5.3216440D+00

                  Else if((h >= 300).and.(h < 500)) then

                      A   =     1.1405640D-10
                      B   =    -2.1307560D-07
                      C   =     1.5707620D-04
                      D   =    -0.070292960D+00
                      E   =   -12.8984400D+00

                  Else if((h >= 500).and.(h < 750)) then

                      A   =     8.1056310D-12
                      B   =    -2.3584170D-09
                      C   =    -2.6351100D-06
                      D   =    -0.015626080D+00
                      E   =   -20.0224600D+00

                  Else if((h >= 750).and.(h <= 1000)) then

                      A   =    -3.7011950D-12
                      B   =    -8.6086110D-09
                      C   =     5.1188290D-05
                      D   =    -0.066009980D+00
                      E   =    -6.1376740D+00

                  Endif

                  de  =   Dexp( A*(h**4) + B*(h**3) + C*(h**2) + D*h + E )

              Endif

  end subroutine
end module
