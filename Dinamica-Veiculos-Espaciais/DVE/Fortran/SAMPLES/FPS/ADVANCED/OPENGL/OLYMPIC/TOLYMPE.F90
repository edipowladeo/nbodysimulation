integer(4) function Args (argc)
!MS$ATTRIBUTES VALUE :: argc
use opengl

use olympinc

INTERFACE
SUBROUTINE GETARG(N, BUFFER, STATUS)
INTEGER*2 N
CHARACTER*(*) BUFFER
INTEGER*2, OPTIONAL :: STATUS      
END SUBROUTINE
END INTERFACE

integer(4)  argc
integer(2) i
character*30   argv

    rgbmode = GL_TRUE
    doubleBuffer = GL_TRUE


    do i = 1, argc-1
      call getarg (i, argv)
      if (VERIFY(argv, "-ci") .eq. 0) then 
         rgbmode = GL_FALSE
      else if (VERIFY(argv, "-rgb") .eq. 0) then              
         rgbmode = GL_TRUE
      else if (VERIFY(argv, "-sb") .eq. 0) then
         doubleBuffer = GL_FALSE
      else if (VERIFY(argv, "-db") .eq. 0)then
         doubleBuffer = GL_TRUE
      else 
         Args = GL_FALSE
         return 
      end if
    end do
    Args = GL_TRUE
end 


real(4) function MyRand()
interface
integer(4) function Random ()
!MS$ATTRIBUTES C, ALIAS : '_rand' :: Random
end function Random
end interface
    MyRand = 10.0 * ( REAL(Random()) / (REAL(#7fff)) - 0.5)
    return 
end 
