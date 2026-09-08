
program cassign

integer, pointer :: carray(:,:)
integer t, s

interface
    subroutine CCreateDescriptor( dp )
    !ms$attributes C, reference, alias:'_CCreateDescriptor' :: CCreateDescriptor
    integer, pointer :: dp(:,:)
    end subroutine
end interface

call CCreateDescriptor( carray )

print *,'C array looks like this from Fortran:'
do t = 1, 10
	do s = 1, 10
		print '(I4,\)', carray(t,s)
	end do
	print *
end do

end program
