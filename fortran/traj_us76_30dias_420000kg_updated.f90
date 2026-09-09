 !	Este programa calcula trajetórias nos problemas de 2, 3 e 4 corpos.  As !     equações de movimento (12 ao todo) estão escritas no sistema de coorde-
          !     nadas cuja origem está no centro de massa do corpo 1 (Sol) em t = 0.HCI
          !     O programa utiliza o integrador RADAU15.O sistema é normalizado seguin-
          !     do os parâmetros da normalização do PR3C (384400km = 1 unidade de  com-
          !     primento,..).
          !     Tem subroutinas para: Potencial Gravitacional, Arrasto (USS76) e PRS.

          !     Otimzado para órbitas terrestres - entradas: elementos orbitais.

          !     Sistemas de coordenadas considerados:
          !     - ECI geocêntrico equatorial inercial, no qual os elementos orbitais os-
          !       culadores são calculadas.
          !     - ECI geocêntrico eclíptico incercial, intermediário para o HCI.
          !     - HCI heliocêntrico eclíptico inercial, no qual as equações de movimento
          !       são resolvidas.
          !     - ECHF geocêntrico fixo à Terra, no qual longitude, latitude, altitude e
          !       velocidade são calculados para alimentar as equações do Potencial Gra-
          !       vitacional e arrasto.
          !     - THC topocêntrico horizontal, no qual  está  localizado um  ponto/radar
          !       observador.
          !-----------------------------------------------------------------------------------
          use us76_dynamics, only: RA15
          use coordinate_transforms, only: translate_to_ecliptic
          use time_normalization, only: days_to_normalized_time, normalized_time_to_days
          Implicit none

          Logical FIXED
          Integer NV,NCLASS,LL,SD,PERT
          Double precision X(12),V(12),TFINAL,PASSO,OUTPUT_STEP,TINST
          Double precision TINTE,TA,UC,TN,PI,FV,G,Ec
          Double precision M1,Mi1         								  !Sol
          Double precision M2,Mi2,a2,e2,i2,W2,OM2,f2,an2,Ro2,Vo2,P2         !Terra
          Double precision M3,Mi3,a3,e3,i3,W3,OM3,f3,an3,Ro3,Vo3,P3,X3o,Y3o,&!Lua
          &                 Z3o,Vx3o,Vy3o,Vz3o
          Double precision M4,Mi4,a4,e4,i4,W4,OM4,f4,an4,Ro4,Vo4,P4,Cd,Ad,B,&!Sonda
          &                 Phi,Lab,Elev,Pe4,X4o,Y4o,Z4o,Vx4o,Vy4o,Vz4o
          !-----------------------------------------------------------------------------------
          !     Início da área de trabalho - inserção das condições iniciais.
          !-----------------------------------------------------------------------------------
          !     Tempo de integração

          TINTE    =   30.000000D+00        !Tempo de voo da nave. Em dias.

          !     Definição do Sistema Dinâmico Considerado através da variável SD:

          !     SD = 1 Problema de 2 corpos Terra-espaçonave (Prob. Kepler) - só Gravitacional;
          !     SD = 2 Problema de 4 corpos Sol-Terra-Lua-espaçonave - só gravitacional;
          !     SD = 3 Problema de 2 corpos Terra-espaçonave + Pot. gravitacional expandido;
          !     SD = 4 Problema de 2 corpos Terra-espaçonave + Arrasto;
          !     SD = 5 Problema de 2 corpos Terra-espaçonave + Pressão de radiação solar;
          !     SD = 6 Problema de 4 corpos Sol-Terra-Lua-espaçonave + todas as perturbações;
          !     SD = 7 Problema Restrito de três corps Terra-Lua-partícula;
          !     SD = 8 Problema Restrito de três corps Sol-Terra-partícula.

          SD   =  6

          !     Característica da espaçonave

          M4   =       420.000000D+03        !Em kg     Massa da nave
          Cd   =         2.200000D+00		   !Coeficiente de arrasto
          Ad   =      2000.000000D+00        !Área do satélite m2
          B    =         1.000000D+00		   !Coeficiente de reflexão [-1,1]

          Elev =        15.000000D+00        !Graus para cálculo da ACI

          !     Características da órbita

          a4   =         6.795741282439726D+03       !Semieixo maior, em km
          e4   =         1.097222956052679D-03	   !Escentricidade
          i4   =         4.266484263349782D+01       !Inclinação r/ equador EVITE i4 = 180
          OM4  =	       7.815079434823826D+01       !Nodo ascendente graus2
          W4   =         6.742905981365995D+01       !Argumento do pericentro graus
          f4   =         3.215091643182321D+02       !Anomalia verdadeira graus

          !     Posição da origem do sistema topocêntrico

          Phi  =        40.000000D+00        !Latitude da origem do TPH
          Lab  =        15.000000D+00        !Longitude da origem do TPH
          !-----------------------------------------------------------------------------------
          !     Fim da área de trabalho
          !-----------------------------------------------------------------------------------
          Ec   =        23.450000D+00        !Ecliptica (graus)
          !-----------------------------------------------------------------------------------
          !     Massas dos Corpos:

          M2      =  5.972400D+24		       !Em kg

          If(SD == 1) then
              NCLASS  = -2
              M1      =  0
              M3      =  0
              PERT    =  0
          Else If(SD == 2) then
              NCLASS  = -2
              M1      =  1.988500D+30			   !kg
              M3      =  7.346000D+22            !kg
              PERT    =  0
          Else If(SD == 3) then
              NCLASS  = -2
              M1      =  0
              M3      =  0
              PERT    =  1
          Else IF(SD == 4) then
              NCLASS  = +2
              M1      =  0
              M3      =  0
              PERT    =  2
          Else If(SD == 5) then
              NCLASS  = -2
              M1      =  0
              M3      =  0
              PERT    =  3
          Else IF(SD == 6) then
              NCLASS  = +2
              M1      =  1.988500D+30			   !kg
              M3      =  7.346000D+22            !kg
              PERT    =  4
          Else IF(SD == 7) then
              NCLASS  = -2
              M1      =  0      			       !kg
              M3      =  7.346000D+22            !kg
              PERT    =  0
          Endif
          !-----------------------------------------------------------------------------------
          !     Corpo 2 (Terra) em relação ao corpo 1 (Sol):

          a2   = 149597870.700000D+00		   !Em km
          e2   =         0.000000D+00
          i2   =         0.000000D+00        !Em graus
          W2   =         0.000000D+00        !Em graus
          OM2  =		   0.000000D+00        !Em graus
          f2   =         0.000000D+00        !Em graus
          !-----------------------------------------------------------------------------------
          !     Corpo 3 (Lua) em relação ao corpo 2 (Terra)

          a3   =    384400.000000D+00        !Em km
          e3   =         0.000000D+00
          i3   =        22.000000D+00        !Graus em relação ao equador
          W3   =         0.000000D+00        !Graus
          OM3  =         0.000000D+00        !Graus
          f3   =       180.000000D+00        !Graus
          !-----------------------------------------------------------------------------------
          !	Parâmetros de Normalização referentes ao sistema Terra-Lua

          UC   =    384400.0000000D+00       !Fator de conv. comprimento
          FV   =         0.9773668D+00	   !Fator de conv. velocidades
          TN   =        27.3216600D+00       !Fator de conv. de tempo (dias)
          G    =         6.6740800D-20       !Constante de Gravitação Universal p/km
          PI   =      DAcos(-1.00D+00)
          !-----------------------------------------------------------------------------------
          !     Normalizando (Atenção, Mi1, Mi2 e Mi3 não podem ser nulos)

          Mi1  = (1.988500D+30)/(M2 + 7.346000D+22)
          Mi2  =             M2/(M2 + 7.346000D+22)
          Mi3  = (7.346000D+22)/(M2 + 7.346000D+22)
          Mi4  =             M4/(M2 + 7.346000D+22)

          an2  = a2/UC
          an3  = a3/UC
          an4  = a4/UC
          !-----------------------------------------------------------------------------------
          !	A partir daqui, distâncias, velocidades e tempos estão normalizados.
          !-----------------------------------------------------------------------------------
          !     Valores relativos ao uso do integrador. Maiores detalhes veja descrição
          !     nos comentários da subrotina RADAU15:

          NV           = 12
          LL           = 12
          TFINAL       = days_to_normalized_time(TINTE,TN,PI)
          PASSO        = 1.0D-6
          OUTPUT_STEP  = 1.0D-6
          FIXED        = .false.    !.true.
          !-----------------------------------------------------------------------------------
          !     Condições iniciais no sistema Inercial heliocêntrico:

          !     Corpo 1 (Sol):

          X(1)  =  0.00000D+00
          X(2)  =  0.00000D+00
          X(3)  =  0.00000D+00

          V(1)  =  0.00000D+00
          V(2)  =  0.00000D+00
          V(3)  =  0.00000D+00
          !-----------------------------------------------------------------------------------
          !     Corpo 2 (Terra):

          P2    =	 an2*(1-(e2**2))
          Ro2   =  P2/(1+e2*Dcosd(f2))
          Vo2   =  Dsqrt(Mi1*( (2/Ro2) - (1/an2) ))

          X(4)  =  X(1) + Ro2*( Dcosd(OM2)*Dcosd(w2 + f2)              - Dsind(OM2)*Dsind(w2 + f2)*Dcosd(i2) )
          X(5)  =  X(2) + Ro2*( Dsind(OM2)*Dcosd(w2 + f2)              + Dcosd(OM2)*Dsind(w2 + f2)*Dcosd(i2) )
          X(6)  =  X(3) + Ro2*( Dsind(w2 + f2)*Dsind(i2) )

          V(4)  =  V(1)        - Dsqrt(Mi1/P2)*( Dcosd(OM2)*(Dsind(w2+f2) + e2*Dsind(w2))+ Dsind(OM2)*Dcosd(i2)*(Dcosd(w2+f2) + e2*Dcosd(w2)) )
          V(5)  =  V(2)        - Dsqrt(Mi1/P2)*( Dsind(OM2)*(Dsind(w2+f2) + e2*Dsind(w2))- Dcosd(OM2)*Dcosd(i2)*(Dcosd(w2+f2) + e2*Dcosd(w2)) )
          V(6)  =  V(3)        + Dsqrt(Mi1/P2)*( Dsind(i2)*(Dcosd(w2+f2) + e2*Dcosd(w2)))
          !-----------------------------------------------------------------------------------
          !     Corpo 3 (MUITO CUIDADO AQUI):

          P3    =  an3*(1-(e3**2))
          Ro3   =  P3/(1+e3*Dcosd(f3))
          Vo3   =  Dsqrt(Mi2*( (2/Ro3) - (1/an3) ))

          X3o   =  Ro3*(Dcosd(OM3)*Dcosd(w3 + f3)         - Dsind(OM3)*Dcosd(i3)*Dsind(w3 + f3))
          Y3o   =  Ro3*(Dsind(OM3)*Dcosd(w3 + f3)         + Dcosd(OM3)*Dcosd(i3)*Dsind(w3 + f3))
          Z3o   =  Ro3*Dsind(i3)*Dsind(w3 + f3)

          Vx3o  = - Dsqrt(Mi2/P3)*( Dcosd(OM3)*(Dsind(w3+f3) + e3*Dsind(w3))        + Dsind(OM3)*Dcosd(i3)*(Dcosd(w3+f3) + e3*Dcosd(w3)) )
          Vy3o  = - Dsqrt(Mi2/P3)*( Dsind(OM3)*(Dsind(w3+f3) + e3*Dsind(w3))        - Dcosd(OM3)*Dcosd(i3)*(Dcosd(w3+f3) + e3*Dcosd(w3)) )
          Vz3o  =   Dsqrt(Mi2/P3)*( Dsind(i3)*(Dcosd(w3+f3) + e3*Dcosd(w3)))

          call translate_to_ecliptic(X(4:6), X3o, Y3o, Z3o, Ec, X(7:9))

          V(7)  =  V(4) + Vx3o
          V(8)  =  V(5) + Vy3o*Dcosd(Ec) + Vz3o*Dsind(Ec)
          V(9)  =  V(9) - Vy3o*Dsind(Ec) + Vz3o*Dcosd(Ec)
          !-----------------------------------------------------------------------------------
          !     Corpo 4 (Sonda):

          P4    =  an4*(1-(e4**2))
          Ro4   =  P4/(1+e4*Dcosd(f4))
          Vo4   =  Dsqrt(Mi2*( (2/Ro4) - (1/an4) ))

          X4o   =  Ro4*(Dcosd(OM4)*Dcosd(w4 + f4)         - Dsind(OM4)*Dcosd(i4)*Dsind(w4 + f4))
          Y4o   =  Ro4*(Dsind(OM4)*Dcosd(w4 + f4)         + Dcosd(OM4)*Dcosd(i4)*Dsind(w4 + f4))
          Z4o   =  Ro4*Dsind(i4)*Dsind(w4 + f4)

          Vx4o  =	- Dsqrt(Mi2/P4)*( Dcosd(OM4)*(Dsind(w4+f4) + e4*Dsind(w4))        + Dsind(OM4)*Dcosd(i4)*(Dcosd(w4+f4) + e4*Dcosd(w4)) )
          Vy4o  =	- Dsqrt(Mi2/P4)*( Dsind(OM4)*(Dsind(w4+f4) + e4*Dsind(w4))        - Dcosd(OM4)*Dcosd(i4)*(Dcosd(w4+f4) + e4*Dcosd(w4)) )
          Vz4o  =   Dsqrt(Mi2/P4)*( Dsind(i4)*(Dcosd(w4+f4) + e4*Dcosd(w4)))

          call translate_to_ecliptic(X(4:6), X4o, Y4o, Z4o, Ec, X(10:12))

          V(10) =  V(4) + Vx4o
          V(11) =  V(5) +	Vy4o*Dcosd(Ec) + Vz4o*Dsind(Ec)
          V(12) =  V(6) -	Vy4o*Dsind(Ec) + Vz4o*Dcosd(Ec)
          !-----------------------------------------------------------------------------------
          Print*, 'Por favor, espere, estou calculando... '

          Pe4  = (2*PI*Dsqrt((an4**3)/Mi2))*(TN/(2*PI))

          Call RA15(X,V,TFINAL,PASSO,LL,NV,NCLASS,OUTPUT_STEP,FIXED,TINST,Cd,Ad,B,Phi,Lab,M1,M2,M3,M4,Elev,PERT)

          TA   = normalized_time_to_days(TINST,TN,PI)

          Print*, '                                     '
          Print*, 'Tempo de estabilidade =',TA,' Dias'

          Stop

          End

