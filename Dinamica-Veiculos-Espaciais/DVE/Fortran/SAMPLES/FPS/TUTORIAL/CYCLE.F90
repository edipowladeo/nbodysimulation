!     CYCLE.F90   Demonstrate the CYCLE and EXIT Statements

      INTEGER   i,j,k,n
      PARAMETER (n = 10)    ! Upper limit for loops

      write (*,'(/A, I2)') &
     & '  Controlling loops using CYCLE and EXIT, N = ', n
      write (*,900)

      Loop1: DO i = 1, n
        if (i.gt.3) EXIT Loop1
        write (*,910) i

        Loop2: DO j = 1, n
          if (j.gt.2) CYCLE Loop2
          if (i.eq.2.and.j.gt.1) EXIT Loop2
          write (*,920) j

          Loop3: DO k = 1, n
            if (k.gt.2) CYCLE Loop3
            if (i.eq.1.and.j.gt.1) EXIT Loop2  ! leave both inner loops
            write (*,930) k

          END DO Loop3
        END DO Loop2
      END DO Loop1
      WRITE (*,'(/A)')  '  Loops completed.'

900   FORMAT(/'  Loop:    1st       2nd       3rd')
910   FORMAT(11x, i2)
920   FORMAT(21x, i2)
930   FORMAT(31x, i2)
      END
