PROGRAM key_names
!     input last name, first name, social security number
!     verify SSN to be a number
!     calculate ssn_key (let's pretend it's the key of a DB)
!     print out our information, get verification from user.

use name_ssn, verify => check_ssn

    print *, 'Enter last name'
      read *, in_lastn
      print *, 'Enter first name'
      read *, in_firstn
      msg = 'Social security number OK'
      do while (msg .NE. ' ')
          print *, 'Enter social security number'
          read *, in_ssn
          call verify (in_ssn,msg)
      end do
      full_name = trim(in_firstn)//' '//trim(in_lastn)
      print *, full_name
      file_key%ssn = in_ssn
      file_key%lname = in_lastn
      file_key%fname = in_firstn
      print *, 'Database key is ',file_key
end program key_names

