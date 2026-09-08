      module name_ssn
      type ssn_key
          character (len = 9)::ssn
          character (len = 20)::lname
          character (len = 20)::fname
      end type ssn_key   
      character (len = 40)::full_name
      character (len = 40)::sort_name
      type (ssn_key) :: file_key
      character (len = 1), private :: SN
      character (len = 20) :: in_lastn
      character (len = 20) :: in_firstn
      character (len = 9) :: in_ssn
      character (len = 80)::msg
      integer, private :: J,K
!      
      contains
      subroutine check_ssn (ssn, errmsg)
      character (len = 9) :: ssn
      character (len = 80)::errmsg
          errmsg = ' '
          do j = 1,9
            SN = ssn(j:j)
              K = ichar(SN)
              select case (K)
                  case (48:57)
                      errmsg = ' '
                  case default
                      errmsg = 'Invalid social security number'
                      exit
              end select
           end do
           if (errmsg .NE. ' ') print *, errmsg
      end subroutine check_ssn
      end module name_ssn

