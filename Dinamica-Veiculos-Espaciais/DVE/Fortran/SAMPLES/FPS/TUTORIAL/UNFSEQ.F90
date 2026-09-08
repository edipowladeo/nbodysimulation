!======================================================================
!
! Program: UnfSeq	(Unformatted Sequential File Converter)
!
! Fortran PowerStation reads and writes unformatted sequential files 
! in a particular way, which can be different from unformatted sequential
! files on other platforms.  This can cause problems when trying to move
! data files from other platforms to Windows, or vice versa.  
!
! This program will help convert these files, from one format to the other.
!
! Usage
! =====
! From the command line:
!     unfseq { -toms | -fromms } [ -bigendian ] source [ destination ]
! where:
!    -toms	  specifies that the source file is to be converted to
!                 Microsoft unformatted sequential format.  
!    -fromms	  specifies that the source file is to be converted from
!                 Microsoft unformatted sequential format.  
!    -bigendian   The other platform is a bigendian platform.  The lengths
!                 associated with each record will be read/written in 
!                 bigendian form.  See the note below about the endian of 
!                 data if you must use this switch.  The default is little
!                 endian.
!    source       The file to be converted.
!    destination  If specified, names the file to write the converted file to.
!                 If not specified, the source file is replaced with
!                 the converted file.
!
! File Structures
! ===============
! The structure of Fortran PowerStation unformatted sequential files
! is documented in the Programmer's Guide. 
!
! The typical structure on other platforms is somewhat simpler: for each
! record, the length of the record appears before and after the record,
! as a 4-byte integer quantity.  Note that these lengths can either be in 
! little or big endian format (see the -bigendian switch above).
! There is no begin or end bytes, as there is in Fortran PowerStation.  
!
! Endian of Data
! ==============
! Note that this program will adjust the structure of the file appropriately,
! but cannot change the data itself.  This can cause problems if the source
! platform is big endian and the destination is little endian, since any
! numeric variables will have their bytes reversed in the data file.
! This program can be augmented to properly translate the data, for a 
! specific data file format, while it is translating the file structure.
!
program UnformattedSequentialConverter
    use msflib
    implicit none

    character*2 ConvertType
    integer*2 StatusC, StatusS, StatusD
    character*($MAXPATH) SrcFile, DestFile
    logical BigEndian
    integer*4 i4
    logical error, ConvertToMS, ConvertFromMS

    ! Read arguments, display usage information if there is a problem
    !
    call getarg( int2(1), ConvertType, StatusC )
    call getarg( int2(2), SrcFile, StatusS )
    if( StatusC < 0 .or. StatusS < 0 ) ConvertType = '***'
    if( (SrcFile(1:1) == '/' .or. SrcFile(1:1) == '-') .and. &
	(SrcFile(2:2) == 'b' .or. SrcFile(2:2) == 'B') ) then
	    BigEndian = .true.
	    call getarg( int2(3), SrcFile, StatusS )
            call getarg( int2(4), DestFile, StatusD )
    else
	    BigEndian = .false.
            call getarg( int2(3), DestFile, StatusD )
    endif
    if( StatusD < 0 ) DestFile = '$$unfseq.tmp'

    select case( ConvertType )
        case( '-t', '-T', '/t', '/T' )
	    error = .not. ConvertToMS( SrcFile, DestFile, BigEndian )           
        case( '-f', '-F', '/f', '/F' )   
	    error = .not. ConvertFromMS( SrcFile, DestFile, BigEndian )
        case default
            print *,'usage: unfseq { -toms | -fromms } &
		            &[ -bigendian ] source [ destination ]'	
	    error = .true.
    end select

    ! If the destination was not specified, replace the source
    !
    if( .not. error .and. StatusD < 0 ) then
	i4 = DelFilesQQ( SrcFile )
	i4 = RenameFileQQ( DestFile, SrcFile )
    endif
end program

!----------------------------------------------------------------------
logical function ConvertFromMS( from, to, bigendian )
implicit none
character*(*) from, to
logical bigendian
character buff1
character*(65536) record
integer start, len
logical first

open( unit=1, file=from, access='sequential', blocksize=65535, &
      err=10, form='binary', mode='read', status='old' )
open( unit=2, file=to, access='sequential', blocksize=65535, &
      err=20, form='binary', mode='write', status='new' )

! Check BOF Flag
read( 1, err=10 ) buff1
if( ichar(buff1) /= 75 ) then
	print *,'ERROR: ',from(:len_trim(from)),&
		' is not a Microsoft unformmatted sequential file'
	ConvertFromMS = .false.
	return
endif

! Read Record, Write to output file
do 
	read( 1, err=10 ) buff1; len = ichar(buff1)
	if( len .eq. 130 ) exit		! EOF Flag = 130 decimal
	start = 1
	first = .true.
	do while( first .or. (len > 128) )
		if( len == 129 ) len = len-1
		read( 1, err=10 ) record(start:start+len-1)
		start = start + len
		read( 1, err=10 ) buff1; len = ichar(buff1)
		first = .false.
	end do
	if( .not. writelen( len ) ) goto 20
	write( 2, err=20 ) record(1:start-1)
	if( .not. writelen( len ) ) goto 20
end do
close( 1, err=10 )
close( 2, err=20 )
ConvertFromMS = .true.
return

10 print *,"ERROR: File open or read error on file '",from(:len_trim(from)),"'"
ConvertFromMS = .false.
return
20 print *,"ERROR: File open or write error on file '",to(:len_trim(to)),"'"
ConvertFromMS = .false.
return

contains
  logical function writelen( len )
    integer(4) len
    if( bigendian ) then
	write( 2, err=30 ) int1(ishft(len,-24)), int1(ishft(len,-16)),&
		   int1(ishft(len,-8)), int1(len)
    else
	write( 2, err=30 ) len
    endif
    writelen = .true.
    return
    30 writelen = .false.
    return
  end function writelen
end function ConvertFromMS

!----------------------------------------------------------------------
logical function ConvertToMS( from, to, bigendian )
character*(*) from, to
logical bigendian
character*(65536) record
integer start, len, len_end

open( unit=1, file=from, access='sequential', blocksize=65535, &
      err=10, form='binary', mode='read', status='old' )
open( unit=2, file=to, access='sequential', blocksize=65535, &
      err=20, form='binary', mode='write', status='new' )

! write BOF
write( 2, err=20 ) char(75)
do while( .not. eof( 1 ) )
   if( .not. readlen( len ) ) goto 10
   read( 1, err=10 ) record( 1:len ) 
   if( .not. readlen( len_end ) ) goto 10
   if( len_end /= len ) then
	print *,'ERROR: Record start/end length mismatch'
	ConvertToMS = .false.
	return
   endif
   start = 1
   do while( (len-start+1) > 128 )
	write( 2, err=20 ) int1( 129 )
	write( 2, err=20 ) record( start:start+128 )
	write( 2, err=20 ) int1( 129 )
	start = start + 128
   end do
   if( (len-start) > 0 ) then
	write( 2, err=20 ) int1(len-start+1)
	write( 2, err=20 ) record( start:len )
	write( 2, err=20 ) int1(len-start+1)
   end if
end do	
write( 2, err=20 ) char(130)
close( 1, err=10 )
close( 2, err=20 )
ConvertToMS = .true.
return

10 print *,"ERROR: File open or read error on file '",from(:len_trim(from)),"'"
ConvertToMS = .false.
return
20 print *,"ERROR: File open or write error on file '",to(:len_trim(to)),"'"
ConvertToMS = .false.
return

contains
  logical function readlen( len ) 
     character*4 lench
     if( bigendian ) then
         read( 1, err=30 ) lench
	 len = ishft(ichar(lench(1:1)),24) .or. &
	       ishft(ichar(lench(2:2)),16) .or. &
	       ishft(ichar(lench(3:3)),8) .or. ichar(lench(4:4))
     else
	 read( 1, err=30 ) len
     endif
     readlen = .true.
     return
     30 readlen = .false.
     return
   end function readlen
end function ConvertToMS

!======================================================================
