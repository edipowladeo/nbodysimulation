!*************************************************************************\
!*
!*  FUNCTION:  FileDlgProc (HWND, UINT, UINT, LONG)
!*
!*  PURPOSE:   To process the messages to the lower dialog box.
!*
!*  VARIABLES USED:
!*
!*    - fileName:
!*             A local CHAR array used to capture the text from the
!*             IDE_FILENAME edit field.
!*
!*    - hFile: Local file handle.
!*
!*    - retCode:
!*             Local DWORD used to trap API return codes.
!*
!*    - ftCreation,
!*    - ftAccessed,
!*    - ftWrittenTo:
!*             Local FILETIME structures.
!*
!*    - wDosDate,
!*    - wDosTime:
!*             Local WORDs, used to hold the values converted from the
!*             FILETIME structures converted by FileTimeToDosDateTime()
!*             and DosDateTimeToFileTime().
!*
!*    - DD[],
!*    - MM[],
!*    - YY[],
!*    - Mn[],
!*    - SS[],
!*    - HH[]:  Local CHAR arrays used to trap the values in various
!*             edit fields representing date and time values.
!*
!*    - dwFileSize:
!*             Local DWORD holding file size.
!*
!*    - lpsFileSize[]:
!*             Local CHAR array used to trap the string from the IDE_SIZE
!*             edit field.
!*
!*    - dwFileAttr:
!*             Local DWORD holding the file attributes.
!*
!*    - hDlg:  Input parameter, handle to the dialog box.
!*
!*  MESSAGES:
!*
!*    WM_COMMAND
!*
!*      IDB_ATTR:
!*             It initializes the variable to hold the file attributes,
!*             dwFileAttr, and then traps the checked states of the
!*             dialog boxes checked buttons.  If a box is found to be
!*             checked, then the appropriate file attribute flag is
!*             OR'd into dwFileAttr.  When all of the attribute values
!*             have been collected, these attributes are set to the file
!*             listed in IDE_FILENAME.
!*
!*      IDB_SET:
!*             This collects the values from the various time and date
!*             edit fields, converts them into system time, and sets
!*             them to the file listed in IDE_FILENAME.  Basically the
!*             technique is to 1) get the values from the edit fields;
!*             2) shift them to their correct location in the WORD; and
!*             3) OR them together into a single WORD.
!*
!*      IDB_OPENFILE:
!*             This gets the date, time, size, and attribute information
!*             from the file listed in IDE_FILENAME.  It converts the
!*             values appropriately and puts them into the various
!*             edit fields and check buttons.  Again, to do time and date
!*             conversions, you must AND the values returned from
!*             GetFileTime() with certain masks to let the appropriate bits
!*             fall through from the WORD (see the mask and shift values
!*             in the setinfo.h file), and shift them to the low order
!*             bit to get the new values.  This is done in the wsprintf()
!*             call's parameter list.
!*
!*  CALLS TO:
!*
!*    RepStat();
!*
!*  COMMENTS:
!*    The basic function of this box is to capture and set file information,
!*    and to send messages to the upper dialog box via RepStat() to report
!*    return code information.  Special characteristics of this function
!*    is how to get and set file information and attributes, and how to
!*    convert Time and Date information.
!*
!*************************************************************************/

integer*4 function FileDlgProc (hDlg, message, wParam, lParam)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FileDlgProc@16' :: FileDlgProc
use setinc
integer*4   hDlg, message, wParam, lParam

interface
integer(4) function RepStat (API, retcode)
!MS$ ATTRIBUTES VALUE :: retcode 
character*(*)   API 
integer*4       retcode 
end function
end interface

character*100       fileName
integer*4           hFile
integer*4           retCode
type (T_FILETIME)   ftCreation, ftAccessed, ftWrittenTo
integer*2           wDosDate, wDosTime
character           DD*3, MM*3, YY*3, HH*3, Mn*3, SS*3
integer*4           dwFileSize
character           lpsFileSize*10
integer*4           dwFileAttr
logical(4)          bret

data    retCode /0/

lParam = lParam
select case (message)
    case (WM_COMMAND)
        select case (INT4(LoWord(wParam)))
            case (IDB_ATTR)
                dwFileAttr = 0

                if (IsDlgButtonChecked (hDlg, IDC_HIDE) .NE. 0) then
                    dwFileAttr = IOR(dwFileAttr, FILE_ATTRIBUTE_HIDDEN)
                end if

                if (IsDlgButtonChecked(hDlg,IDC_NORMAL) .NE. 0) then
                    dwFileAttr = IOR(dwFileAttr, FILE_ATTRIBUTE_NORMAL)
                end if

                if (IsDlgButtonChecked (hDlg, IDC_ARC) .NE. 0) then
                    dwFileAttr = IOR(dwFileAttr, FILE_ATTRIBUTE_ARCHIVE)
                end if

                if (IsDlgButtonChecked (hDlg, IDC_SYSTEM) .NE. 0) then
                    dwFileAttr = IOR(dwFileAttr, FILE_ATTRIBUTE_SYSTEM)
                end if

                if (IsDlgButtonChecked (hDlg, IDC_READ) .NE. 0) then
                    dwFileAttr = IOR(dwFileAttr, FILE_ATTRIBUTE_READONLY)
                end if

                ret = GetDlgItemText (hDlg, IDE_FILENAME,  fileName, 100)

                retCode = SetFileAttributes (fileName, dwFileAttr)

                ret = RepStat ("SetFileAttributes()"C, retCode)

                FileDlgProc = 0
                return

            case (IDB_SET)

                ret = GetDlgItemText (hDlg, IDE_YEAR,  YY, 3)
                ret = GetDlgItemText (hDlg, IDE_DAY,   DD, 3)
                ret = GetDlgItemText (hDlg, IDE_MONTH, MM, 3)
                wDosDate =                                              &
                     IOR(ISHL(INT4(chartoint(LOC(YY))) - 80,YRSHIFT) ,  &
                     IOR(ISHL(INT4(chartoint(LOC(MM))),MONSHIFT) ,      &
                     ISHL(INT(chartoint(LOC(DD))),DAYSHIFT)))          

                ret = GetDlgItemText (hDlg, IDE_HOURS,  HH,3)
                ret = GetDlgItemText (hDlg, IDE_SECONDS,SS,3)
                ret = GetDlgItemText (hDlg, IDE_MINUTES,Mn,3)

                wDosTime =                                              &
                     IOR(ISHL((INT4(chartoint(LOC(SS))) / 2), SECSHIFT),&
                     IOR(ISHL(INT4(chartoint(LOC(Mn))),MINSHIFT),       &
                     ISHL(INT(chartoint(LOC(HH))),HRSHIFT)))

                retCode = DosDateTimeToFileTime (wDosDate, wDosTime, ftWrittenTo)
                ret = RepStat("DosDateTimeToFileTime()"C, retCode)

                ret = GetDlgItemText (hDlg, IDE_FILENAME, fileName, 100)
                
                hFile = CreateFile (fileName,                       &
                          IOR(GENERIC_READ , GENERIC_WRITE),        &
                          IOR(FILE_SHARE_READ , FILE_SHARE_WRITE),  &
                          NULL_SECURITY_ATTRIBUTES,                 &
                          OPEN_EXISTING,                            &
                          FILE_ATTRIBUTE_NORMAL,                    &
                          NULL)

                if (RepStat("CreateFile()"C , hFile) .NE. 0) then
                    FileDlgProc = 0
                    return
                end if

               
                retCode = SetFileTime (hFile, NULL_FILETIME, NULL_FILETIME,         &
                                        ftWrittenTo)
                
                ret = RepStat("SetFileTime()"C, retCode)
                ret = CloseHandle (hFile)
                FileDlgProc = 0
                return


            case (IDB_OPENFILE )
                ret = GetDlgItemText (hDlg, IDE_FILENAME, fileName, 100)
                
                hFile = CreateFile (fileName,                       &
                          GENERIC_READ,                             &
                          IOR(FILE_SHARE_READ , FILE_SHARE_WRITE),  &
                          NULL_SECURITY_ATTRIBUTES,                 &
                          OPEN_EXISTING,                            &
                          FILE_ATTRIBUTE_NORMAL,                    &
                          NULL)

                if (RepStat("CreateFile()"C, hFile) .NE. 0) then
                    FileDlgProc = 0
                    return
                end if


                retCode = GetFileTime (hFile, ftCreation, ftAccessed, ftWrittenTo)
                ret = RepStat("GetFileTime()"C, retCode)

                retCode = FileTimeToDosDateTime(ftWrittenTo,&
                                                LOC(wDosDate),&
                                                LOC(wDosTime))
                ret = RepStat("FileTimeToDosDateTime()"C, retCode)

                dwFileSize = GetFileSize (hFile, NULL)
                ret = RepStat("GetFileSize()"C, dwFileSize)


                write(YY, '(I2)') ISHFT(IAND(wDosDate , YRMASK) , &
                                            -YRSHIFT ) + 80
                bret = SetDlgItemText (hDlg, IDE_YEAR, YY)
                            
                write(MM, '(I2)') ISHFT(IAND(wDosDate , MONMASK) ,&
                                            -MONSHIFT)
                bret = SetDlgItemText (hDlg, IDE_MONTH, MM)

                write(DD, '(I2)') ISHFT(IAND(wDosDate , DAYMASK) ,&
                                            -DAYSHIFT)
                bret = SetDlgItemText (hDlg, IDE_DAY, DD)

                write(SS, '(I2)') ISHFT(IAND(wDosTime , SECMASK), &
                                        - SECSHIFT ) * 2
                bret = SetDlgItemText (hDlg, IDE_SECONDS, SS)

                write(Mn, '(I2)') ISHFT(IAND(wDosTime , MINMASK), &
                                        - MINSHIFT)
                bret = SetDlgItemText (hDlg, IDE_MINUTES, Mn)

                write(HH, '(I2)') ISHFT(IAND(wDosTime , HRMASK),  &
                                        - HRSHIFT )
                bret = SetDlgItemText (hDlg, IDE_HOURS, HH)

                write(lpsFileSize, '(I8)') dwFileSize             
                bret = SetDlgItemText (hDlg, IDE_SIZE, lpsFileSize)
                

                dwFileAttr = GetFileAttributes (fileName)
                ret = RepStat("GetFileAttributes()"C, dwFileAttr)
                

                if (IAND(dwFileAttr , FILE_ATTRIBUTE_NORMAL)      &
                                            .NE. 0) then
                    ret = CheckDlgButton (hDlg, IDC_NORMAL, TRUE)
                else
                    ret = CheckDlgButton (hDlg, IDC_NORMAL, FALSE)
                end if

                if (IAND(dwFileAttr , FILE_ATTRIBUTE_READONLY)    &
                                            .NE. 0) then
                    ret = CheckDlgButton (hDlg, IDC_READ, TRUE)
                else
                    ret = CheckDlgButton (hDlg, IDC_READ, FALSE)
                end if

                if (IAND(dwFileAttr , FILE_ATTRIBUTE_HIDDEN)      &
                                            .NE. 0) then
                    ret = CheckDlgButton (hDlg, IDC_HIDE, TRUE)
                else
                    ret = CheckDlgButton (hDlg, IDC_HIDE, FALSE)
                end if

                if (IAND(dwFileAttr , FILE_ATTRIBUTE_SYSTEM)      &
                                            .NE. 0) then
                    ret = CheckDlgButton (hDlg, IDC_SYSTEM, TRUE)
                else
                    ret = CheckDlgButton (hDlg, IDC_SYSTEM, FALSE)
                end if

                if (IAND(dwFileAttr , FILE_ATTRIBUTE_ARCHIVE)     &
                                            .NE. 0) then
                    ret = CheckDlgButton (hDlg, IDC_ARC, TRUE)
                else
                    ret = CheckDlgButton (hDlg, IDC_ARC, FALSE)
                end if

                ret = CloseHandle (hFile)

                FileDlgProc = 0
                return
          end select
end select
FileDlgProc = 0
return
end

!*************************************************************************\
!*
!*  FUNCTION:  RepStat (CHAR *, DWORD)
!*
!*  PURPOSE:   To report return code information to the upper dialog box.
!*
!*  VARIABLES USED:
!*
!*    - TempBufW[],
!*    - TempBufL[]:
!*             Local CHAR arrays used to set the lParam and wParam of
!*             the WM_REPSTAT message.
!*
!*    - StepTime:
!*             Global DWORD representing the amount of sleep time chosen
!*             by the user.
!*
!*  CALLED BY:
!*
!*    FileDlgProc();
!*
!*  COMMENTS:
!*
!*    This function receives a string representing an API, and a DWORD
!*    representing it's return code value.  It checks the return code to
!*    see if it indicates an error.  If so, GetLastError is called to find
!*    the extended error information; if not, then retCode is set to 0.
!*    The case statement is used to exchange the retCode value for
!*    it's more intuitive string counterpart.  If no counterpart
!*    is listed, the function just sends the number value in string
!*    form.  Note that retCode 0 is just sent as a string number.
!*    Once the function drops from the switch statment, it sends the
!*    user define WM_REPSTAT message to the upper dialog box with the
!*    API and retCode information.  It will then enter a Sleep of a
!*    duration determined by the global StepTime value (set by the
!*    user through and edit field.  The function returns a boolean
!*    value so that the calling procedure can determine if it wants
!*    to continue processing or break.
!*
!*************************************************************************/


integer*4 function RepStat (API, retCode)
!MS$ ATTRIBUTES VALUE :: retcode 
use setinc
integer*4       retCode
character*(*)   API 

character*40    TempBufL
if (retCode <= 0 ) then
    retCode = GetLastError()
else
    retCode = 0
end if

if (retCode .NE. 0) then
    ret = MessageBeep(0)
end if

select case (retCode)
    case (ERROR_INVALID_FUNCTION)   !// 1L
      TempBufL = "ERROR_INVALID_FUNCTION"C

    case (ERROR_FILE_NOT_FOUND)     !// 2L
      TempBufL = "ERROR_FILE_NOT_FOUND"C

    case (ERROR_ACCESS_DENIED)      !// 5L
      TempBufL = "ERROR_ACCESS_DENIED"C

    case (ERROR_INVALID_HANDLE)     !// 6L
      TempBufL = "ERROR_INVALID_HANDLE"C

    case (ERROR_INVALID_PARAMETER)  !// 87L
      TempBufL = "ERROR_INVALID_HANDLE"C

    case (ERROR_INVALID_NAME)       !// 123L
      TempBufL = "ERROR_INVALID_NAME"C

    case DEFAULT
      write(TempBufL, '(I5)') retCode

end select

ret = SendMessage (hWndDlg, WM_REPSTAT, LOC(API), LOC(TempBufL))
call Sleep( StepTime )
if (retcode .NE. 0) then
    RepStat = 1
else
    RepStat = 0
end if
return
end
