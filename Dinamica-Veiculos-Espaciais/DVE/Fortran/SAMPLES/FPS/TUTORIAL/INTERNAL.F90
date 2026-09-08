program INTERNAL
!shows use of internal subroutine and CONTAINS statement
   real a,b,c
   call find
   print *, c
contains
   subroutine find
     write ( *,*) "input two real numbers:"
     read *, a,b
     c = sqrt(a**2 + b**2)
   end subroutine find
end
