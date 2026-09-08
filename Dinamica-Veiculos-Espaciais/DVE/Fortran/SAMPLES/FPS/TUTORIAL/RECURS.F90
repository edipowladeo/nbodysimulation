!    RECURS.F90
!

      i = 0
      CALL Inc (i)
      END

      RECURSIVE SUBROUTINE Inc (i)
      i = i + 1
      CALL Out (i)
      IF (i.LT.20) CALL Inc (i)  ! This also works in OUT
      END SUBROUTINE Inc

      SUBROUTINE Out (i)
      WRITE (*,*) i
      END SUBROUTINE Out
