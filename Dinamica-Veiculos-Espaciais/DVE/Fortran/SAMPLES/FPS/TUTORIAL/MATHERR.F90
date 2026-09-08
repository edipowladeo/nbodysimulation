SUBROUTINE MATHERRQQ( name, length, info, retcode)
  USE MSFLIB
  INTEGER(2) length, retcode
  CHARACTER(length) name
  RECORD /MTH$E_INFO/ info
  PRINT *, "Entered MATHERRQQ"
  PRINT *, "Failing function is: ", name
  PRINT *, "Error type is: ", info.errcode
  IF ((info.ftype == TY$REAL4 ).OR.(info.ftype == TY$REAL8)) THEN
       PRINT *, "Type: REAL"
       PRINT *, "Enter the desired function result: "
       READ(*,*) info.r8res
       retcode = 1
  ELSE IF ((info.ftype == TY$CMPLX8 ).OR.(info.ftype == TY$CMPLX16)) THEN
       PRINT *, "Type: COMPLEX"
       PRINT *, "Enter the desired function result: "
       READ(*,*) info.c16res
       retcode = 1
  END IF
  END
