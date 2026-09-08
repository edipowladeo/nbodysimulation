
program fassign

use descript

integer, pointer :: dp(:,:)
integer, target :: farray(10,10)
integer t, s

interface
    subroutine CUseDescriptor( dp )
    !ms$attributes C, alias:'_CUseDescriptor' :: CUseDescriptor
    integer :: dp(1,1)
    end subroutine
end interface

call DescriptorAssign( DescriptorLoc(dp), loc(farray(1,1)), 4, &
		       (/ DAssign( 1, 10, 1, 10 ), DAssign( 1, 10, 1, 10 ) /), &
		       DescriptRowOrder )

print *,'Fortran array looks like this from Fortran:'
do t = 1, 10
	do s = 1, 10
		dp( t, s ) = (t-1)*10 + (s-1)
		print '(I4,\)', dp(t,s)
	end do
	print *
end do
print *
			
call CUseDescriptor( farray )

end program
