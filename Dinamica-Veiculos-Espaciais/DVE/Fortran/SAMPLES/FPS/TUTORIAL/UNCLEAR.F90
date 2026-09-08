MODULE UN_MOD
!

CONTAINS
     subroutine dup1(x,y)
     real x,y
     print *, ' Real arguments', x, y
     end subroutine dup1

     subroutine dup2(m,n)
     integer m,n
     print *, ' Integer arguments', m, n
     end subroutine dup2

     character function dup3 (z)
     character(len=2) z
     dup3 = 'String argument '// z
     end function dup3
  
END MODULE

program unclear
!
! demonstrates how to use generic procedure references

USE UN_MOD
INTERFACE DUP
   MODULE PROCEDURE dup1, dup2, dup3
END INTERFACE

real a,b
integer c,d
character (len=2) state

a = 1.5
b = 2.32
c = 5
d = 47
state = 'WA'

call dup(a,b)
call dup(c,d)
print *, dup(state)             !actual output is 'S'only

END

