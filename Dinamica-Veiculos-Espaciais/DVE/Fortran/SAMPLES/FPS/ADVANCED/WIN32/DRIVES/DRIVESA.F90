!/****************************************************************************
!*
!*    FUNCTION: GVI(LPTSTR, LPTSTR, DWORD)
!*
!*    PURPOSE: gets the Volume Information for the specified drive and prints
!*             the file system type
!*
!*    COMMENTS:
!*        This function makes a call to GetVolumeInformation.  The file system
!*        type is returned in the szSystemName buffer.  The file system type
!*        is printed to the screen.
!*
!*    INPUT: lpszDriveName - pointer to the drive name (ex - "a:")
!*           lpszSystemName - pointer to the system name buffer.  This will
!*                            be filled in by the GetVolumeInformation call
!*                            (e.g. FAT, HPFS)
!*           nSystemNameSize - size of the lpszSystemName buffer
!*
!*    OUTPUT: None
!*
!****************************************************************************/

subroutine GVI( lpszDriveName, lpszSystemName, nSystemNameSize)
use msfwin
character*(*)   lpszDriveName
character*(*)   lpszSystemName
integer(4)      nSystemNameSize

logical(4)      bRC
integer*4       ret
character*50    Volume

lpszSystemName      = lpszSystemName
nSystemNameSize     = nSystemNameSize


ret = lstrcpy(lpszSystemName, "                               "C)
bRC = GetVolumeInformation(                                       &  
                      lpszdrivename,                              &
                      Volume,                                     &
                      50,                                         &
                      NULL,                                       &
                      NULL,                                       &
                      NULL,                                       &
                      lpszSystemName,                             &
                      32)

if (brc .eqv. .FALSE.) then
    ret = lstrcpy (lpszSystemName, "Unknown Media Type"C)    
endif

write (*,*) ' File System for ', lpszDriveName, ' = ', lpszSystemName

end 

!/****************************************************************************
!*
!*    FUNCTION: UpdateBuffer(LPTSTR)
!*
!*    PURPOSE: updates string pointer to the next string in an array
!*             of strings
!*
!*    COMMENTS:
!*
!*    INPUT: lpszString - pointer to an array of zero terminated strings.
!*                        The final string is terminated with a double null.
!*
!*    OUTPUT: modified pointer that points to the next string in the array
!*
!****************************************************************************/

integer*4 function UpdateBuffer( lpszString )
use msfwin
integer*4 lpszString

character*512   TempString
iret = ConvertFToCString(TempString,lpszString)
UpdateBuffer = lpszString + lstrlen(TempString) + 1
return

end 

