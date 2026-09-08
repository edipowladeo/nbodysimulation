      USE MSFNLS

      INTEGER(4)     i, len(7), infotype(7)
      CHARACTER(10)  str(7)
      LOGICAL(4)     log4

      data infotype / NLS$LI_SDAYNAME1, NLS$LI_SDAYNAME2,               &
     &                NLS$LI_SDAYNAME3, NLS$LI_SDAYNAME4,               &
     &                NLS$LI_SDAYNAME5, NLS$LI_SDAYNAME6,               &
     &                NLS$LI_SDAYNAME7 /

      WRITE(*,*) 'NLSGetLocaleInfo'
      WRITE(*,*) '----------------'

      WRITE(*,*) ' '
      WRITE(*,*) 'Getting the names of the days of the week...'

      DO i = 1, 7
        len(i) = NLSGetLocaleInfo(infotype(i), str(i))
        WRITE(*, 11) 'len/str/hex = ', len(i), str(i), str(i)
      END DO
   11 FORMAT (1X, A, I2, 2X, A10, 2X, '[', Z20, ']')

      WRITE(*,*) ' '
      WRITE(*,*) 'Lexically comparing the names of the days...'

      DO i = 1, 6
        log4 = MBLGE(str(i), str(i+1), NLS$IgnoreCase)
        WRITE(*, 12) 'Is day ', i, ' GT day ', i+1, '?  Answer = ', log4
      END DO
   12 FORMAT (1X, A, I1, A, I1, A, L1)

      WRITE(*,*) ' '
      WRITE(*,*) 'Done.'
      END

