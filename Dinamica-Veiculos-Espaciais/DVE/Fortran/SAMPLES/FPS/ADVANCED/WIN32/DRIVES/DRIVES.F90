!\******************************************************************************/
!*       This is a part of the Microsoft Source Code Samples. 
!*       Copyright (C) 1993 Microsoft Corporation.
!*       All rights reserved. 
!*       This source code is only intended as a supplement to 
!*       Microsoft Development Tools and/or WinHelp documentation.
!*       See these sources for detailed information regarding the 
!*       Microsoft samples programs.
!\******************************************************************************/

!/****************************************************************************
!*
!*    PROGRAM: DRIVES.f90
!*
!*    PURPOSE: Determines all drives in the system, both local and remote,
!*             and their file system type
!*
!*    FUNCTIONS:
!*
!*    CheckRM() - verifies that a removeable media drive contains a disk
!*    GVI() - gets the volume information for a drive and prints out the
!*            file system type
!*    UpdateBuffer() - updates string pointer to the next string in an array
!*            of strings
!*
!*    COMMENTS:
!*
!****************************************************************************/
use msfwin
use drivinc

integer*4   CheckRM [EXTERN]
external    GVI
integer*4   UpdateBuffer [EXTERN]

!/****************************************************************************
!*
!*    COMMENTS:
!*        The number of available drives is first determined by a call to
!*        GetLogicalDrives.  This provides a bit mask of all logical drives.
!*        Next, a call is made to GetLogicalDriveStrings to get the valid
!*        drive strings for the system.
!*
!*        For each logical drive, a call is made to GetDriveType to determine
!*        the drive type.  If the logical drive is not in the bit mask that
!*        was created with the GetLogicalDrives call, then this drive is
!*        bypassed.
!*
!*        GetVolumeInformation is used to determine the file system
!*        for the logical drive.  This information is returned in the
!*        lpszFileSystemNameBuffer variable.  If the drive type is
!*        remote, a check must be made to see if the drive contains a
!*        disk. This is accomplished by opening '.' in the root
!*        directory of the remote drive.  The error level is temporarily
!*        changed from 0 to 1, to allow any OpenFileErrors to immediately
!*        return to the calling function, thus eliminating any unwanted
!*        dialog boxes.  If the remote drive contains a disk, then it is
!*        safe to proceed with the GetVolumeInformation call.
!*
!*    INPUT: None
!*
!*    OUTPUT: None
!*
!****************************************************************************/

integer         dwDriveMask
integer         dwRC
integer         dwTemp
integer         cbDriveStringBufferSize
character*31    lpszDriveStringBuffer
character*4     lpszRootPathName
integer         a
character*100   lpszFileSystemNameBuffer
integer         nFileSystemNameSize
character*28    TempBuffer
integer*4       lpRet
character*3     TempDrive
integer*4       func1

cbDriveStringBufferSize = BUFSIZE 
lpszDriveStringBuffer = chBuffer

data lpszFileSystemNameBuffer /"                              "C/
data    nFileSystemNameSize /31/
lpszRootPathName  = "?:\\"C
dwDriveMask = GetLogicalDrives()
dwRC = GetLogicalDriveStrings(cbDriveStringBufferSize, lpszDriveStringBuffer)

lpRet = LOC(lpszDriveStringBuffer)
do a = ichar('a'), ichar('z')
    lpszRootPathName(1:1) = achar (a-1+1)
    dwTemp = IAND(dwDriveMask , 1)
    dwDriveMask = ISHFT (dwDriveMask, -1)
    if (dwTemp .NE. 0) then
        dwRC = GetDriveType(lpszRootPathName)
        call CopyMemory (LOC(TempDrive), lpRet, 3)
        write(TempBuffer, 200) TempDrive
200           format ('The drive type for ',A3, ' is ')
        
        lpRet =  UpdateBuffer(lpRet)
        
        select case (dwRC)
            case (DRIVE_REMOVABLE)
                write(*,*) TempBuffer, "removable"
                func1 = LOC(lpszRootPathName)
                if (CheckRM(lpszRootPathName) .NE. 0) then
                    call GVI(lpszRootPathName, lpszFileSystemNameBuffer, nFileSystemNameSize)
                else
                    write(*,*)("File system = INDETERMINATE")
                end if
                            
            case (DRIVE_FIXED)
                write(*,*) TempBuffer , "fixed.      "
                call GVI(lpszRootPathName, lpszFileSystemNameBuffer, nFileSystemNameSize)

           case (DRIVE_REMOTE)
                write(*,*) TempBuffer , "remote.     "
                call GVI(lpszRootPathName, lpszFileSystemNameBuffer, nFileSystemNameSize)

            case (DRIVE_CDROM)
                write(*,*) TempBuffer , "CD-ROM.     "
                call GVI(lpszRootPathName, lpszFileSystemNameBuffer, nFileSystemNameSize)
     
            case (DRIVE_RAMDISK)
                write(*,*) TempBuffer , "RAM disk.   "
                call GVI(lpszRootPathName, lpszFileSystemNameBuffer, nFileSystemNameSize)
     
            case DEFAULT
        end select
        write (*,*)
    end if
end do
end 


!/****************************************************************************
!*
!*    FUNCTION: CheckRM(LPTSTR)
!*
!*    PURPOSE: Verifies that a removeable media drive contains a disk
!*
!*    COMMENTS:
!*
!*        This function is called each time a drive type is determined to be
!*        removeable (DRIVE_REMOVEABLE).  An attempt is made to open a
!*        file in the root directory of the drive.  If the attempt succeeds,
!*        then media is present in the drive and subsequent calls to the
!*        drive can be safely made.  If the call fails, then there is no media
!*        present in the drive and no attempts should be made to access this
!*        drive.  The Error Mode is temporarily set to 1 to allow failures
!*        to immediately return to the calling program.  This eliminates
!*        unwanted dialog boxes that prompt for disks to be placed in the
!*        drive.
!*
!*    INPUT: lpszDriveName - removeable media drive name (ex - "a:")
!*
!*    OUTPUT: Returns TRUE if media present
!*                    FALSE if media is not present
!*
!****************************************************************************/

integer*4 function CheckRM(lpszDriveName)
use msfwin

character*(*)       lpszDriveName
integer             iRC
character*10        lpszFileName
type (T_OFSTRUCT)   ofstrct
integer             wStyle
integer*4           ret

wStyle  = OF_EXIST
ret = SetErrorMode(1)

ret = lstrcpy (lpszFileName,lpszDriveName)
ret = lstrcat (lpszFileName,"."C)
iRC = OpenFile(lpszFileName, ofstrct, wStyle)
ret = SetErrorMode(0)
if (iRC == -1) then
    CheckRM = FALSE
    return
end if
ret = lclose(iRC)
CheckRM = TRUE
return
end 

