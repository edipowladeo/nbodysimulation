C	Sample Program : LCINFO 
C
C     This program uses NLS runtimes and show date, time, 
C     currency format, and number format based on language information.
C
C     Also the sorting is done based on language information. This demonstrates 
C     how the string oder is affected.
C
C     DATA.TXT includes the string data sorted. 
C
      program lcinfo
    
      use msfnls
      
	integer(4), parameter :: CHARLEN=50, DIMSIZE=1000
      integer(4) :: rtn, i, j, count, maxLocale
      integer(4) :: DateTime(8)
	type(NLS$EnumLocale),pointer :: Locales(:)
      character(len=CHARLEN) :: tango(DIMSIZE), yn
      character(len=NLS$MaxLanguageLen) :: used(50), lang
      
	character(len=NLS$MaxLanguageLen), allocatable ::xxx(:)
	logical(4) :: notuse, sort
      
      write (*, fmt='(A)', advance='NO')
     *   ' All language on your OS?(y/n)   '
      read *, yn
      if (yn(1:1) .eq. 'y' .or. yn(1:1) .eq. 'Y') then
       
C     All language on OS
      write (*, fmt='(A)', advance='NO')  ' Sorting?(y/n)   '
	read *, yn
      sort = .false.
      if (yn(1:1) .eq. 'y' .or. yn(1:1) .eq. 'Y') sort = .true.

      Locales => NLSEnumLocales()    ! get all Locale information
	maxLocale = ubound(Locales, 1)
	allocate(xxx(maxLocale))
	xxx = Locales%Language
	deallocate(Locales)
      
      count = 1
	notuse = .false.
	used(1) = xxx(1)

	do i=1, maxLocale
        lang = xxx(i)
	  if(lang(1:1) .eq. ' ') cycle
	
        do j=1, count
	    if(lang .eq. used(j)) then
            notuse = .false.
            exit
	    end if
          notuse = .true.
	  end do
	  if (notuse) then
	    count = count+1
	    used(count) = lang
	    notuse = .false.
	  end if

      end do
      deallocate(xxx)

      do i=1, count
	  rtn = NLSSetLocale(used(i))
        if (rtn .eq. 0) call LocaleInfo
	end do

      else
C     Current language
      sort = .true.
      call LocaleInfo
      
	end if
       
C     End Main ---------------------------------------------------------        
      contains

C     LocaleInfo
	subroutine LocaleInfo
      
      character(len=CHARLEN) :: lang
      character*50 country

      character*50 str
	character*8 date
    	character*10 time
	character*5 zone

      integer(4) cp, rtn, tm
    
      call NLSGetLocale(lang, country, cp)   ! get Locale information
	print *, ''
      print *, '======================================================='
      print *, 'Language: ', lang
      print *, 'Country : ', country
      print *, 'CodePage: ', cp

      
	print *, 'Date and Time:'
      call date_and_time(date, time, zone, DateTime)
      call PackTimeQQ(tm, DateTime(1), DateTime(2), DateTime(3),
     * DateTime(5), DateTime(6), DateTime(7))
      rtn = NLSFormatDate(str, tm, NLS$LongDate)
	print *, str
	rtn = NLSFormatTime(str, tm, NLS$Normal)
	print *, str
	print *, ''
      rtn = NLSGetLocaleInfo(NLS$LI_SDAYNAME1, str)
      print *, 'NLS$LI_SDAYNAME1: ', str
      rtn = NLSFormatCurrency(str, '4500640.5', NLS$Normal)
	print *, 'Currency format : ', str
	rtn = NLSFormatNumber(str, '56012453012.0123', NLS$Normal)
	print *, 'Number format   : ', str
      
	if (sort) call Sorting

      end subroutine LocaleInfo

C     Partition      
      subroutine Partition(l, r, c, flag)

      integer(4), intent(in) :: l, r, flag
	integer(4), intent(inout) :: c
      
      integer(4) :: lw, rw
	character(len=50) :: s, w

	s = tango(l)
	rw = r+1
	do 
	  do lw=l+1,r,1
 	    if (MBLGE(s, tango(lw), flag)) go to 10   ! NLS function
        end do
	  lw = lw - 1
10 	  continue
        do
	    rw = rw-1
	    if (MBLLE(s, tango(rw), flag)) exit   ! NLS function
	  end do
	  if (lw .lt. rw) then
          w = tango(lw)
          tango(lw) = tango(rw)
          tango(rw) = w
        end if
	  if (lw .ge. rw) exit
	end do

	tango(l) = tango(rw)
	tango(rw) = s
	c = rw

	end subroutine Partition

C     Quicksort
      recursive subroutine Quicksort(top, bottom, flag)
	integer(4), intent(in) :: top, bottom, flag

	integer(4) :: m


	if (top .lt. bottom) then
	  call Partition(top, bottom, m, flag)
	  call Quicksort(top, m-1, flag)
	  call Quicksort(m+1, bottom, flag)
	end if

	end subroutine Quicksort

C     Sorting
      subroutine Sorting
      integer(4) :: size, flag, i

      flag = NLS$IgnoreCase    ! Ignore case flag
	open (unit=1, err=99, file='data.txt',
     *  action='READ', status='OLD', iostat=rtn)
      read (unit=1, end=100, fmt=101, iostat=rtn)
     *  (tango(size), size=1, DIMSIZE) 
100	continue

101   format(A)

      call Quicksort(1, size-1, flag)
	print *, ''
	print *, 'Sorting------------------------------------------------'
      print 102, (tango(i), i=size-1, 1, -1)
102   format(' ', A)
      close(unit=1)
      return

 99   print *, 'Cannot find data file : DATA.TXT'
      stop

      end subroutine Sorting      

	
	end