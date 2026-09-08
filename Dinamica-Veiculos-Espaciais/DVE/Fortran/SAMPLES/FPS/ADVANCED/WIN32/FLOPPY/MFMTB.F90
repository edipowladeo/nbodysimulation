!----------------------------------
! PrintGeometry
!----------------------------------

subroutine PrintGeometry( lpDriveName, lpGeometry )
!MS$ATTRIBUTES VALUE :: lpDriveName
!MS$ATTRIBUTES VALUE :: lpGeometry
use msfwin
integer*4               lpDriveName
integer*4               lpGeometry
character*2             DriveName
type (T_DISK_GEOMETRY)  Geometry

character*100   MediaType

if (lpDriveName .NE. 0) then
    i = ConvertFToCstring(DriveName, lpdrivename)        
    write (*, 10) DriveName
10        FORMAT(' Geometry for Drive ' , A, A)
end if

        call CopyMemory (LOC(Geometry), lpGeometry, 24)

select case ( Geometry%MediaType ) 
    case (F5_1Pt2_512 )  
        MediaType = "5.25, 1.2MB,  512 bytes/sector"C
    case (F3_1Pt44_512)
        MediaType = "3.5,  1.44MB, 512 bytes/sector"C
    case (F3_2Pt88_512 )
        MediaType = "3.5,  2.88MB, 512 bytes/sector"C
    case (F3_20Pt8_512 )
        MediaType = "3.5,  20.8MB, 512 bytes/sector"C
    case (F3_720_512 )  
        MediaType = "3.5,  720KB,  512 bytes/sector"C
    case (F5_360_512 )  
        MediaType = "5.25, 360KB,  512 bytes/sector"C
    case (F5_320_512 )  
        MediaType = "5.25, 320KB,  512 bytes/sector"C
    case (F5_320_1024  )
        MediaType = "5.25, 320KB,  1024 bytes/sector"C
    case (F5_180_512 )  
        MediaType = "5.25, 180KB,  512 bytes/sector"C
    case (F5_160_512 )  
        MediaType = "5.25, 160KB,  512 bytes/sector"C
    case (RemovableMedia )
        MediaType = "Removable media other than floppy"C
    case (FixedMedia )  
        MediaType = "Fixed hard disk media"C
    case DEFAULT      
        MediaType = "Unknown"C
end select

write (*,200) MediaType
200   format ('    Media Type ' A)
write (*,210) Geometry%Cylinders%LowPart,                         &
              Geometry%TracksPerCylinder,                         &
              Geometry%SectorsPerTrack
210   format ('    Cylinders ', I4, ' Tracks/Cylinder ', I4, ' Sectors/Track ', I4)
    
end 

!----------------------------------
! LowLevelFormat
!----------------------------------

logical(4) function LowLevelFormat( hDisk, lpGeometry )
!MS$ATTRIBUTES VALUE :: hDisk
!MS$ATTRIBUTES VALUE :: lpGeometry
use msfwin
use mfmtinc
integer     hDisk
integer*4   lpGeometry


type (T_FORMAT_PARAMETERS)   FormatParameters
type (T_DISK_GEOMETRY)   Geometry
integer*4   lpBadTrack
integer     i, b, ReturnedByteCount


call CopyMemory(LOC(Geometry), lpGeometry, 24)
FormatParameters%MediaType = Geometry%MediaType
FormatParameters%StartHeadNumber = 0
FormatParameters%EndHeadNumber = Geometry%TracksPerCylinder - 1
lpBadTrack = LocalAlloc(LMEM_ZEROINIT,                            &
                 Geometry%TracksPerCylinder*4)

do i = 0, Geometry%Cylinders%LowPart -1 

    FormatParameters%StartCylinderNumber = i
    FormatParameters%EndCylinderNumber = i

    b = DeviceIoControl(                                          &
              hDisk,                                              &
              IOCTL_DISK_FORMAT_TRACKS,                           &
              LOC(FormatParameters),                              &
              SIZEOFFORMATPARAMETERS,                             &
              lpBadTrack,                                         &
              Geometry%TracksPerCylinder*4,                       &
              LOC(ReturnedByteCount),                             &
              NULL_overlapped                                     &
              )

    if (b == 0 ) then
         ret = LocalFree(lpBadTrack)
         LowLevelFormat = b
         return
    end if
end do

ret = LocalFree(lpBadTrack)

LowLevelFormat = .TRUE.
return
end 
