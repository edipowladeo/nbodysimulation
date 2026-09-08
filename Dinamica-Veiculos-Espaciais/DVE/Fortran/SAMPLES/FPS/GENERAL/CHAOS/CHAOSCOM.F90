MODULE CHAOSCOM
!******************************************************************************
!*                                                                            *
!*  DESCRIPTION FOR MODULE CHAOSCOM                                           *
!*                                                                            *
!*  THIS MODULE CONTAINS THE VARIABLES THAT ARE USED IN GENERAL TO GENERATE   *
!*  THE CHAOS IMAGES.  IT ALSO CONTAINS DEFAULT VALUES FOR THE VARIOUS        *
!*  VARIABLES.                                                                *
!*                                                                            *
!******************************************************************************


  INTEGER(KIND=4) NUMXPIXELS, NUMYPIXELS, NUMCOLORS, IWASTE, IMINMAX, IIMAGE,&
                  IDIV, ICHAOS, NDIV, INUM, ISTART

  REAL(KIND=4) A, B, C, D, X1, Y1, X1_INP, Y1_INP, ROTMAG, SCALMM, K

  LOGICAL(KIND=4) LROTAT, OUT, LDEMO,LRUNNING

  DATA NUMXPIXELS, NUMYPIXELS, NUMCOLORS /-1, -1, -1/

  DATA A, B, C, D /-1.66706520E+00, 0.9500E+00, 0.15290E+00, 0.87310E+00/

  DATA X1_INP, Y1_INP /0.01060E+00, -0.01020E+00/

  DATA IWASTE /10000/
   
  DATA IMINMAX /10000/

  DATA IIMAGE /20000000/

  DATA LROTAT /.FALSE./

  DATA ROTMAG /1.00E+00/

  DATA SCALMM /1.100E+00/

  DATA IDIV /1/

  DATA ICHAOS /3/

  DATA LRUNNING /.FALSE./

END MODULE CHAOSCOM