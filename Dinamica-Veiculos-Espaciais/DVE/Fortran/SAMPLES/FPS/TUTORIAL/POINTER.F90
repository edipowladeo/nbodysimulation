!     POINTER.F90    Allocating and Deallocating Pointer and Targets

      REAL, POINTER :: arrow (:)
      REAL, ALLOCATABLE, TARGET :: bullseye (:,:)

!     The following statement associates the pointer with an unused 
!     block of memory.
      ALLOCATE (arrow (1:8), STAT = ierr)
      IF (ierr.eq.0) WRITE (*,'(/1x,a)') 'ARROW allocated'
      arrow = 5.
      WRITE (*,'(1x,8f8.0/)') arrow

      ALLOCATE (bullseye (1:8,3), STAT = ierr)
      IF (ierr.eq.0) WRITE (*,*) 'BULLSEYE allocated'
      bullseye = 1.
      bullseye (1:8:2,2) = 10.
      WRITE (*,'(1x,8f8.0)') bullseye
      
!     The following association breaks the association with the first
!     target, which being unnamed and unassociated with other pointers,
!     becomes lost. ARROW acquires a new shape.
      arrow => bullseye (2:7,2)
      WRITE (*,'(/1x,a)') 'ARROW is repointed & resized, all the 5s are lost'
      WRITE (*,'(1x,8f8.0)') arrow

      NULLIFY (arrow)
      IF (.NOT.ASSOCIATED(arrow)) WRITE (*,'(/a/)') ' ARROW is not pointed'

      DEALLOCATE (bullseye, STAT = ierr)
      IF (ierr.eq.0) WRITE (*,*) 'Deallocation successful.'
      END
