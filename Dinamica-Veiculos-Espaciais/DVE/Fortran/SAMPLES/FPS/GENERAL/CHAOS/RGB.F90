INTEGER*4 FUNCTION RGB( R, G, B )
!**********************************************************************
!*
!*  THIS FUNCTION COMBINES THE COLOR COMPONENTS INTO A SINGLE INTEGER
!*  FOR PALETTE GENERATION
!*
!**********************************************************************
  USE MSFLIB
  IMPLICIT NONE

  INTEGER*4 R, G, B

  RGB = RGBTOINTEGER(R, G, B)
  RETURN
END
