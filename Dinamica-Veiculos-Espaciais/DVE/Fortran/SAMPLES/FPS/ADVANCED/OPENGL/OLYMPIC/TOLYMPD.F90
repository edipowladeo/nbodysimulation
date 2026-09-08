subroutine ReshapeFunction(width, height)
!MS$  ATTRIBUTES STDCALL, ALIAS : '_ReshapeFunction@8' :: ReshapeFunction
use opengl
integer(4) width, height
    call fglViewport(0, 0, width, height)
end 

subroutine Key_SPACE()
!MS$ATTRIBUTES STDCALL, ALIAS : '_Key_SPACE@0' :: Key_SPACE
EXTERNAL ReInit
    call ReInit()
end 

   
