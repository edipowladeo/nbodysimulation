!----------------------------------
! DisMountVolume
!----------------------------------
integer function DismountVolume( hDisk )
use msfwin
integer hDisk
integer ReturnedByteCount

DismountVolume = DeviceIoControl(                                 &
                hDisk,                                            &
                 INT4(FSCTL_DISMOUNT_VOLUME),                     &
                 NULL,                                            &
                 0,                                               &
                 NULL,                                            &
                 0,                                               &
                 LOC(ReturnedByteCount),                          &
                 NULL_overlapped                                  &
                 )
return
end 
