module us76_dynamics
  implicit none
  private
  public :: RA15, Output, Force, PotGrav, Arrasto, PRS
contains
          Subroutine Output(X,V,TM,Phi,Lab,Elev)

              Implicit None
              intent(in) :: X,V,TM,Phi,Lab,Elev

              Double precision X(12),V(12),TM,PI,UC,FV,TN,G,TA,TB,Lab,Phi,Phia
              Double precision M2,Mi2,M3,EC,Rem,OME,WE
              Double precision X24,Y24,Z24,R24,Vx24,Vy24,Vz24,V24,X24i,Y24i,&
              &                 Z24i, R24i, Vx24i,Vy24i,Vz24i,V24i, En24,a24,&
              &                 Hx24,Hy24,Hz24,H24,i24,OM24,W24,N24,C24,Ex24,&
              &                 Ey24,Ez24,E24,f24,REV24,Arg24,Ra24,MM24,X23i,&
              &                 Y23i,Z23i,Rp24,Rap24,Elev,IAA,LAN,A24i
              Double precision XE,YE,ZE,VxE,VyE,VzE,RE,X2,Y2,Z2,Vx2,Vy2,Vz2,X1N,&
              &                 Y1N,Z1N, Vx1N,Vy1N,Vz1N, X1S,Y1S,Z1S, Vx1S, Vy1S,&
              &                 Vz1S,XT,YT,ZT,VxT,VyT,VzT,RT,VT,TET,La,XEs,YEs,&
              &                 ZEs
              !-----------------------------------------------------------------------------------
              !     Dados do sistema devem ser fornecidos  pelo usuário de  acordo  com o
              !     sistema  que está  sendo integrado  e devem ser os  mesmos das outras
              !     unidades do programa.

              M2   =      5.9724000D+24				     !Em kg
              M3   =      7.3460000D+22				     !Em kg
              EC   =     23.4500000D+00                    !Graus
              Rem  =      6.3712000D+03                    !km

              UC   = 384400.0000000D+00                    !Em km
              FV   =      0.9773668D+00					 !Conversor de velociade
              TN   =     27.3216600D+00					 !Conversor de tempo
              G    =      6.6740800D-20					 !Constante Gravitação
              PI   =   DAcos(-1.00D+00)
              !-----------------------------------------------------------------------------------
              !     Normalizando:

              Mi2  = M2/(M2+M3)
              !-----------------------------------------------------------------------------------
              TA   = TM*TN/(2*PI)				             !Dias
              TB   = TA*24								 !Horas
              !-----------------------------------------------------------------------------------
              !     Atenção! Saídas calcualdas para o Sistema ECI - equatorial
              !-----------------------------------------------------------------------------------
              !     Lua (não é necessário)

              X23i =  (X(7) - X(4))*UC
              Y23i = ((X(8) - X(5))*Dcosd(Ec) - (X(9) - X(6))*Dsind(Ec))*UC
              Z23i = ((X(8) - X(5))*Dsind(Ec) + (X(9) - X(6))*Dcosd(Ec))*UC
              !-----------------------------------------------------------------------------------
              !     Órbita da nvae ao redor da Terra (posição, velocidade e elementos orbitais):

              !     Posição e velocidade:

              X24  =  (X(10) - X(4))  		    		                  !Normalizado
              Y24  =  (X(11) - X(5))*Dcosd(Ec) - (X(12) - X(6))*Dsind(Ec)   !     "
              Z24  =  (X(11) - X(5))*Dsind(Ec) + (X(12) - X(6))*Dcosd(Ec)   !     "

              R24  =  Dsqrt( X24**2 + Y24**2 + Z24**2 )	                  !Normalizado

              Vx24 =  (V(10) - V(4))						                  !Normalizado
              Vy24 =  (V(11) - V(5))*Dcosd(Ec) - (V(12) - V(6))*Dsind(Ec)   !     "
              Vz24 =  (V(11) - V(5))*Dsind(Ec) + (V(12) - V(6))*Dcosd(Ec)   !     "

              V24  =  Dsqrt( Vx24**2 + Vy24**2 + Vz24**2 )                  !Normalizado

              X24i =  X24*UC	                                              !km
              Y24i =  Y24*UC							                      !km
              Z24i =  Z24*UC								                  !km

              Vx24i =  Vx24/FV							                  !km/s
              Vy24i =  Vy24/FV							                  !km/s
              Vz24i =  Vz24/FV							                  !km/s

              R24i = R24*UC								                  !km
              A24i = R24i - Rem							                  !km
              V24i = V24/FV								                  !km/s
              !-----------------------------------------------------------------------------------
              !     Energia:

              En24 = ((V24**2)/2) - (Mi2)/R24
              !-----------------------------------------------------------------------------------
              !     Semieixo maior:

              If(En24 == 0) then
                  a24  = 1.0D+00						         !Infinito 1 apenas c/ símbolo
              Else
                  a24  = (-Mi2/(2*En24))*UC  	            	 !km
              Endif
              !-----------------------------------------------------------------------------------
              !     Excentricidade:

              C24  = (V24**2) - Mi2/R24

              Ex24 = (C24*X24-X24*Vx24**2-Y24*Vy24*Vx24-Z24*Vz24*Vx24)/(Mi2)
              Ey24 = (C24*Y24-X24*Vx24*Vy24-Y24*Vy24**2-Z24*Vz24*Vy24)/(Mi2)
              Ez24 = (C24*Z24-X24*Vx24*Vz24-Y24*Vy24*Vz24-Z24*Vz24**2)/(Mi2)

              E24  = Dsqrt(Ex24**2 + Ey24**2 + Ez24**2)
              !-----------------------------------------------------------------------------------
              !     Momento Angular:

              Hx24  = Y24*Vz24 - Z24*Vy24
              Hy24  = Z24*Vx24 - X24*Vz24
              Hz24  = X24*Vy24 - Y24*Vx24

              H24   = Dsqrt( Hx24**2 + Hy24**2 + Hz24**2 )
              !-----------------------------------------------------------------------------------
              !     Inclinação:

              i24    = Dacosd(Hz24/H24)
              !-----------------------------------------------------------------------------------
              !     Ascensão Reta do nodo ascendente:

              N24   = Dsqrt((-Hy24)**2 + Hx24**2)

              If(Hx24 >= 0) then

                  If(N24 >= 1.0D-9) then

                      OM24  = Dacosd(-Hy24/N24)                                     !Graus

                  Else

                      OM24  = 0

                  Endif

              Else if(Hx24 < 0) then

                  If(N24 >= 1.0D-9) then

                      OM24  = 360 - Dacosd(-Hy24/N24)			                 	  !Graus

                  Else

                      OM24  = 0

                  Endif

              Endif
              !-----------------------------------------------------------------------------------
              !     Argumento do pericentro (graus):

              If(abs(E24) <= 1.0D-9) then

                  W24  = 0

              Else if(Ez24 >= 0) then

                  Ra24 = (Ex24*(-Hy24) + Ey24*(Hx24))/(N24*E24)

                  If(Ra24 > 1) then

                      W24  = 0

                  Else If(Ra24 < -1) then

                      W24  = 180

                  Else If(abs(Ra24) <= 1) then

                      W24  = DAcosd(Ra24)

                  Endif

              Else if(Ez24 < 0) then

                  Ra24 = (Ex24*(-Hy24) + Ey24*(Hx24))/(N24*E24)

                  If(Ra24 > 1) then

                      W24  = 0

                  Else If(Ra24 < -1) then

                      W24  = 180

                  Else If(abs(Ra24) <= 1) then

                      W24  = 360 - DAcosd(Ra24)

                  Endif

              900	Endif
              !-----------------------------------------------------------------------------------
              !     Anomalia verdadeira:

              If(E24 <= 1.0D-09) then

                  MM24   = Dsqrt((G*M2)/(a24**3))

                  f24    = MM24*(TA*86400)*(180/PI)

                  If(f24 > 360) then

                      f24    = ( (f24/360) - int(f24/360) )*360

                  Else
                      Continue

                      Goto 20

                  Endif

              Else

                  REV24  = X24*Vx24 + Y24*Vy24 + Z24*Vz24

                  Arg24  = (Ex24*X24 + Ey24*Y24 + Ez24*Z24)/(E24*R24)

                  If(REV24 >= 0) then

                      If(abs(Arg24) >= 1) then

                          f24    = 0

                      Else

                          f24    = Dacosd( Arg24 )

                      Endif

                  Else if(REV24 <= 0) then

                      If(abs(Arg24) >= 1) then

                          f24    = 0

                      Else

                          f24    = 360 - Dacosd( Arg24 )

                      Endif

                  Endif

              20	Endif
              !-----------------------------------------------------------------------------------
              !     Raios/distâncias do pericentro - apocentro

              Rp24   = a24*(1 - E24)
              Rap24  = a24*(1 + E24)
              !-----------------------------------------------------------------------------------
              !     Área de cobertura instantânea

              LAN    = 90 - Elev - DAsind( (6371/R24i)*Dcosd(Elev) )
              IAA    = 2.55604187D+08*(1 - Dcosd(LAN))
              !-----------------------------------------------------------------------------------
              !     Transformação de coordenadas

              !     ECI - equatorial para ECEF - equatorial

              WE    =   2*PI/86400                                !rad/s
              OME   =   WE*(TA*86400)					    		!rad

              XE    =   X24i*Dcos(OME) + Y24i*Dsin(OME)
              YE    = - X24i*Dsin(OME) + Y24i*Dcos(OME)
              ZE    =   Z24i

              RE    = Dsqrt(XE**2 + YE**2 + ZE**2)

              VxE   =   Vx24i*Dcos(OME) - X24i*WE*Dsin(OME) + Vy24i*Dsin(OME) + Y24i*WE*Dcos(OME)
              VyE   = - Vx24i*Dsin(OME) - X24i*WE*Dcos(OME) + Vy24i*Dcos(OME) - Y24i*WE*Dsin(OME)
              VzE   =   Vz24i

              !     ECEF para Intermediário 2

              X2    =   XE*Dcosd(Lab) + YE*Dsind(Lab) - Rem*Dcosd(Phi)
              Y2    = - XE*Dsind(Lab) + YE*Dcosd(Lab)
              Z2    =   ZE

              Vx2   =   VxE*Dcosd(Lab) + VyE*Dsind(Lab)
              Vy2   = - VxE*Dsind(Lab) + VyE*Dcosd(Lab)
              Vz2   =   VzE

              !     Intermediário 2 para 1 e topocêntrico (THC)

              If(Phi >= 0) then          !Norte

                  X1N   =   X2
                  Y1N   =   Y2
                  Z1N   =   Z2 - Rem*Dsind(Phi)

                  Vx1N  =   Vx2
                  Vy1N  =   Vy2
                  Vz1N  =   Vz2

                  XT    =   X1N*Dcosd(90 - Phi) - Z1N*Dsind(90 - Phi)
                  YT    =   Y1N
                  ZT    =   X1N*Dsind(90 - Phi) + Z1N*Dcosd(90 - Phi)

                  RT    =   Dsqrt(XT**2 + YT**2 + ZT**2)

                  VxT   =   Vx1N*Dcosd(90 - Phi) - Vz1N*Dsind(90 - Phi)
                  VyT   =   Vy1N
                  VzT   =   Vx1N*Dsind(90 - Phi) + Vz1N*Dcosd(90 - Phi)

                  VT    =   Dsqrt(Vx1N**2 + Vy1N**2 + Vz1N**2)

              Else If(Phi < 0) then      !Sul

                  Phia  =   Dabs(Phi)

                  X1S   =   X2
                  Y1S   =   Y2
                  Z1S   =   Z2 + Rem*Dsind(Phia)

                  Vx1S  =   Vx2
                  Vy1S  =   Vy2
                  Vz1S  =   Vz2

                  XT    =   X1S*Dcosd(90 - Phia) - Z1S*Dsind(90 - Phia)
                  YT    =   Y1S
                  ZT    =   X1S*Dsind(90 - Phia) + Z1S*Dcosd(90 - Phia)

                  RT    =   Dsqrt(XT**2 + YT**2 + ZT**2)

                  VxT   =   Vx1S*Dcosd(90 - Phia) - Vz1S*Dsind(90 - Phia)
                  VyT   =   Vy1S
                  VzT   =   Vx1S*Dsind(90 - Phia) + Vz1S*Dcosd(90 - Phia)

                  VT    =   Dsqrt(Vx1S**2 + Vy1S**2 + Vz1S**2)

              Endif

              !     Latitude e longigute

              TET  =    Dasind(ZE/RE)							!Graus

              If((XE >= 0).and.(YE >= 0)) then

                  La   = Atand(YE/XE)

              Else If((XE <= 0).and.(YE >= 0)) then

                  La   = Atand(YE/XE) + 180

              Else If((XE <= 0).and.(YE < 0)) then

                  La   = Atand(YE/XE) + 180 - 360

              Else If((XE > 0).and.(YE < 0)) then

                  La   = Atand(YE/XE) + 360 - 360                 !Lusitano?

              Endif

              !     Ground track

              XEs  = XE - (RE - Rem)*Dcosd(TET)*Dsind(La)
              YEs  = YE - (RE - Rem)*Dcosd(TET)*Dsind(La)
              ZEs  = ZE - (RE - Rem)*DSind(TET)
              !-----------------------------------------------------------------------------------
              !     Arquivos de saída.

              !     Da Lua e da sonda em relação à Terra:

              Open(10,file='ECI')
              Open(20,file='EOG')
              Open(30,file='V24')
              Open(40,file='Lua')
              Open(50,file='ECEF')
              Open(55,file='GRT')
              Open(60,file='TPH')
              Open(70,file='IAA')

              Write(10,1) X24i,Y24i,Z24i,R24i,TA
              Write(20,5) TA,R24i,V24i,En24,H24,a24,e24,i24,OM24,W24,f24,A24i,Rp24,Rap24,TB
              Write(30,5) TA,R24i,V24i,Vx24i,Vy24i,Vz24i
              Write(40,*) X23i,Y23i,Z23i
              Write(50,1) XEs,YEs,ZEs,TB,TA
              Write(55,*) La,TET,TB
              Write(60,5) XT,YT,ZT,VxT,VyT,VzT,RT,VT,TA
              Write(70,1) TA,TB,La,TET,IAA,LAN
              !-----------------------------------------------------------------------------------

              1	Format(F40.5,1X,F40.5,1X,F40.5,1X,F40.5,1X,F40.5,1X,F40.5)
              5	Format(F30.5,1X,F30.5,1X,F30.5,1X,F30.5,1X,F30.5,1X,&
              &       F30.5,1X,F30.5,1X,F30.5,1X,F30.5,1X,F30.5,1X,&
              &       F30.5,1X,F30.5,1X,F30.5,1X,F30.5,1X,F30.5,1X,F30.5)
              !-----------------------------------------------------------------------------------

              Return

          End

          Subroutine Force(P,V,T,F,Cd,Ad,Be,M1,M2,M3,M4,PERT)
              use time_normalization, only: normalized_time_to_days

              Implicit None
              intent(in) :: P,V,T,Cd,Ad,Be,M1,M2,M3,M4,PERT
              intent(out) :: F

              Integer PERT
              Double precision P(12),V(12),T,F(12),PI,UC,TA,TE,FC,TN
              Double precision M1,Mi1,X1,Y1,Z1,Vx1,Vy1,Vz1
              Double precision M2,Mi2,X2,Y2,Z2,Vx2,Vy2,Vz2,Rem,X12,Y12,Z12
              Double precision M3,Mi3,X3,Y3,Z3,Vx3,Vy3,Vz3,RL,i3,Ec
              Double precision M4,Mi4,X4,Y4,Z4,Vx4,Vy4,Vz4,X14,Y14,Z14
              Double precision X24,Y24,Z24,Xg,Yg,Zg,Vxg,Vyg,Vzg
              Double precision R12,R13,R14,R23,R24,R34, R123, R133,R142,R143,&
              &                 R233,R243,R343, Acx,Acy,Acz, Apx,Apy,Apz, Arx,&
              &                 Ary,Arz,Aqx,Aqy,Aqz,Cd,Ad,Aprx,Apry,Aprz,Be,Ap
              !-----------------------------------------------------------------------------------
              !     Estes dados devem ser fornecidos pelo usuário  de acordo com o  sistema
              !     que está sendo integrado  e devem ser os mesmos  das outras unidades do
              !     programa

              i3   =     23.00000D+00 				     !Em graus
              Ec   =     23.45000D+00                      !Em graus

              PI   =    Acos(-1.00D+00)
              UC   = 384400.00000D+00        			     !Em km
              TN   =     27.32166D+00
              Rem  =   6371.20000D+00/UC                   !Raio da Terra
              RL   =   1738.00000D+00/UC	    		     !Raio da Lua
              !-----------------------------------------------------------------------------------
              FC   =    367.2020000D+00                    !Conv. m/s2 para uc/ut2
              !-----------------------------------------------------------------------------------
              !     Normalizando

              Mi1  = M1/(M2 + 7.3460000D+22)
              Mi2  = M2/(M2 + 7.3460000D+22)
              Mi3  = M3/(M2 + 7.3460000D+22)
              Mi4  = M4/(M2 + 7.3460000D+22)
              !-----------------------------------------------------------------------------------
              !     Posição e velocidade para o corpo 1:

              X1   = P(1)
              Y1   = P(2)
              Z1   = P(3)

              Vx1  = V(1)
              Vy1  = V(2)
              Vz1  = V(3)
              !-----------------------------------------------------------------------------------
              !     Posição e velocidade para o corpo 2:

              X2   = P(4)
              Y2   = P(5)
              Z2   = P(6)

              Vx2  = V(4)
              Vy2  = V(5)
              Vz2  = V(6)
              !-----------------------------------------------------------------------------------
              !     Posição e velocidade para o corpo 3:

              X3   = P(7)
              Y3   = P(8)
              Z3   = P(9)

              Vx3  = V(7)
              Vy3  = V(8)
              Vz3  = V(9)
              !-----------------------------------------------------------------------------------
              !  	Posição e velocidade para o corpo 4:

              X4   = P(10)
              Y4   = P(11)
              Z4   = P(12)

              Vx4  = V(10)
              Vy4  = V(11)
              Vz4  = V(12)
              !-----------------------------------------------------------------------------------
              !     Componentes da posição da partícula no sistema fixo ao corpo 2:

              X24  = X4-X2
              Y24  = Y4-Y2
              Z24  = Z4-Z2
              !-----------------------------------------------------------------------------------
              !     Componentes da posição da partícula no sistema fixo ao corpo 1:

              X12  = X2-X1
              Y12  = Y2-Y1
              Z12  = Z2-Z1

              X14  = X4-X1
              Y14  = Y4-Y1
              Z14  = Z4-Z1
              !-----------------------------------------------------------------------------------
              !     Distâncias entre os corpos:

              R12  = Dsqrt(((X2-X1)**2)+((Y2-Y1)**2)+((Z2-Z1)**2))
              R13  = Dsqrt(((X3-X1)**2)+((Y3-Y1)**2)+((Z3-Z1)**2))
              R14  = Dsqrt(((X4-X1)**2)+((Y4-Y1)**2)+((Z4-Z1)**2))

              R23  = Dsqrt(((X3-X2)**2)+((Y3-Y2)**2)+((Z3-Z2)**2))
              R24  = Dsqrt(((X4-X2)**2)+((Y4-Y2)**2)+((Z4-Z2)**2))

              R34  = Dsqrt(((X4-X3)**2)+((Y4-Y3)**2)+((Z4-Z3)**2))

              R123 = R12*R12*R12
              R133 = R13*R13*R13
              R142 = R14*R14
              R143 = R14*R14*R14
              R233 = R23*R23*R23
              R243 = R24*R24*R24
              R343 = R34*R34*R34
              !-----------------------------------------------------------------------------------
              TA   = normalized_time_to_days(T,TN,PI)					      !Dias
              !-----------------------------------------------------------------------------------
              !     Componentes da posição e velocidade da partícula no sistema geocêntrico
              !     equatorial ECI-equatorial que alimentarão as subroutines:

              Xg   =   X24
              Yg   =   Y24*Dcosd(Ec) - Z24*Dsind(Ec)
              Zg   =   Y24*Dsind(Ec) + Z24*Dcosd(Ec)

              Vxg  =   (V(10)-V(4))
              Vyg  =   (V(11)-V(5))*Dcosd(Ec) - (V(12)-V(6))*Dsind(Ec)
              Vzg  =   (V(11)-V(5))*Dsind(Ec) + (V(12)-V(6))*Dcosd(Ec)
              !-----------------------------------------------------------------------------------
              !     Importante: laços para consideração da(s) perturbação(ões)
              !-----------------------------------------------------------------------------------

              If(PERT == 0) then
                  Goto 5
              Else if(PERT == 1) then
                  Call PotGrav(M2,Xg,Yg,Zg,Vxg,Vyg,Vzg,TA,Acx,Acy,Acz)
              Else if(PERT == 2) then
                  Call Arrasto(Xg,Yg,Zg,Vxg,Vyg,Vzg,TA,Cd,Ad,M4,Arx,Ary,Arz)
              Else if(PERT == 3) then
                  Call PRS(M4,Ad,Be,X12,Y12,Z12,X14,Y14,Z14,Aprx,Apry,Aprz)
              Else if(PERT == 4) then
                  Call PotGrav(M2,Xg,Yg,Zg,Vxg,Vyg,Vzg,TA,Acx,Acy,Acz)
                  Call Arrasto(Xg,Yg,Zg,Vxg,Vyg,Vzg,TA,Cd,Ad,M4,Arx,Ary,Arz)
                  Call PRS(M4,Ad,Be,X12,Y12,Z12,X14,Y14,Z14,Aprx,Apry,Aprz)
              Endif
              !-----------------------------------------------------------------------------------
              !-----------------------------------------------------------------------------------
              !     ECI equatorial para o ECI

              5  Apx	 =  Acx
              Apy  =  Acy*Dcosd(Ec) + Acz*Dsind(Ec)
              Apz  = -Acy*Dsind(Ec) + Acz*Dcosd(Ec)

              AP   = Dsqrt(Apx**2 + Apy**2 + Apz**2 )

              Aqx	 =  Arx
              Aqy  =  Ary*Dcosd(Ec) + Arz*Dsind(Ec)
              Aqz  = -Ary*Dsind(Ec) + Arz*Dcosd(Ec)
              !-----------------------------------------------------------------------------------
              !     Equações de movimento no sistema inercial  cuja origem se  encontra no
              !     centro de massa dos corpos 1 e 2 (sistema Sol-Terra eem a Lua):

              F(1) = (Mi2*(X2-X1)/R123)+(Mi3*(X3-X1)/R133)+(Mi4*(X4-X1)/R143)
              F(2) = (Mi2*(Y2-Y1)/R123)+(Mi3*(Y3-Y1)/R133)+(Mi4*(Y4-Y1)/R143)
              F(3) = (Mi2*(Z2-Z1)/R123)+(Mi3*(Z3-Z1)/R133)+(Mi4*(Z4-Z1)/R143)

              F(4) = (Mi1*(X1-X2)/R123)+(Mi3*(X3-X2)/R233)+(Mi4*(X4-X2)/R243)
              F(5) = (Mi1*(Y1-Y2)/R123)+(Mi3*(Y3-Y2)/R233)+(Mi4*(Y4-Y2)/R243)
              F(6) = (Mi1*(Z1-Z2)/R123)+(Mi3*(Z3-Z2)/R233)+(Mi4*(Z4-Z2)/R243)

              F(7) = (Mi1*(X1-X3)/R133)+(Mi2*(X2-X3)/R233)+(Mi4*(X4-X3)/R343)
              F(8) = (Mi1*(Y1-Y3)/R133)+(Mi2*(Y2-Y3)/R233)+(Mi4*(Y4-Y3)/R343)
              F(9) = (Mi1*(Z1-Z3)/R133)+(Mi2*(Z2-Z3)/R233)+(Mi4*(Z4-Z3)/R343)

              F(10)= (Mi1*(X1-X4)/R143)+(Mi2*(X2-X4)/R243)+(Mi3*(X3-X4)/R343)+ Aqx + Aprx + Apx
              F(11)= (Mi1*(Y1-Y4)/R143)+(Mi2*(Y2-Y4)/R243)+(Mi3*(Y3-Y4)/R343)+ Aqy + Apry + Apy
              F(12)= (Mi1*(Z1-Z4)/R143)+(Mi2*(Z2-Z4)/R243)+(Mi3*(Z3-Z4)/R343)+ Aqz + Aprz + Apz
              !-----------------------------------------------------------------------------------
              !     Testes de colisão com a Terra e a Lua

              TE   = normalized_time_to_days(T,TN,PI)*24					      !Dias

              If(R24 <= Rem)then
                  Print*,'                                       '
                  Print*,'A nave bateu na Terra em', TE,' Horas'
                  Stop
              Else If(R34 <= RL) then
                  Print*,'                                       '
                  Print*,'A nave bateu na Lua em', TE,' Horas'
                  Stop
              Endif

          End

          Subroutine PotGrav(M2,Xg,Yg,Zg,Vxg,Vyg,Vzg,TA,Acx,Acy,Acz)

              Implicit None
              intent(in) :: M2,Xg,Yg,Zg,Vxg,Vyg,Vzg,TA
              intent(out) :: Acx,Acy,Acz

              Double precision M2,Mip,Xg,Yg,Zg,Vxg,Vyg,Vzg,TA,  AGpx,AGpy,AGpz,Acx,Acy,Acz,Ahx,Ahy,Ahz,Vx,Vy,Vz,ae,UC,FC,FV
              Double precision J2,J3,J4,J5,J6,J7,C22,S22,J22,L22, C31,S31, J31,L31,C32,S32,J32,L32,C33,S33,J33,L33,C42,S42,J42,L42,C44,S44,J44,L44,L
              Double precision X,Y,Z,R,R2,R3,R4,R5,R6,R7,R8,R9,R11,R13,R15,R17
              Double precision AJ2,AJ3,Aj4,Aj5,Aj6,Aj7,AJ22,AJ31,AJ32,AJ33,AJ42,AJ44
              Double precision A2x,A2y,A2z,A3x,A3y,A3z,A4x,A4y,A4z,A5x,A5y,A5z,A6x,A6y,A6z,A7x,A7y,A7z
              Double precision AJ22x,AJ22y,AJ22z,AJ31x,AJ31y,AJ31z,AJ32x,AJ32y,AJ32z,AJ33x,AJ33y,AJ33z,AJ42x,AJ42y,AJ42z,AJ44x,AJ44y,AJ44z,WE,OME,PI,V ,AC1,AC2
              !-----------------------------------------------------------------------------------
              UC    =   384400.000D+00                 !km fator de normalização comprim
              ae    =     6371.200D+03                 !m raio equatorial da Terra médio
              FV   =     0.9773668D+00
              FC    =      367.202D+00                 !Conv. m/s2 para uc/ut2
              Mip   =   (6.674D-11)*M2                 !SI
              PI    =  DAcos(-1.0D+00)
              !-----------------------------------------------------------------------------------
              J2    = 1082.6300000D-06	    	     !Coeficiente J2 s/unidade
              J3 	  =   -2.5321531D-06                 !Coeficiente J3 s/unidade
              J4 	  =   -1.6109876D-06                 !Coeficiente J4 s/unidade
              J5    =   -0.2100000D-06                 !Coeficiente J5 s/unidade
              J6    =    0.6460000D-06                 !Coeficiente J6 s/unidade
              J7    =   -0.3330000D-06                 !Coeficiente J7 s/unidade
              !-----------------------------------------------------------------------------------
              C22   =   1.5747419D-06
              S22   =  -9.0237594D-07
              J22   =   Dsqrt(C22**2 + S22**2)
              L22   =   (1/2)*DAtand(S22/C22)

              C31   =   2.9146736D-06
              S31   =   2.7095717D-07
              J31   =   Dsqrt(C31**2 + S31**2)
              L31   =         DAtand(S31/C31)

              C32   =   3.0968773D-07
              S32   =  -2.1212017D-07
              J32   =   Dsqrt(C32**2 + S32**2)
              L32   =   (1/2)*DAtand(S32/C32)

              C33   =   1.0007879D-07
              S33   =   1.9734562D-07
              J33   =   Dsqrt(C33**2 + S33**2)
              L33   =   (1/3)*DAtand(S33/C33)

              C42   =   7.7809618D-08
              S42   =   1.4663946D-07
              J42   =   Dsqrt(C42**2 + S42**2)
              L42   =   (1/2)*DAtand(S33/C33)

              C44   =  -3.9481643D-09
              S44   =   16.540039D-09
              J44   =   Dsqrt(C44**2 + S44**2)
              L44   =   (1/4)*DAtand(S44/C44)
              !-----------------------------------------------------------------------------------
              !     Posição chega a subroutine no sistema ECI e precisam ser transformada
              !     para o sistema ECEF e, ainda, no sistmea SI.

              WE   =   2*PI/86400                                !rad/s
              OME  =   WE*(TA*86400)					    	   !rad

              X    =   (  Xg*Dcos(OME) + Yg*Dsin(OME) )*UC*1000                !m
              Y    =   (- Xg*Dsin(OME) + Yg*Dcos(OME) )*UC*1000                !m
              Z    =   (  Zg )*UC*1000    					                 !m

              Vx   =	 (  Vxg*Dcos(OME) - Xg*WE*Dsin(OME)+ Vyg*Dsin(OME) + Yg*WE*Dcos(OME) )*1000/FV
              Vy   =   (- Vxg*Dsin(OME) - Xg*WE*Dcos(OME)+ Vyg*Dcos(OME) - Yg*WE*Dsin(OME) )*1000/FV
              Vz   =   (  Vzg )*1000/FV

              R    =   Dsqrt( X**2 +  Y**2 +  Z**2)	                         !m
              V    =	 Dsqrt(Vx**2 + Vy**2 + Vz**2)

              R2   =   R*R
              R3   =   R2*R
              R4   =   R3*R
              R5   =   R4*R
              R6   =   R5*R
              R7   =   R6*R
              R8   =   R7*R
              R9   =   R8*R
              R11  =   R9*R*R
              R13  =   R11*R*R
              R15  =   R13*R*R
              R17  =   R15*R*R
              !-----------------------------------------------------------------------------------
              !     Longitude

              If ( (X > 0).and.(Y > 0) ) then
                  L    = DAtand(Y/X)
              Else If ( (X < 0).and.(Y > 0) ) then
                  L    = DAtand(Y/X) + 180
              Else If ( (X < 0).and.(Y < 0) ) then
                  L    = DAtand(Y/X) + 180
              Else If ( (X > 0).and.(Y < 0) ) then
                  L    = DAtand(Y/X) + 360
              Endif
              !-----------------------------------------------------------------------------------
              !     Aceleração para J2

              AJ2  =  (3*Mip*J2*(ae**2))/2

              A2x  = -AJ2*( (1/R5) - (5*(Z**2)/R7) )*X
              A2y  = -AJ2*( (1/R5) - (5*(Z**2)/R7) )*Y
              A2z  = -AJ2*( (3/R5) - (5*(Z**2)/R7) )*Z

              !     Aceleração para J3

              AJ3  =  (3*Mip*J3*(ae**3)/2)

              A3x  = -AJ3*(    (5*Z/R7) - (35*(Z**3)/(3*R9)) )*X
              A3y  = -AJ3*(    (5*Z/R7) - (35*(Z**3)/(3*R9)) )*Y
              A3z  = -AJ3*( ( (10*Z/R7) - (35*(Z**3)/(3*R9)) )*Z - (1/R5) )

              !     Aceleração para J4

              AJ4  =  (3*Mip*J4*(ae**4)/8)

              A4x  = -AJ4*(  (70*(Z**2)/R9)     - (105*(Z**4)/R11) -  (5/R7) )*X
              A4y  = -AJ4*(  (70*(Z**2)/R9)     - (105*(Z**4)/R11) -  (5/R7) )*Y
              A4z  = -AJ4*( (350*(Z**2)/(3*R9)) - (105*(Z**4)/R11) - (25/R7) )*Z

              !     Aceleração para J5

              AJ5  =  (3*Mip*J5*(ae**5)/8)

              A5x  = -AJ5*(  (210*(Z**3)/R11) - (231*(Z**5)/R13) - (35*Z/R9) )*X
              A5y  = -AJ5*(  (210*(Z**3)/R11) - (231*(Z**5)/R13) - (35*Z/R9) )*Y
              A5z  = -AJ5*(( (315*(Z**3)/R11) - (231*(Z**5)/R13) - (105*Z/R9) )*Z + 5/R7 )

              !     Aceleração para J6

              AJ6  =  (3*Mip*J6*(ae**6)/16)

              A6x  = -AJ6*(  (35/(3*R9)) - (315*(Z**2)/R11) + (1155*(Z**4)/R13)- (1001*(Z**6)/R15) )*X
              A6y  = -AJ6*(  (35/(3*R9)) - (315*(Z**2)/R11) + (1155*(Z**4)/R13)- (1001*(Z**6)/R15) )*Y
              A6z  = -AJ6*( (245/(3*R9)) - (735*(Z**2)/R11) + (1617*(Z**4)/R13)- (1001*(Z**6)/R15) )*Z

              !     Aceleração para J7

              AJ7  =  (3*Mip*J7*(ae**7)/16)

              A7x  = -AJ7*(  (105*Z/R11) - (1155*(Z**3)/R13) + (3003*(Z**5)/R15)- (2145*(Z**7)/R17) )*X
              A7y  = -AJ7*(  (105*Z/R11) - (1155*(Z**3)/R13) + (3003*(Z**5)/R15)- (2145*(Z**7)/R17) )*Y
              A7z  = -AJ7*( ((420*Z/R11) - (2310*(Z**3)/R13) + (4004*(Z**5)/R15)- (2145*(Z**7)/R17) )*Z - (35/(3*R9)) )

              !	Aceleração para J22

              AJ22  =  (3*Mip*J22*(ae**2))

              AJ22x =	-AJ22*( ( (3/R5) - (5*(Z**2)/R7) )*X*Dcosd(2*(L-L22))-2*((1/R3)-((Z**2)/R5))*(Y/(X**2 + Y**2))*Dsind(2*(L-L22)) )
              AJ22y =	-AJ22*( ( (3/R5) - (5*(Z**2)/R7) )*Y*Dcosd(2*(L-L22))-2*((1/R3)-((Z**2)/R5))*(X/(X**2 + Y**2))*Dsind(2*(L-L22)) )
              AJ22z = -AJ22*(   (5/R5) - (5*(Z**2)/R7) )*Z*Dcosd(2*(L-L22))

              !     Aceleração para J31

              AJ31  =  (3*Mip*J31*(ae**3))/2

              AJ31x = -AJ31*( ( (30*(Z**2)/R8) - (4/R6) )*(Dsqrt(1 - (Z**2)/R2))  -( (5*(Z**2)/R6) - (1/R4) )  *( (Z**2)/(R4*Dsqrt(1 - (Z**2)/R2)) )*X*Dcosd(L-L31)  -( (5*(Z**2)/R6) - (1/R4) )*(Dsqrt(1 - (Z**2)/R2))  *( Y/(X**2 + Y**2) )*Dsind(L-L31) )
              AJ31y = -AJ31*( ( (30*(Z**2)/R8) - (4/R6) )*(Dsqrt(1 - (Z**2)/R2))  -( (5*(Z**2)/R6) - (1/R4) )  *( (Z**2)/(R4*Dsqrt(1 - (Z**2)/R2)) )*Y*Dcosd(L-L31)  +( (5*(Z**2)/R6) - (1/R4) )*(Dsqrt(1 - (Z**2)/R2))  *( X/(X**2 + Y**2) )*Dsind(L-L31) )
              AJ31z = -AJ31*( ( (30*(Z**2)/R8) - (14/R6))*(Dsqrt(1 - (Z**2)/R2))  -( (5*(Z**2)/R6) - (1/R4) )  *( ((Z**2)/R4) - (1/R2) )*( Z/(Dsqrt(1 - (Z**2)/R2)) )  *Dcosd(L-L31) )

              !     Aceleração para J32

              AJ32  =  (15*Mip*J32*(ae**3))

              AJ32x = -AJ32*( ( (5*Z/R7) - (7*(Z**3)/R9) )*X*Dcosd(2*(L-L32))  -2*( (Z/R5) - ((Z**3)/R7) )*(Y/(X**2 + Y**2))  *Dsind(2*(L-L32)) )
              AJ32y = -AJ32*( ( (5*Z/R7) - (7*(Z**3)/R9) )*Y*Dcosd(2*(L-L32))  +2*( (Z/R5) - ((Z**3)/R7) )*(X/(X**2 + Y**2))  *Dsind(2*(L-L32)) )
              AJ32z = -AJ32*( ( (8*(Z**2)/R7) - (7*(Z**4)/R9) - (1/R5) )  *Dcosd(2*(L-L32)) )

              !     Aceleração para J33

              AJ33  =  (15*Mip*J33*(ae**3))

              AJ33x =  AJ33*( ( (4*X/R6)*( (1 - (Z**2)/R2)**(1.5) )  -(3*X/R4)*( ((Z**2)/R4)*(Dsqrt(1 - (Z**2)/R2)) ) )   *Dcosd(3*(L-L33))  -(3*Y/R4)*( (1 - (Z**2)/R2)**(1.5) )*(1/(X**2 + Y**2))  *Dsind(3*(L-L33)) )
              AJ33y =  AJ33*( ( (4*Y/R6)*( (1 - (Z**2)/R2)**(1.5) )-(3*Y/R4)*( ((Z**2)/R4)*( Dsqrt(1 - (Z**2)/R2) ) ) )  *Dcosd(3*(L-L33))  -(3*X/R4)*( (1 - (Z**2)/R2)**(1.5) )*(1/(X**2 + Y**2))  *Dsind(3*(L-L33)) )
              AJ33z =  AJ33*( ( (4*Z/R6)*( (1 - (Z**2)/R2)**(1.5) )  +(3*Z/R4)*( Dsqrt(1 - (Z**2)/R2) )*((Z**2)/R4 - 1/(R**2))  *Dcosd(3*(L-L33)) ) )

              !     Aceleração para J42

              AJ42  =  (15*Mip*J42*(ae**4))/2

              AJ42x = -AJ42*( ( 54*(Z**2)/R9 - 63*(Z**4)/R11 + 5/R7 )*X  *Dcosd(2*(L-L42))  +2*( 8*(Z**2)/R7 - 7*(Z**4)/R9 - 1/R5 )*(Y/(X**2 + Y**2))  *Dsind(2*(L-L42)) )
              AJ42y = -AJ42*( ( 54*(Z**2)/R9 - 63*(Z**4)/R11 + 5/R7 )*Y  *Dcosd(2*(L-L42))  +2*( 8*(Z**2)/R7 - 7*(Z**4)/R11 - 1/R5 )*(X/(X**2 + Y**2))  *Dsind(2*(L-L42)) )
              AJ42z = -AJ42*( ( 82*(Z**2)/R9 - 63*(Z**4)/R11 + 21/R7 )*Z  *Dcosd(2*(L-L42)) )

              !     Aceleração para J44

              AJ44  = (105*Mip*J44*(ae**4))

              AJ44x = -AJ44*( ( (5*X/R7)*( (1 - (Z**2)/R2)**2 )  -(4*X*(Z**2)/R9)*(1 - (Z**2)/R2) )*Dcosd(4*(L-L44))  -(4/R5)*( (1 - (Z**2)/R2)**2 )*(Y/(X**2 + Y**2))  *Dsind(4*(L-L44)) )

              AJ44y = -AJ44*( ( (5*Y/R7)*( (1 - (Z**2)/R2)**2 )  -(4*Y*(Z**2)/R9)*(1 - (Z**2)/R2) )*Dcosd(4*(L-L44))  +(4/R5)*( (1 - (Z**2)/R2)**2 )*(X/(X**2 + Y**2))  *Dsind(4*(L-L44)) )

              AJ44z = -AJ44*( ( (5*Z/R7)*( (1 - (Z**2)/R2)**2 )  -(4*Z/R5)*(1 - (Z**2)/R2)*((Z**2)/R4 - 1/R2) )  *Dcosd(4*(L-L44)) )
              !-----------------------------------------------------------------------------------
              !     Aceleração total

              Ahx   = 0 + A3x + A4x + A5x + A6x + A7x + AJ22x + AJ31x  + AJ32x + AJ33x + AJ42x + AJ44x
              Ahy   = 0 + A3y + A4y + A5y + A6y + A7y + AJ22y + AJ31y  + AJ32y + AJ33y + AJ42y + AJ44y
              Ahz   = 0 + A3z + A4z + A5z + A6z + A7z + AJ22z + AJ31z  + AJ32z + AJ33z + AJ42z + AJ44z

              AC1   = Dsqrt(A2x**2 + A2y**2 + A2z**2)
              AC2   = Dsqrt(Ahx**2 + Ahy**2 + Ahz**2)

              AGpx  = A2x !+ Ahx
              AGpy  = A2y !+ Ahy
              AGpz  = A2z !+ Ahz
              !-----------------------------------------------------------------------------------
              !     Retorno: ECEF para ECI - MUITO CUIDADO AQUI!

              Acx = ( AGpx*Dcos(OME) - AGpy*Dsin(OME)	)*FC
              Acy = ( AGpx*Dsin(OME) + AGpy*Dcos(OME) )*FC
              Acz = ( AGpz )*FC
              !-----------------------------------------------------------------------------------

              Return
          End

          Subroutine Arrasto(Xg,Yg,Zg,Vxg,Vyg,Vzg,TA,Cd,Ad,M4,Arx,Ary,Arz)

              Implicit None
              intent(in) :: Xg,Yg,Zg,Vxg,Vyg,Vzg,TA,Cd,Ad,M4
              intent(out) :: Arx,Ary,Arz

              Double precision Xg,Yg,Zg,Vxg,Vyg,Vzg,V,TA,Cd,Ad,M4,Arx,Ary,Arz,           Ax,Ay,Az,X,Y,Z,Vx,Vy,Vz
              Double precision R,h,Rem,UC,FV,FC,PI,TMo,P,de,A,B,C,D,E,Ac,Deg,WE,           OME
              !-----------------------------------------------------------------------------------
              R   =     287.053D+00                          !J/kgK
              Rem =    6371.200D+00                          !km
              UC  =  384400.000D+00                          !Conversor de comp.
              FV  =       0.9773668D+00		               !Fator de conv. velocidades
              FC  =     367.2020000D+00                      !Conv. m/s2 para uc/ut2
              PI  =  Dacos(-1.0D+00)
              !-----------------------------------------------------------------------------------
              !     Posição chega à subroutine no sistema ECI e precisam ser transformada
              !     para o sistema ECEF e, ainda, no sistmea SI.

              WE   =   2*PI/86400                                !rad/s
              OME  =   WE*(TA*86400)					    	   !rad

              X    =   (  Xg*Dcos(OME) + Yg*Dsin(OME))*UC*1000                 !m
              Y    =   (- Xg*Dsin(OME) + Yg*Dcos(OME))*UC*1000                 !m
              Z    =   (  Zg)*UC*1000    					                     !m

              Vx   =	 (  Vxg*Dcos(OME) - Xg*WE*Dsin(OME)    + Vyg*Dsin(OME) + Yg*WE*Dcos(OME) )*1000/FV
              Vy   =   (- Vxg*Dsin(OME) - Xg*WE*Dcos(OME)    + Vyg*Dcos(OME) - Yg*WE*Dsin(OME) )*1000/FV
              Vz   =   (  Vzg)*1000/FV

              R    =   Dsqrt( X**2 +  Y**2 +  Z**2)	                         !m
              V    =	 Dsqrt(Vx**2 + Vy**2 + Vz**2)
              !-----------------------------------------------------------------------------------
              !     US Standard Atmosphere, 0 to 86 km

              h   =   (Dsqrt(X**2 + Y**2 + Z**2)/1000 - Rem)

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

              !     Print*, h,de
              Open(11,file='USS76')
              Write(11,*) h, de
              !-----------------------------------------------------------------------------------
              !     CUIDADO COM AS UNIDADES: de [kg/m3]; Ad [m2]; Vg [uc/ut]; M4 [kg]

              Ac  = ((0.5)*(de)*Cd*Ad*(V**2))/(M4)                  !m/s2

              Ax  = - (Ac*Vx/V)                                     !m/s2
              Ay  = - (Ac*Vy/V) 	     				              !m/s2
              Az  = - (Ac*Vz/V)    					              !m/s2

              Deg = Dsqrt( Ax**2 + Ay**2 + Az**2 )                  !m/s2

              !	Print*, Deg
              !-----------------------------------------------------------------------------------
              !     Retorno: ECEF para ECI - MUITO CUIDADO AQUI!

              Arx =  ( Ax*Dcos(OME) - Ay*Dsin(OME) )*FC
              Ary =  ( Ax*Dsin(OME) + Ay*Dcos(OME) )*FC
              Arz =  ( Az )*FC
              !-----------------------------------------------------------------------------------

              10	Return
          End

          Subroutine PRS(M4,Ad,Be,X12,Y12,Z12,X14,Y14,Z14,Aprx,Apry,Aprz)

              Implicit None
              intent(in) :: M4,Ad,Be,X12,Y12,Z12,X14,Y14,Z14
              intent(out) :: Aprx,Apry,Aprz

              Double precision M4,Ad,X12,Y12,Z12,X12i,Y12i,Z12i,X14,Y14,Z14,           X14i,Y14i,Z14i,R12i,R14i,Aprx,Apry,Aprz,Apx,           Apy,Apz,Ap
              Double precision UC,Po,Be,a12,Rp,D,FC,TETmax,TET,h,Hm,Eps,E
              !-----------------------------------------------------------------------------------
              UC     =    384400.0000D+00             !km fator de normalização compri
              Po     =         4.6000D-06             !N/m2
              a12    = 149597870.7000D+03		        !Semieixo maior órbita Terra (m)
              Rp     =         6.3710D+06             !m
              D      =         1.3927D+09             !m
              FC     =       367.2020D+00             !Conv. m/s2 para uc/ut2
              !-----------------------------------------------------------------------------------
              X12i   =   X12*UC*1000					       !m
              Y12i   =   Y12*UC*1000					       !m
              Z12i   =   Z12*UC*1000					       !m
              R12i   =   Dsqrt(X12i**2 + Y12i**2 + Z12i**2)  !m

              X14i   =   X14*UC*1000				           !m
              Y14i   =   Y14*UC*1000					       !m
              Z14i   =   Z14*UC*1000					       !m
              R14i   =   Dsqrt(X14i**2 + Y14i**2 + Z14i**2)  !m
              !-----------------------------------------------------------------------------------
              TETmax = DAtand(Rp/R12i)
              TET    = DAcosd((X12i*X14i + Y12i*Y14i + Z12i*Z14i)/(R12i*R14i))

              h      = (2*Rp)*R12i/(D - (2*Rp))
              Hm     = R14i*Dcosd(TET)
              Eps    = R14i*Dsind(TET)
              !-----------------------------------------------------------------------------------
              If((Hm > R12i).and.(Hm < (R12i + h))) then
                  If((TETmax > TET).and.(Eps < Rp)) then
                      E = 0
                  Else
                      E = 1
                  Endif
              Endif
              !-----------------------------------------------------------------------------------

              Apx	   = ( E*Po*(1+Be)*(Ad/M4)*((a12/R12i)**2)*(X14i/R14i) )	  !m/s2
              Apy    = ( E*Po*(1+Be)*(Ad/M4)*((a12/R12i)**2)*(Y14i/R14i) )	  !m/s2
              Apz    = ( E*Po*(1+Be)*(Ad/M4)*((a12/R12i)**2)*(Z14i/R14i) )	  !m/s2

              Ap     = Dsqrt(Apx**2 + Apy**2 + Apz**2)						  !m/s2

              !	Print*, Ap

              Aprx   = Apx*FC	                                                  !uc/ut2
              Apry   = Apy*FC                                             	  !uc/ut2
              APrz   = Apz*FC	                                                  !uc/ut2
              !-----------------------------------------------------------------------------------

              Return
          End

          SUBROUTINE RA15(X,V,TF,XL,LL,NV,NCLASS,OS,FIXED,TINST,Cd,Ad,Be,Phi,Lab,M1,M2,M3,M4,Elev,PERT)

          !     Integrator RADAU by E. Everhart, Physics Department,University of Denver
          !     This 15th-order version,called RA15,is written out for faster execution.
          !     y'=F(y,t) is NCLASS=1, y"=F(y,t) is NCLASS= -2, y"=F(y',y,t) is NCLASS=2
          !     TF is t(final)-t(initial). It may  be negative for backward integration.
          !     NV = the number of simultaneous differential equations.
          !     The dimensioning below assumes NV will not be larger than 18.
          !     LL controls sequence size.Thus SS=10**(-LL) controls the size of a term.
          !     A typical LL-value is in the range 6 to 12 for this order 11 program.
          !     However, if LL.LT.0 then XL is the constant sequence size used.
          !     X and V enter as the starting position-velocity vector,and are output as
          !     the final position-velocity vector.
          !     Integration is in double precision. A 64-bit double-word is assumed.

          implicit none
              intent(in) :: TF,LL,NV,NCLASS,OS,FIXED,Cd,Ad,Be,Phi,Lab,M1,M2,M3,M4,Elev,PERT
              intent(inout) :: X,V,XL
              intent(out) :: TINST
          integer :: j, jd, jdm, k, l, la, lb, lc, ld, le, ll, m, n, nclass, ncount, nf, ni, ns, nv, nw
          double precision :: a, b, bd, c, d, dir, e, f1, fj, g, gk, h, half, hv, one, os, out, phi, q, r, s, sr, ss, t, t2, temp, tf, tinst, tm, tp, u, v, w, w1, ww, x, xl, y, z, zero
          INTEGER PERT
          REAL*4 TVAL,PW
          REAL*8 Cd,Ad,Be,Lab,M1,M2,M3,M4,Elev
          DIMENSION X(NV),V(NV),F1(18),FJ(18),C(21),D(21),R(21),Y(18),Z(18),B(7,18),G(7,18),E(7,18),BD(7,18),H(8),W(7),U(7),NW(8)
          LOGICAL NPQ,NSF,NPER,NCL,NES,fixed
          DATA NW/0,0,1,3,6,10,15,21/
          DATA ZERO, HALF, ONE,SR/0.0D0, 0.5D0, 1.0D0,1.4D0/

          !     These H values are the Gauss-Radau spacings, scaled to the range 0 to 1,
          !     for integrating to order 15.

          DATA H/         0.D0, .05626256053692215D0, .18024069173689236D0,.35262471711316964D0, .54715362633055538D0, .73421017721541053D0,.88532094683909577D0, .97752061356128750D0/

          !     The sum of the H-values should be 3.73333333333333333

          NPER=.FALSE.
          NSF=.FALSE.
          NCL=NCLASS.EQ.1
          NPQ=NCLASS.LT.2
          Out=OS

          !     y'=F(y,t)  NCL=.TRUE.   y"=F(y,t)  NCL=.FALSE.  y"=F(y',y,t) NCL=.FALSE.
          !     NCLASS=1   NPQ=.TRUE.   NCLASS= -2 NPQ=.TRUE.   NCLASS= 2    NPQ=.FALSE.
          !     NSF is .FALSE. on starting sequence, otherwise .TRUE.
          !     NPER is .TRUE. only on last sequence of the integration.
          !     NES is .TRUE. only if LL is negative. Then the sequence size is XL.

          DIR=ONE
          IF(TF.LT.ZERO) DIR=-ONE
          NES=LL.LT.0
          XL=DIR*DABS(XL)
          PW=1./9.

          !     Evaluate the constants in the W-, U-, C-, D-, and R-vectors

          DO 14 N=2,8
              WW=N+N*N
              IF(NCL) WW=N
              W(N-1)=ONE/WW
              WW=N
          14  U(N-1)=ONE/WW
          DO 22 K=1,NV
              IF(NCL) V(K)=ZERO
              DO 22 L=1,7
                  BD(L,K)=ZERO
              22  B(L,K)=ZERO
          W1=HALF
          IF(NCL) W1=ONE
          C(1)=-H(2)
          D(1)=H(2)
          R(1)=ONE/(H(3)-H(2))
          LA=1
          LC=1
          DO 73 K=3,7
              LB=LA
              LA=LC+1
              LC=NW(K+1)
              C(LA)=-H(K)*C(LB)
              C(LC)=C(LA-1)-H(K)
              D(LA)=H(2)*D(LB)
              D(LC)=-C(LC)
              R(LA)=ONE/(H(K+1)-H(2))
              R(LC)=ONE/(H(K+1)-H(K))
              IF(K.EQ.3) GO TO 73
              DO 72 L=4,K
                  LD=LA+L-3
                  LE=LB+L-4
                  C(LD)=C(LE)-H(K)*C(LE+1)
                  D(LD)=D(LE)+H(L-1)*D(LE+1)
              72  R(LD)=ONE/(H(K+1)-H(L-1))
          73  CONTINUE
          SS=10.**(-LL)

          !     The  statements above are used only once in an integration to set up the
          !     constants. They use less than a second of execution time. Next set in  a
          !     reasonable estimate to TP based on experience. Same sign as DIR.
          !     An initial first sequence size can be set with XL even with LL positive.

          TP=0.1D0*DIR
          IF(XL.NE.ZERO) TP=XL
          IF(NES) TP=XL
          IF(TP/TF.GT.HALF) TP=HALF*TF
          NCOUNT=0

          !     An * is the symbol for writing on the monitor. The printer is unit 4.
          !     Line 4000 is the starting place of the first sequence.

          4000  NS=0
          NF=0
          NI=6
          TM=ZERO
          CALL FORCE (X, V, ZERO, F1,Cd,Ad,Be,M1,M2,M3,M4,PERT)
          NF=NF+1

          !     Line 722  is begins every sequence after the first. First find new beta-
          !     values from the predicted B-values, following Eq. (2.7) in text.

          722  DO 58 K=1,NV
              G(1,K)=B(1,K)+D(1)*B(2,K)+D(2)*B(3,K)+D(4)*B(4,K)+D( 7)*B(5,K)+D(11)*B(6,K)+D(16)*B(7,K)
              G(2,K)=            B(2,K)+D(3)*B(3,K)+D(5)*B(4,K)+D( 8)*B(5,K)+D(12)*B(6,K)+D(17)*B(7,K)
              G(3,K)=B(3,K)+D(6)*B(4,K)+D( 9)*B(5,K)+D(13)*B(6,K)+D(18)*B(7,K)
              G(4,K)=            B(4,K)+D(10)*B(5,K)+D(14)*B(6,K)+D(19)*B(7,K)
              G(5,K)=                         B(5,K)+D(15)*B(6,K)+D(20)*B(7,K)
              G(6,K)=                                      B(6,K)+D(21)*B(7,K)
          58  G(7,K)=                                                   B(7,K)
          T=TP
          T2=T*T
          IF(NCL) T2=T
          TVAL=DABS(T)

          IF(fixed.and.DABS(DIR*TM-OUT+OS).le.1.d-8) call OUTPUT(X,V,TM,Phi,Lab,Elev)

          IF (fixed.or.(out-os-dir*tm).gt.1.d-8) go to 246
              call OUTPUT(X,V,TM,Phi,Lab,Elev)
              Out=out+os
              246 continue

              !     Loop 175 is 6 iterations on first sequence and two iterations therafter.

              DO 175 M=1,NI

                  !     Loop 174 is for each substep within a sequence.

                  DO 174 J=2,8
                      JD=J-1
                      JDM=J-2
                      S=H(J)
                      Q=S
                      IF(NCL) Q=ONE

                      !     Use Eqs. (2.9) and (2.10) of text to predict positions at each aubstep.
                      !     These collapsed series are broken into two parts because an otherwise
                      !     excellent  compiler could not handle the complicated expression.

                      DO 130 K=1,NV
                          A=W(3)*B(3,K)+S*(W(4)*B(4,K)+S*(W(5)*B(5,K)+S*(W(6)*B(6,K)+S*W(7)*B(7,K))))
                          Y(K)=X(K)+Q*(T*V(K)+T2*S*(F1(K)*W1+S*(W(1)*B(1,K)+S*(W(2)*B(2,K)+S*A))))
                          IF(NPQ) GO TO 130

                          !     Next are calculated the velocity predictors need for general class II.

                          A=U(3)*B(3,K)+S*(U(4)*B(4,K)+S*(U(5)*B(5,K)+S*(U(6)*B(6,K)+S*U(7)*B(7,K))))
                          Z(K)=V(K)+S*T*(F1(K)+S*(U(1)*B(1,K)+S*(U(2)*B(2,K)+S*A)))
                      130  CONTINUE

                      !     Find forces at each substep.

                      CALL FORCE(Y,Z,TM+S*T,FJ,Cd,Ad,Be,M1,M2,M3,M4,PERT)
                      NF=NF+1
                      DO 171 K=1,NV

                          !     Find G-value for the force FJ found at the current substep.This section,
                          !     including the many-branched GOTO, uses Eq. (2.4) of text.

                          TEMP=G(JD,K)
                          GK=(FJ(K)-F1(K))/S
                          GO TO (102,102,103,104,105,106,107,108),J
                          102  G(1,K)=GK
                          GO TO 160
                          103  G(2,K)=(GK-G(1,K))*R(1)
                          GO TO 160
                          104  G(3,K)=((GK-G(1,K))*R(2)-G(2,K))*R(3)
                          GO TO 160
                          105  G(4,K)=(((GK-G(1,K))*R(4)-G(2,K))*R(5)-G(3,K))*R(6)
                          GO TO 160
                          106  G(5,K)=((((GK-G(1,K))*R(7)-G(2,K))*R(8)-G(3,K))*R(9)-G(4,K))*R(10)
                          GO TO 160
                          107  G(6,K)=(((((GK-G(1,K))*R(11)-G(2,K))*R(12)-G(3,K))*R(13)-G(4,K))*R(14)-G(5,K))*R(15)
                          GO TO 160
                          108  G(7,K)=((((((GK-G(1,K))*R(16)-G(2,K))*R(17)-G(3,K))*R(18)-G(4,K))*R(19)-G(5,K))*R(20)-G(6,K))*R(21)

                          !     Upgrade all B-values.

                          160  TEMP=G(JD,K)-TEMP
                          B(JD,K)=B(JD,K)+TEMP
                          !     TEMP is now the improvement on G(JD,K) over its former value.
                          !     Now we upgrade the B-value using this dfference in the one term.
                          !     This section is based on Eq. (2.5).

                          GO TO (171,171,203,204,205,206,207,208),J
                          203  B(1,K)=B(1,K)+C(1)*TEMP
                          GO TO 171
                          204  B(1,K)=B(1,K)+C(2)*TEMP
                          B(2,K)=B(2,K)+C(3)*TEMP
                          GO TO 171
                          205  B(1,K)=B(1,K)+C(4)*TEMP
                          B(2,K)=B(2,K)+C(5)*TEMP
                          B(3,K)=B(3,K)+C(6)*TEMP
                          GO TO 171
                          206  B(1,K)=B(1,K)+C(7)*TEMP
                          B(2,K)=B(2,K)+C(8)*TEMP
                          B(3,K)=B(3,K)+C(9)*TEMP
                          B(4,K)=B(4,K)+C(10)*TEMP
                          GO TO 171
                          207  B(1,K)=B(1,K)+C(11)*TEMP
                          B(2,K)=B(2,K)+C(12)*TEMP
                          B(3,K)=B(3,K)+C(13)*TEMP
                          B(4,K)=B(4,K)+C(14)*TEMP
                          B(5,K)=B(5,K)+C(15)*TEMP
                          GO TO 171
                          208  B(1,K)=B(1,K)+C(16)*TEMP
                          B(2,K)=B(2,K)+C(17)*TEMP
                          B(3,K)=B(3,K)+C(18)*TEMP
                          B(4,K)=B(4,K)+C(19)*TEMP
                          B(5,K)=B(5,K)+C(20)*TEMP
                          B(6,K)=B(6,K)+C(21)*TEMP
                      171  CONTINUE
                  174  CONTINUE
                  IF(NES.OR.M.LT.NI) GO TO 175

                  !     Integration of sequence is over. Next is sequence size control.

                  HV=ZERO
                  DO 635 K=1,NV
                  635  HV=DMAX1(HV,DABS(B(7,K)))
                  HV=HV*W(7)/TVAL**7
              175  CONTINUE
              IF (NSF) GO TO 180
              IF(.NOT.NES) TP=(SS/HV)**PW*DIR
              IF(NES) TP=XL
              IF(NES) GO TO 170
              IF(TP/T.GT.ONE) GO TO 170
              8  FORMAT (A,2X,2I2,2D18.10)
              TP=.8D0*TP
              NCOUNT=NCOUNT+1
              IF(NCOUNT.GT.10) RETURN

              !     Restart  with 0.8x  sequence size if new size called for is smaller than
              !     originally chosen starting sequence size on first sequence.

              GO TO 4000
              170  NSF=.TRUE.

              !     Loop 35 finds new X and V values at end of sequence using Eqs. (2.11),(2.12)

              180  DO 35 K=1,NV
                  X(K)=X(K)+V(K)*T+T2*(F1(K)*W1+B(1,K)*W(1)+B(2,K)*W(2)+B(3,K)*W(3)+B(4,K)*W(4)+B(5,K)*W(5)+B(6,K)*W(6)+B(7,K)*W(7))
                  IF(NCL) GO TO 35
                  V(K)=V(K)+T*(F1(K)+B(1,K)*U(1)+B(2,K)*U(2)+B(3,K)*U(3)+B(4,K)*U(4)+B(5,K)*U(5)+B(6,K)*U(6)+B(7,K)*U(7))
              35  CONTINUE
              TM=TM+T
              NS=NS+1

              !     Return if done.

              IF(.NOT.NPER) GO TO 78
              CALL OUTPUT(X,V,TM,Phi,Lab,Elev)
              TINST=TM
              RETURN

              !     Control on size of next sequence and adjust last sequence to exactly co-
              !     ver the integration span. NPER=.TRUE. set on last sequence.

              78  CALL FORCE (X,V,TM,F1,Cd,Ad,Be,M1,M2,M3,M4,PERT)
              !	TINST=TM
              NF=NF+1
              IF(NES) GO TO 341
              TP=DIR*(SS/HV)**PW
              IF(TP/T.GT.SR) TP=T*SR
              341  IF(NES) TP=XL
              IF(DIR*(TM+TP).LT.DIR*TF-1.D-8) GO TO 66
              TP=TF-TM
              NPER=.TRUE.

              66   IF (.not.fixed.or.DIR*(TM+TP).LT.OUT-1.D-8) GO TO 77
              TP=DIR*OUT-TM
              OUT=OUT+OS

              !     Now predict B-values for next step. The predicted values from the prece-
              !     ding sequence were saved in the E-matrix. Te correction BD  between  the
              !     actual B-values  found  and these predicted values is applied in advance
              !     to the next sequence.The gain in accuracy is significant.Using Eqs(2.13)

              77  Q=TP/T
              DO 39 K=1,NV
                  IF(NS.EQ.1) GO TO 31
                  DO 20 J=1,7
                  20  BD(J,K)=B(J,K)-E(J,K)
                  31  E(1,K)=      Q*(B(1,K)+ 2.D0*B(2,K)+ 3.D0*B(3,K)+4.D0*B(4,K)+ 5.D0*B(5,K)+ 6.D0*B(6,K)+ 7.D0*B(7,K))
                  E(2,K)=                Q**2*(B(2,K)+ 3.D0*B(3,K)+6.D0*B(4,K)+10.D0*B(5,K)+15.D0*B(6,K)+21.D0*B(7,K))
                  E(3,K)=                             Q**3*(B(3,K)+4.D0*B(4,K)+10.D0*B(5,K)+20.D0*B(6,K)+35.D0*B(7,K))
                  E(4,K)=   Q**4*(B(4,K)+ 5.D0*B(5,K)+15.D0*B(6,K)+35.D0*B(7,K))
                  E(5,K)=                Q**5*(B(5,K)+ 6.D0*B(6,K)+21.D0*B(7,K))
                  E(6,K)=                             Q**6*(B(6,K)+ 7.D0*B(7,K))
                  E(7,K)=                                           Q**7*B(7,K)
                  DO 39 L=1,7
                  39  B(L,K)=E(L,K)+BD(L,K)

              !     Two iterations for every sequence after the first.

              NI=2
              GO TO 722

          END

end module us76_dynamics
