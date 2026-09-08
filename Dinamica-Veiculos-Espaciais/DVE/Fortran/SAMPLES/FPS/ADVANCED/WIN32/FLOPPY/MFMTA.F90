!----------------------------------
! GetDiskGeometry
!----------------------------------

integer*4 function GetDiskGeometry(hDisk, lpGeometry)
!MS$ATTRIBUTES VALUE :: lpGeometry
!MS$ ATTRIBUTES VALUE :: hDisk
use msfwin
use mfmtinc
integer     hDisk
integer*4   lpGeometry
integer*4   ReturnedByteCount
integer*4   iTemp

iTemp = lpGeometry
iTemp = IOCTL_DISK_GET_DRIVE_GEOMETRY
iTemp = SIZEOFDISKGEOMETRY



GetDiskGeometry = DeviceIoControl(                                &
          hDisk,                                                  &
           IOCTL_DISK_GET_DRIVE_GEOMETRY,                         &
           NULL,                                                  &
           0,                                                     &
           lpGeometry,                                            &
           SIZEOFDISKGEOMETRY,                                    &
           LOC(ReturnedByteCount),                                &
           NULL_overlapped                                                   &
           )
return
end 
!----------------------------------
! GetSupportedGeometrys
!----------------------------------

integer*4   function GetSupportedGeometrys(hDisk)
!MS$ ATTRIBUTES VALUE :: hDisk
use msfwin
use mfmtinc
integer     hDisk


integer     ReturnedByteCount
integer     b
integer     NumberSupported

b = DeviceIoControl(                                              &
          hDisk,                                                  &
           IOCTL_DISK_GET_MEDIA_TYPES,                            &
           NULL,                                                  &
           0,                                                     &
           LOC(SupportedGeometry),                                &
           SIZEOFSUPPORTEDGEOMETRY,                               &
           LOC(ReturnedByteCount),                                &
           NULL_overlapped                                        &
           )

if ( b .NE. 0) then
    NumberSupported = ReturnedByteCount / SIZEOFDISKGEOMETRY
else
   NumberSupported = 0
end if
SupportedGeometryCount = NumberSupported

GetSupportedGeometrys = NumberSupported
return
end 
