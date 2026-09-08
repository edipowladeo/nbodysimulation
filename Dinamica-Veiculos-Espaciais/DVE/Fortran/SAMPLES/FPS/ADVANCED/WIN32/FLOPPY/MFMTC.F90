!----------------------------------
! LockVolume
!----------------------------------

integer function LockVolume( hDisk )
use msfwin
integer hDisk

integer ReturnedByteCount
LockVolume = DeviceIoControl(                                     &
                hDisk,                                            &
                 INT4(FSCTL_LOCK_VOLUME),                         &
                 NULL,                                            &
                 0,                                               &
                 NULL,                                            &
                 0,                                               &
                 LOC(ReturnedByteCount),                          &
                 NULL_overlapped                                  &
                 )
return
end 

!----------------------------------
! UnLockVolume
!----------------------------------
integer function UnlockVolume(hDisk)
use msfwin
integer hDisk


integer ReturnedByteCount
UnlockVolume = DeviceIoControl(                                   &
                 hDisk,                                           &
                 INT4(FSCTL_UNLOCK_VOLUME),                       &
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