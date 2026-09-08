!     POINTER2.F90    Pointing at a Pointer and Target
!MS$FIXEDFORMLINESIZE:80

      REAL, POINTER :: arrow1 (:)
      REAL, POINTER :: arrow2 (:)
      REAL, ALLOCATABLE, TARGET :: bullseye (:)

      ALLOCATE (bullseye (7))
      bullseye = 1.
      bullseye (1:7:2) = 10.
      WRITE (*,'(/1x,a,7f8.0)') 'target ',bullseye
      
      arrow1 => bullseye
      WRITE (*,'(/1x,a,7f8.0)') 'pointer',arrow1

      arrow2 => arrow1
      IF (ASSOCIATED(arrow2)) WRITE (*,'(/a/)') ' ARROW2 is pointed.'
      WRITE (*,'(1x,a,7f8.0)') 'pointer',arrow2

      NULLIFY (arrow2)
      IF (.NOT.ASSOCIATED(arrow2)) WRITE (*,'(/a/)') ' ARROW2 is not pointed.'
      WRITE (*,'( 1x,a,7f8.0)') 'pointer',arrow1
      WRITE (*,'(/1x,a,7f8.0)') 'target ',bullseye

      END
