module asynioin
use msfwin
integer*4, parameter, public :: SIZEOFOVERLAPPED    = 20
integer*4, parameter, public :: DEFAULT             = 0
integer*4, parameter, public :: SCCESS              = 0
integer*4, parameter, public :: IO_ERROR            = 16#FFFFFFFF
integer*4, parameter, public :: WAIT_ERROR          = 16#FFFFFFFF
integer*4, parameter, public :: SECTOR_SIZE         = 1024
integer*4, parameter, public :: RETURN_IMEDIATELY   = 0

integer*4   hInfile     !// Handle to the file to read
integer*4   hOutfile     !// Handle to the file to write to

integer*4   hEvent       !// Handle to the synchronization Event
      
type (T_OVERLAPPED) OverLaped   
                        !// The operating system does not automatically
                         !// track the current file position of a file
                         !// open for asynchroous I/O. Instead one must
                         !// manually track this by updating the OVERLAPPED
                         !// structure. To update this structure one uses
                         !// the result returned by GetOverLappedResults().


character*(SECTOR_SIZE)   buf !// Buffer used by either
                       !// ReadFile() or WriteFile()
integer     cbBytesRead
                         !  // count of bytes read by ReadFile()
                         !  // When asynchonous I/O is performed
                         !  // one must check how many bytes were
                         !  // read by calling GetOverLappedResults().
integer     cbBytesWritten    !  // count of bytes written by WriteFile()
integer    cbBytesTransfered   ! // this value is returned by
                          ! // GetOverLappedResults() represents the
                          ! // count of bytes transfered asynchronous
integer*4   dwStatus, dwSuccess ! // value returned by GetLastError()
                                ! // return code of last API called
integer*4   bSuccess            ! // return code of last API called
integer*4   argc

end module
