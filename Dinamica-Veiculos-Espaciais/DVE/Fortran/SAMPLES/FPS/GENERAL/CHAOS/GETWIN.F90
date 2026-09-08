MODULE GETWIN
!******************************************************************************
!*                                                                            *
!*  DESCRIPTION FOR MODULE GETWIN                                             *
!*                                                                            *
!*  THIS MODULE PROVIDES AN INTERFACE TO THE WINDOWS API GETTICKCOUNT.  THIS  *
!*  API IS USED TO GET A CURRENT SYSTEM TIME PARAMETER FOR SOME INTERNAL      *
!*  PROGRAM TIME CALCULATTIONS.                                               *
!*                                                                            *
!******************************************************************************

  INTERFACE 
    INTEGER(KIND=4)FUNCTION GETTICKCOUNT()
      !MS$ATTRIBUTES STDCALL,ALIAS:'_GetTickCount@' :: GETTICKCOUNT
    END
  END INTERFACE
END MODULE GETWIN
