!***************************************************************************
!*
!* Fortran 90 Module: MSFNLS.F90
!*
!* This module provides interface descriptions for the routines
!* in the Microsoft Fortran NLS (National Language Support) Library.
!*
!* Copyright (c) 1995  Microsoft Corporation
!*
!***************************************************************************

module msfnls

!ms$objcomment lib:"msfnls.lib"

!****
!**** Error Codes (for all NLS routines)
!****

!* Codes arbitrarily chosen
integer(4), parameter :: NLS$ErrorInvalidLanguage =    -1000000
integer(4), parameter :: NLS$ErrorInvalidCountry =     -1000001
integer(4), parameter :: NLS$ErrorInvalidCodepage =    -1000002
integer(4), parameter :: NLS$ErrorNoConsole =          -1000003

!* Error codes from Win32 APIs
integer(4), parameter :: NLS$ErrorInvalidCharacter =   -1
integer(4), parameter :: NLS$ErrorInsufficientBuffer = -122
integer(4), parameter :: NLS$ErrorInvalidFlags =       -1004
integer(4), parameter :: NLS$ErrorInvalidInput =       -87
integer(4), parameter :: NLS$ErrorNotImplemented =     -120

!****
!**** Locale and Codepage Set and Get Routines
!****

integer(4), parameter :: NLS$CurrentCodepage =            -1
integer(4), parameter :: NLS$WindowsEnvironmentCodepage = -2
integer(4), parameter :: NLS$WindowsLanguageCodepage =    -3
integer(4), parameter :: NLS$ConsoleEnvironmentCodepage = -4
integer(4), parameter :: NLS$ConsoleLanguageCodepage =    -5

interface
  integer(4) function NLSSetLocale( language, country, codepage )
    character(len=*), intent(in) :: language
    character(len=*), intent(in), optional :: country
    integer(4), intent(in), optional :: codepage
  end function

  subroutine NLSGetLocale( language, country, codepage )
    character(len=*), intent(out), optional :: language
    character(len=*), intent(out), optional :: country
    integer(4), intent(out), optional :: codepage
  end subroutine
end interface

!****
!**** Get/Set Environment Codepage
!****

interface
  integer(4) function NLSSetEnvironmentCodepage( codepage, flags )
    integer(4), intent(in) :: codepage
    integer(4), intent(in) :: flags
  end function

  integer(4) function NLSGetEnvironmentCodepage( flags )
    integer(4), intent(in) :: flags
  end function
end interface

!****
!**** String Formatting Routines
!****

integer(4), parameter :: NLS$Normal =         0
integer(4), parameter :: NLS$NoUserOverride = #80000000 

interface
  integer(4) function NLSFormatTime( outstr, intime, flags )
    integer(4), intent(in), optional :: flags, intime
    character(len=*), intent(out) :: outstr
  end function
end interface

integer(4), parameter :: NLS$NoMinutesOrSeconds = #1
integer(4), parameter :: NLS$NoSeconds =          #2
integer(4), parameter :: NLS$NoTimeMarker =       #4
integer(4), parameter :: NLS$Force24HourFormat =  #8

interface
  integer(4) function NLSFormatDate( outstr, intime, flags )
    integer(4), intent(in), optional :: flags, intime
    character(len=*), intent(out) :: outstr
  end function
end interface

integer(4), parameter :: NLS$UseAltCalendar = #4
integer(4), parameter :: NLS$LongDate =       #2
integer(4), parameter :: NLS$ShortDate =      #1

interface
  integer(4) function NLSFormatCurrency( outstr, instr, flags )
    integer(4), intent(in), optional :: flags
    character(len=*), intent(in) :: instr
    character(len=*), intent(out) :: outstr
  end function
end interface

interface
  integer(4) function NLSFormatNumber( outstr, instr, flags )
    integer(4), intent(in), optional :: flags
    character(len=*), intent(in) :: instr
    character(len=*), intent(out) :: outstr 
  end function
end interface

!****
!**** Get Locale Information
!****

interface
  integer(4) function NLSGetLocaleInfo( infotype, outstr )
    integer(4), intent(in) :: infotype
    character(len=*), intent(out) :: outstr 
  end function
end interface

! These are taken directly from the Win32 API equivalent names
integer(4), parameter :: NLS$LI_ILANGUAGE =       #00000001  ! language id 
integer(4), parameter :: NLS$LI_SLANGUAGE =       #00000002  ! localized name of language 
integer(4), parameter :: NLS$LI_SENGLANGUAGE =    #00001001  ! English name of language 
integer(4), parameter :: NLS$LI_SABBREVLANGNAME = #00000003  ! abbreviated language name 
integer(4), parameter :: NLS$LI_SNATIVELANGNAME = #00000004  ! native name of language 
integer(4), parameter :: NLS$LI_ICOUNTRY =        #00000005  ! country code 
integer(4), parameter :: NLS$LI_SCOUNTRY =        #00000006  ! localized name of country 
integer(4), parameter :: NLS$LI_SENGCOUNTRY =     #00001002  ! English name of country 
integer(4), parameter :: NLS$LI_SABBREVCTRYNAME = #00000007  ! abbreviated country name 
integer(4), parameter :: NLS$LI_SNATIVECTRYNAME = #00000008  ! native name of country 
integer(4), parameter :: NLS$LI_IDEFAULTLANGUAGE =#00000009  ! default language id 
integer(4), parameter :: NLS$LI_IDEFAULTCOUNTRY = #0000000A  ! default country code 
integer(4), parameter :: NLS$LI_IDEFAULTCODEPAGE =#0000000B  ! default oem code page 
integer(4), parameter :: NLS$LI_IDEFAULTANSICODEPAGE=#01004  ! default ansi code page 
integer(4), parameter :: NLS$LI_SLIST =           #0000000C  ! list item separator 
integer(4), parameter :: NLS$LI_IMEASURE =        #0000000D  ! 0 = metric, 1 = US 
integer(4), parameter :: NLS$LI_SDECIMAL =        #0000000E  ! decimal separator 
integer(4), parameter :: NLS$LI_STHOUSAND =       #0000000F  ! thousand separator 
integer(4), parameter :: NLS$LI_SGROUPING =       #00000010  ! digit grouping 
integer(4), parameter :: NLS$LI_IDIGITS =         #00000011  ! number of fractional digits 
integer(4), parameter :: NLS$LI_ILZERO =          #00000012  ! leading zeros for decimal 
integer(4), parameter :: NLS$LI_INEGNUMBER =      #00001010  ! negative number mode 
integer(4), parameter :: NLS$LI_SNATIVEDIGITS =   #00000013  ! native ascii 0-9 
integer(4), parameter :: NLS$LI_SCURRENCY =       #00000014  ! local monetary symbol 
integer(4), parameter :: NLS$LI_SINTLSYMBOL =     #00000015  ! intl monetary symbol 
integer(4), parameter :: NLS$LI_SMONDECIMALSEP =  #00000016  ! monetary decimal separator 
integer(4), parameter :: NLS$LI_SMONTHOUSANDSEP = #00000017  ! monetary thousand separator 
integer(4), parameter :: NLS$LI_SMONGROUPING =    #00000018  ! monetary grouping 
integer(4), parameter :: NLS$LI_ICURRDIGITS =     #00000019  ! # local monetary digits 
integer(4), parameter :: NLS$LI_IINTLCURRDIGITS = #0000001A  ! # intl monetary digits 
integer(4), parameter :: NLS$LI_ICURRENCY =       #0000001B  ! positive currency mode 
integer(4), parameter :: NLS$LI_INEGCURR =        #0000001C  ! negative currency mode 
integer(4), parameter :: NLS$LI_SDATE =           #0000001D  ! date separator 
integer(4), parameter :: NLS$LI_STIME =           #0000001E  ! time separator 
integer(4), parameter :: NLS$LI_SSHORTDATE =      #0000001F  ! short date format string 
integer(4), parameter :: NLS$LI_SLONGDATE =       #00000020  ! long date format string 
integer(4), parameter :: NLS$LI_STIMEFORMAT =     #00001003  ! time format string 
integer(4), parameter :: NLS$LI_IDATE =           #00000021  ! short date format ordering 
integer(4), parameter :: NLS$LI_ILDATE =          #00000022  ! long date format ordering 
integer(4), parameter :: NLS$LI_ITIME =           #00000023  ! time format specifier 
integer(4), parameter :: NLS$LI_ITIMEMARKPOSN =   #00001005  ! time marker position 
integer(4), parameter :: NLS$LI_ICENTURY =        #00000024  ! century format specifier (short date 
integer(4), parameter :: NLS$LI_ITLZERO =         #00000025  ! leading zeros in time field 
integer(4), parameter :: NLS$LI_IDAYLZERO =       #00000026  ! leading zeros in day field (short date 
integer(4), parameter :: NLS$LI_IMONLZERO =       #00000027  ! leading zeros in month field (short date 
integer(4), parameter :: NLS$LI_S1159 =           #00000028  ! AM designator 
integer(4), parameter :: NLS$LI_S2359 =           #00000029  ! PM designator 
integer(4), parameter :: NLS$LI_ICALENDARTYPE =   #00001009  ! type of calendar specifier 
integer(4), parameter :: NLS$LI_IOPTIONALCALENDAR=#0000100B  ! additional calendar types specifier 
integer(4), parameter :: NLS$LI_IFIRSTDAYOFWEEK = #0000100C  ! first day of week specifier 
integer(4), parameter :: NLS$LI_IFIRSTWEEKOFYEAR =#0000100D  ! first week of year specifier 
integer(4), parameter :: NLS$LI_SDAYNAME1 =       #0000002A  ! long name for Monday 
integer(4), parameter :: NLS$LI_SDAYNAME2 =       #0000002B  ! long name for Tuesday 
integer(4), parameter :: NLS$LI_SDAYNAME3 =       #0000002C  ! long name for Wednesday 
integer(4), parameter :: NLS$LI_SDAYNAME4 =       #0000002D  ! long name for Thursday 
integer(4), parameter :: NLS$LI_SDAYNAME5 =       #0000002E  ! long name for Friday 
integer(4), parameter :: NLS$LI_SDAYNAME6 =       #0000002F  ! long name for Saturday 
integer(4), parameter :: NLS$LI_SDAYNAME7 =       #00000030  ! long name for Sunday 
integer(4), parameter :: NLS$LI_SABBREVDAYNAME1 = #00000031  ! abbreviated name for Monday 
integer(4), parameter :: NLS$LI_SABBREVDAYNAME2 = #00000032  ! abbreviated name for Tuesday 
integer(4), parameter :: NLS$LI_SABBREVDAYNAME3 = #00000033  ! abbreviated name for Wednesday 
integer(4), parameter :: NLS$LI_SABBREVDAYNAME4 = #00000034  ! abbreviated name for Thursday 
integer(4), parameter :: NLS$LI_SABBREVDAYNAME5 = #00000035  ! abbreviated name for Friday 
integer(4), parameter :: NLS$LI_SABBREVDAYNAME6 = #00000036  ! abbreviated name for Saturday 
integer(4), parameter :: NLS$LI_SABBREVDAYNAME7 = #00000037  ! abbreviated name for Sunday 
integer(4), parameter :: NLS$LI_SMONTHNAME1 =     #00000038  ! long name for January 
integer(4), parameter :: NLS$LI_SMONTHNAME2 =     #00000039  ! long name for February 
integer(4), parameter :: NLS$LI_SMONTHNAME3 =     #0000003A  ! long name for March 
integer(4), parameter :: NLS$LI_SMONTHNAME4 =     #0000003B  ! long name for April 
integer(4), parameter :: NLS$LI_SMONTHNAME5 =     #0000003C  ! long name for May 
integer(4), parameter :: NLS$LI_SMONTHNAME6 =     #0000003D  ! long name for June 
integer(4), parameter :: NLS$LI_SMONTHNAME7 =     #0000003E  ! long name for July 
integer(4), parameter :: NLS$LI_SMONTHNAME8 =     #0000003F  ! long name for August 
integer(4), parameter :: NLS$LI_SMONTHNAME9 =     #00000040  ! long name for September 
integer(4), parameter :: NLS$LI_SMONTHNAME10 =    #00000041  ! long name for October 
integer(4), parameter :: NLS$LI_SMONTHNAME11 =    #00000042  ! long name for November 
integer(4), parameter :: NLS$LI_SMONTHNAME12 =    #00000043  ! long name for December 
integer(4), parameter :: NLS$LI_SMONTHNAME13 =    #0000100E  ! long name for 13th month (if exists) 
integer(4), parameter :: NLS$LI_SABBREVMONTHNAME1 = #000044  ! abbreviated name for January 
integer(4), parameter :: NLS$LI_SABBREVMONTHNAME2 = #000045  ! abbreviated name for February 
integer(4), parameter :: NLS$LI_SABBREVMONTHNAME3 = #000046  ! abbreviated name for March 
integer(4), parameter :: NLS$LI_SABBREVMONTHNAME4 = #000047  ! abbreviated name for April 
integer(4), parameter :: NLS$LI_SABBREVMONTHNAME5 = #000048  ! abbreviated name for May 
integer(4), parameter :: NLS$LI_SABBREVMONTHNAME6 = #000049  ! abbreviated name for June 
integer(4), parameter :: NLS$LI_SABBREVMONTHNAME7 = #00004A  ! abbreviated name for July 
integer(4), parameter :: NLS$LI_SABBREVMONTHNAME8 = #00004B  ! abbreviated name for August 
integer(4), parameter :: NLS$LI_SABBREVMONTHNAME9 = #00004C  ! abbreviated name for September 
integer(4), parameter :: NLS$LI_SABBREVMONTHNAME10 =#00004D  ! abbreviated name for October 
integer(4), parameter :: NLS$LI_SABBREVMONTHNAME11 =#00004E  ! abbreviated name for November 
integer(4), parameter :: NLS$LI_SABBREVMONTHNAME12 =#00004F  ! abbreviated name for December 
integer(4), parameter :: NLS$LI_SABBREVMONTHNAME13 =#00100F  ! abbreviated name for 13th month (if exists)
integer(4), parameter :: NLS$LI_SPOSITIVESIGN =   #00000050  ! positive sign 
integer(4), parameter :: NLS$LI_SNEGATIVESIGN =   #00000051  ! negative sign 
integer(4), parameter :: NLS$LI_IPOSSIGNPOSN =    #00000052  ! positive sign position 
integer(4), parameter :: NLS$LI_INEGSIGNPOSN =    #00000053  ! negative sign position 
integer(4), parameter :: NLS$LI_IPOSSYMPRECEDES = #00000054  ! mon sym precedes pos amt 
integer(4), parameter :: NLS$LI_IPOSSEPBYSPACE =  #00000055  ! mon sym sep by space from pos amt 
integer(4), parameter :: NLS$LI_INEGSYMPRECEDES = #00000056  ! mon sym precedes neg amt 
integer(4), parameter :: NLS$LI_INEGSEPBYSPACE =  #00000057  ! mon sym sep by space from neg amt 

!****
!**** Character Length Routines
!****

integer(4), parameter :: MBLenMax = 2 

interface 
  integer(4) function MBCurMax()
  end function

  integer(4) function MBCharLen( string )
    character(len=*), intent(in) :: string
  end function
end interface

!****
!**** String Length Routines
!****

interface
  integer(4) function MBLen( string )
    character(len=*), intent(in) :: string
  end function

  integer(4) function MBLen_Trim( string )
    character(len=*), intent(in) :: string
  end function
end interface

!****
!**** Lead Byte Routines
!****

interface
  logical(4) function MBLead( char )
    character, intent(in) :: char 
  end function

  logical(4) function MBStrLead( string, position )
    character(len=*), intent(in) :: string
    integer(4), intent(in) :: position
  end function
end interface

!****
!**** String Forward and Back
!****

interface
  integer(4) function MBPrev( string, position )
    character(len=*), intent(in) :: string
    integer(4), intent(in) :: position
  end function

  integer(4) function MBNext( string, position )
    character(len=*), intent(in) :: string
    integer(4), intent(in) :: position
  end function
end interface

!****
!**** JIS to JMS Routines
!****

interface
  character(len=2) function MBJMSToJIS( char )
    character(len=2), intent(in) :: char
  end function

  character(len=2) function MBJISToJMS( char )
    character(len=2), intent(in) :: char
  end function
end interface

!****
!**** Conversion to and from Unicode
!****

integer(4), parameter :: NLS$Precomposed =         #1
integer(4), parameter :: NLS$Composite =           #2
integer(4), parameter :: NLS$UseGlyphChars =       #4
integer(4), parameter :: NLS$ErrorOnInvalidChars = #8

interface
  integer(4) function MBConvertMBToUnicode( mbstr, unicodestr, flags )
    character(len=*), intent(in) :: mbstr
    integer(2), dimension(:), intent(out) :: unicodestr
    integer(4), intent(in), optional :: flags
  end function
end interface

integer(4), parameter :: NLS$CompositeCheck =  #200
integer(4), parameter :: NLS$DiscardDns =      #010
integer(4), parameter :: NLS$SepChars =        #020
integer(4), parameter :: NLS$DefaultChar =     #040

interface
  integer(4) function MBConvertUnicodeToMB( unicodestr, mbstr, flags )
    integer(2), dimension(:), intent(in) :: unicodestr
    character(len=*), intent(out) :: mbstr
    integer(4), optional, intent(in) :: flags
  end function
end interface

!****
!**** MB Equivalent of InCharQQ
!****

interface
  integer(4) function MBInCharQQ( string )
    character(len=2), intent(out) :: string	! len = MBLenMax
  end function
end interface

!****
!**** Fortran 90 String Manipulation Routines
!****

interface
  integer(4) function MBVerify( string, set, back )
    character(len=*), intent(in) :: string, set
    logical(4), intent(in), optional :: back
  end function

  integer(4) function MBScan( string, set, back )
    character(len=*), intent(in) :: string, set
    logical(4), intent(in), optional :: back
  end function

  integer(4) function MBIndex( string, substring, back )
    character(len=*), intent(in) :: string, substring
    logical(4), intent(in), optional :: back
  end function
end interface

!****
!**** String Comparison Routines
!****

integer(4), parameter :: NLS$IgnoreCase =     #00001
integer(4), parameter :: NLS$IgnoreNonSpace = #00002
integer(4), parameter :: NLS$IgnoreSymbols =  #00004
integer(4), parameter :: NLS$IgnoreKanaType = #10000
integer(4), parameter :: NLS$IgnoreWidth =    #20000
integer(4), parameter :: NLS$StringSort =     #01000

interface
  logical(4) function MBLLT( stra, strb, flags )
    character(len=*), intent(in) :: stra, strb
    integer(4), intent(in), optional :: flags
  end function

  logical(4) function MBLLE( stra, strb, flags )
    character(len=*), intent(in) :: stra, strb
    integer(4), intent(in), optional :: flags
  end function

  logical(4) function MBLGT( stra, strb, flags )
    character(len=*), intent(in) :: stra, strb
    integer(4), intent(in), optional :: flags
  end function

  logical(4) function MBLGE( stra, strb, flags )
    character(len=*), intent(in) :: stra, strb
    integer(4), intent(in), optional :: flags
  end function

  logical(4) function MBLEQ( stra, strb, flags )
    character(len=*), intent(in) :: stra, strb
    integer(4), intent(in), optional :: flags
  end function

  logical(4) function MBLNE( stra, strb, flags )
    character(len=*), intent(in) :: stra, strb
    integer(4), intent(in), optional :: flags
  end function
end interface

!****
!**** Locale and Codepage Enumeration
!****

! NOTE: the following is replicated in the interface to NLSEnumLocales,
! If this changes, then the interface also needs to be changed (below).
integer(4), parameter :: NLS$MaxLanguageLen = 64
integer(4), parameter :: NLS$MaxCountryLen = 64
type NLS$EnumLocale
  sequence
  ! If you change this structure, be sure to change it below as well.
  character(len=NLS$MaxLanguageLen) Language
  character(len=NLS$MaxCountryLen) Country
  integer(4) DefaultWindowsCodepage
  integer(4) DefaultConsoleCodepage
end type

interface
  function NLSEnumLocales()
  ! If you change the following two defines, be sure to change them above too.
  integer(4), parameter :: NLS$MaxLanguageLen = 64
  integer(4), parameter :: NLS$MaxCountryLen = 64
  type NLS$EnumLocale
    sequence
    ! If you change this structure, be sure to change it above as well.
    character(len=NLS$MaxLanguageLen) Language
    character(len=NLS$MaxCountryLen) Country
    integer(4) DefaultWindowsCodepage
    integer(4) DefaultConsoleCodepage
  end type
  type(NLS$EnumLocale), pointer :: NLSEnumLocales(:)
  end function

  function NLSEnumCodePages()
    integer(4), pointer :: NLSEnumCodePages(:)
  end function
end interface

end module msfnls

!**********************************************************************
!* End of module msfnls
!**********************************************************************
