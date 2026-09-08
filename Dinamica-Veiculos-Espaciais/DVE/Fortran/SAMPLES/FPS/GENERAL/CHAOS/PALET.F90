MODULE PALET
!******************************************************************************
!*                                                                            *
!*  DESCRIPTION FOR MODULE PALET                                              *
!*                                                                            *
!*  THIS MODULE CONTAINS  THE VARIOUS VARIALBES THAT ARE USED IN PALLETT      *
!*  DEFINIATION
!*                                                                            *
!******************************************************************************

  LOGICAL(KIND=4)LCHG, LSEE, LNRED, LNGREEN, LNBLUE

  INTEGER(KIND=4)IRDELAY, IBDELAY, IGDELAY, PAL(256), IBLUE(256),  &
	                 IRED(256), IGREEN(256)

  REAL(KIND=4)RPHS, BPHS, GPHS, RDELTHE, BDELTHE, GDELTHE, RMAX, BMAX, &
             GMAX, REDSTART, REDEND, BLUESTART, BLUEEND, GREENSTART, GREENEND

  DATA LNRED, LNBLUE, LNGREEN /3*.FALSE./
  DATA RMAX, BMAX, GMAX, REDSTART, REDEND, BLUESTART, BLUEEND, GREENSTART, GREENEND  &
       /256., 256., 256., 0., .1, 0., .3, 0., .6/
  DATA RPHS, BPHS, GPHS /0., .1, .4/


END MODULE PALET
