!****************************************************************************
!*
!* FUNCTION: ExamineMask
!*
!****************************************************************************

subroutine ExamineMask  (amMask, lpszOldIndent, kamKindOfMask)
!MS$ ATTRIBUTES VALUE :: amMask
!MS$ ATTRIBUTES VALUE :: kamKindOfMask
!MS$ATTRIBUTES  REFERENCE :: lpszOldIndent
use chksdinc
integer*4       amMask
character*(*)   lpszOldIndent
integer*4       kamKindOfMask

character*(SZ_INDENT_BUF)   ucIndentBuf
character*(SZ_INDENT_BUF)   ucIndentBitsBuf
integer*4   dwGenericBits
integer*4   dwStandardBits
integer*4   dwSpecificBits
integer*4   dwAccessSystemSecurityBit
integer*4   dwExtraBits
integer*4   ret
character*100  lpszTempBuffer

ucIndentBitsBuf = ""C
ucIndentBuf = ""C
lpsztempBuffer = "  "C
ret = lstrcpy (ucIndentBuf, lpszOldIndent)
lpszTempBuffer = "                            "C
ret = lstrcat (ucIndentBuf, lpszTempBuffer)
ret = lstrcpy (ucIndentBitsBuf, lpszOldIndent)
ret = lstrcat (ucIndentBitsBuf, ""C)

dwStandardBits = IAND(amMask,STANDARD_RIGHTS_ALL_THE_BITS)
dwSpecificBits = IAND(amMask, SPECIFIC_RIGHTS_ALL)
dwAccessSystemSecurityBit = IAND(amMask,ACCESS_SYSTEM_SECURITY)
dwGenericBits = IAND(amMask, GENERIC_RIGHTS_ALL_THE_BITS )

!**************************************************************************
!*
!* Print then decode the standard rights bits
!*
!**************************************************************************

write(*,*) ucIndentBuf,dwStandardBits
10    FORMAT (A25,'Standard Rights        == 0x', Z8)

if (dwStandardBits .NE. 0) then
    if (IAND(dwStandardBits , DELETE ) == DELETE  ) then
        write(*,100) ucIndentBitsBuf
100           FORMAT(A25,'0x00010000 DELETE  ')
    end if
    if (IAND(dwStandardBits , READ_CONTROL ) == READ_CONTROL )  &
     then
        write(*,200) ucIndentBitsBuf
200           FORMAT(A25,'0x00020000 READ_CONTROL  ')
    end if
    if (IAND(dwStandardBits , STANDARD_RIGHTS_READ ) ==         &
            STANDARD_RIGHTS_READ    ) then
        write(*,300) ucIndentBitsBuf
300           FORMAT(A25, '0x00020000 STANDARD_RIGHTS_READ    ')
    end if
    if (IAND(dwStandardBits , STANDARD_RIGHTS_WRITE ) ==        &
            STANDARD_RIGHTS_WRITE   ) then
        write(*,400) ucIndentBitsBuf
400           FORMAT(A25, '0x00020000 STANDARD_RIGHTS_WRITE   ')
    end if
    if (IAND(dwStandardBits , STANDARD_RIGHTS_EXECUTE ) ==      &
            STANDARD_RIGHTS_EXECUTE ) then
        write(*,500) ucIndentBitsBuf
500           FORMAT(A25, '0x00020000 STANDARD_RIGHTS_EXECUTE ')
    end if
    if (IAND(dwStandardBits , WRITE_DAC ) == WRITE_DAC ) then
        write(*,600) ucIndentBitsBuf
600           FORMAT(A25, '0x00040000 WRITE_DAC               ')
    end if
    if (IAND(dwStandardBits , WRITE_OWNER ) == WRITE_OWNER) then
        write(*,700) ucIndentBitsBuf
700           FORMAT(A25, '0x00080000 WRITE_OWNER             ')
    end if
    if (IAND(dwStandardBits , SYNCHRONIZE ) == SYNCHRONIZE) then
        write(*,800) ucIndentBitsBuf
800           FORMAT(A25, '0x00100000 SYNCHRONIZE             ')
    end if
    if (IAND(dwStandardBits , STANDARD_RIGHTS_REQUIRED) ==      &
                STANDARD_RIGHTS_REQUIRED) then
        write(*,900) ucIndentBitsBuf
900           FORMAT(A25, '0x000F0000 STANDARD_RIGHTS_REQUIRED')
    end if
    if (IAND(dwStandardBits , STANDARD_RIGHTS_ALL ) ==          &
                STANDARD_RIGHTS_ALL ) then
        write(*,1000) ucIndentBitsBuf
1000          FORMAT(A25, '0x001F0000 STANDARD_RIGHTS_ALL     ')
    end if

    dwExtraBits = IAND(dwStandardBits , ( NOT( IOR(DELETE,        &
                                     IOR( READ_CONTROL,           &
                                     IOR( STANDARD_RIGHTS_READ,   &
                                     IOR( STANDARD_RIGHTS_WRITE,  &
                                     IOR(STANDARD_RIGHTS_EXECUTE, &
                                     IOR( WRITE_DAC,              &
                                     IOR( WRITE_OWNER,            &
                                     IOR( SYNCHRONIZE,            &
                                     IOR(STANDARD_RIGHTS_REQUIRED,&
                                   STANDARD_RIGHTS_ALL))))))))))))
    if (dwExtraBits .NE. 0) then
        write(*,1100) ucIndentBuf,dwExtraBits
1100          FORMAT(A25, 'Extra AceFlag bits  == #', Z8,             &
 '<- This is a problem, should be all zeros')
    end if
end if

!**************************************************************************\
!*
!* Print then decode the specific rights bits
!*
!**************************************************************************/

write(*,*) ucIndentBuf,dwSpecificBits
1900  FORMAT (A25, 'Specific Rights        == #', Z8)

if (dwSpecificBits .NE. 0) then
    if  (FileAccessMask == kamKindOfMask) then
        if (IAND(dwSpecificBits , FILE_READ_DATA ) ==           &
                    FILE_READ_DATA           ) then
            write(*,*) ucIndentBitsBuf
2000             FORMAT (A25, '0x00000001 FILE_READ_DATA (file & pipe)')
        end if
        if (IAND(dwSpecificBits , FILE_LIST_DIRECTORY ) ==      &
                    FILE_LIST_DIRECTORY      ) then
            write(*,*) ucIndentBitsBuf
2100              FORMAT (A25, '0x00000001 FILE_LIST_DIRECTORY          &
 (directory)       ')
        end if
        if (IAND(dwSpecificBits , FILE_WRITE_DATA          ) == &
                FILE_WRITE_DATA          ) then
            write(*,*) ucIndentBitsBuf
2200              FORMAT (A25, '0x00000002 FILE_WRITE_DATA              &
(file & pipe)     ')
        end if
        if (IAND(dwSpecificBits , FILE_ADD_FILE            ) == &
                FILE_ADD_FILE            ) then
            write(*,*) ucIndentBitsBuf
2300              FORMAT (A25, '0x00000002 FILE_ADD_FILE                &
 (directory)       ')
        end if
        if (IAND(dwSpecificBits , FILE_APPEND_DATA         ) == &
                FILE_APPEND_DATA         ) then
            write(*,*) ucIndentBitsBuf
2400              FORMAT (A25, '0x00000004 FILE_APPEND_DATA  file)   ')
        end if
        if (IAND(dwSpecificBits , FILE_ADD_SUBDIRECTORY    ) == &
                FILE_ADD_SUBDIRECTORY    ) then
            write(*,*) ucIndentBitsBuf
2500              FORMAT (A25, '0x00000004 FILE_ADD_SUBDIRECTORY        &
 (directory)       ')
        end if
        if (IAND(dwSpecificBits , FILE_CREATE_PIPE_INSTANCE)  ==&
                    FILE_CREATE_PIPE_INSTANCE) then
            write(*,*) ucIndentBitsBuf
2600              FORMAT (A25, '0x00000004 FILE_CREATE_PIPE_INSTANCE (  &
 named pipe)      ')
        end if
        if (IAND(dwSpecificBits , FILE_READ_EA ) == FILE_READ_EA&
  ) then
            write(*,*) ucIndentBitsBuf
2700              FORMAT (A25, '0x00000008 FILE_READ_EA                 &
 (file & directory)')
        end if
      if (IAND(dwSpecificBits , FILE_WRITE_EA ) == FILE_WRITE_EA&           
       ) then
            write(*,*) ucIndentBitsBuf
2800              FORMAT (A25, '0x00000010 FILE_WRITE_EA                &
 (file & directory)')
        end if
        if (IAND(dwSpecificBits , FILE_EXECUTE ) == FILE_EXECUTE&            
       ) then
            write(*,*) ucIndentBitsBuf
2900              FORMAT (A25, '0x00000020 FILE_EXECUTE (file)    ')
        end if
        if (IAND(dwSpecificBits , FILE_TRAVERSE  ) ==           &
                FILE_TRAVERSE            ) then
            write(*,*) ucIndentBitsBuf
2110              FORMAT (A25, '0x00000020 FILE_TRAVERSE (directory) ')
        end if
        if (IAND(dwSpecificBits , FILE_DELETE_CHILD        ) == &
                FILE_DELETE_CHILD        ) then
            write(*,*) ucIndentBitsBuf
2120            FORMAT (A25, '0x00000040 FILE_DELETE_CHILD (directory)')
        end if
        if (IAND(dwSpecificBits , FILE_READ_ATTRIBUTES     ) == &
                FILE_READ_ATTRIBUTES     ) then
            write(*,*) ucIndentBitsBuf
2130            FORMAT (A25, '0x00000080 FILE_READ_ATTRIBUTES  (all) ')
        end if
        if (IAND(dwSpecificBits , FILE_WRITE_ATTRIBUTES    ) == &
                FILE_WRITE_ATTRIBUTES    ) then
            write(*,*) ucIndentBitsBuf
2140              FORMAT (A25, '0x00000100 FILE_WRITE_ATTRIBUTES(all) ')
        end if

        if (IAND(IOR(dwStandardBits , dwSpecificBits   )          &
         , INT4(FILE_ALL_ACCESS)     ) == FILE_ALL_ACCESS     ) then
            write(*,*) ucIndentBitsBuf
2150  FORMAT (A25, '0x001F01FF FILE_ALL_ACCESS      == (STANDARD_RIGHTS_&
REQUIRED | SYNCHRONIZE | 0x1FF)')
        end if
        if (IAND(IOR(dwStandardBits , dwSpecificBits   )          &
           , INT4(FILE_GENERIC_READ )  ) == FILE_GENERIC_READ   ) then
            write(*,*) ucIndentBitsBuf
2160  FORMAT (A25, '0x00120089 FILE_GENERIC_READ    == (STANDARD_RIGH   &
TS_READ | FILE_READ_DATA | FILE_READ_ATTRIBUTES | FILE_READ_EA |  &
SYNCHRONIZE)')
        end if
        if (IAND(IOR(dwStandardBits , dwSpecificBits   )          &
          , INT4(FILE_GENERIC_WRITE)  ) == FILE_GENERIC_WRITE  ) then
            write(*,*) ucIndentBitsBuf
2170  FORMAT (A25, '0x00120116 FILE_GENERIC_WRITE   == (STANDARD_RIGHTS_&
WRITE | FILE_WRITE_DATA | FILE_WRITE_ATTRIBUTES | FILE_WRITE_EA | &
FILE_APPEND_DATA | SYNCHRONIZE)')
        end if
        if (IAND(IOR(dwStandardBits , dwSpecificBits   )          &
           , INT4(FILE_GENERIC_EXECUTE)) == FILE_GENERIC_EXECUTE) then
            write(*,*) ucIndentBitsBuf
2180            FORMAT (A25, '0x001200A0 FILE_GENERIC_EXECUTE == (STANDARD_RIGHTS_EXECUTE | FILE_READ_ATTRIBUTES | FILE_EXECUTE | SYNCHRONIZE)')
        end if

        dwExtraBits =IAND(dwSpecificBits ,                        &
                                    (NOT(IOR(FILE_READ_DATA,      &
                                   IOR(FILE_LIST_DIRECTORY,       &
                                   IOR(FILE_WRITE_DATA,           &
                                   IOR(FILE_ADD_FILE,             &
                                   IOR(FILE_APPEND_DATA,          &
                                   IOR(FILE_ADD_SUBDIRECTORY,     &
                                   IOR(FILE_CREATE_PIPE_INSTANCE, &
                                   IOR(FILE_READ_EA,              &
                                   IOR(FILE_WRITE_EA,             &
                                   IOR(FILE_EXECUTE,              &
                                   IOR(FILE_TRAVERSE,             &
                                   IOR(FILE_DELETE_CHILD,         &
                                   IOR(FILE_READ_ATTRIBUTES,      &
                                   IOR(FILE_WRITE_ATTRIBUTES,     &
                   IOR(IAND(INT4(FILE_ALL_ACCESS),SPECIFIC_RIGHTS_ALL), &
                 IOR(IAND(INT4(FILE_GENERIC_READ),SPECIFIC_RIGHTS_ALL), &
                IOR(IAND(INT4(FILE_GENERIC_WRITE),SPECIFIC_RIGHTS_ALL), &
                IAND(INT4(FILE_GENERIC_EXECUTE),                        &
                SPECIFIC_RIGHTS_ALL)))))))))))))))))))))
        if (dwExtraBits .NE. 0) then
            write(*,*) ucIndentBuf,dwExtraBits
3000  FORMAT (A25, 'Extra specific bits    == #', Z8,' <-This is a probl&
em, should be all 0s')
        end if
    else if (ProcessAccessMask  == kamKindOfMask) then
        if (IAND(dwSpecificBits , PROCESS_TERMINATE ) ==        &
            PROCESS_TERMINATE        ) then
            write(*,3010) ucIndentBitsBuf
3010              FORMAT (A25, '0x00000001 PROCESS_TERMINATE        ')
        end if
        if (IAND(dwSpecificBits , PROCESS_CREATE_THREAD    ) == &
            PROCESS_CREATE_THREAD    ) then
            write(*,3020) ucIndentBitsBuf
3020              FORMAT (A25, '0x00000002 PROCESS_CREATE_THREAD    ')
        end if
        if (IAND(dwSpecificBits , PROCESS_VM_OPERATION     ) == &
            PROCESS_VM_OPERATION     ) then
            write(*,3030) ucIndentBitsBuf
3030              FORMAT (A25, '0x00000008 PROCESS_VM_OPERATION     ')
        end if
        if (IAND(dwSpecificBits , PROCESS_VM_READ          ) == &
            PROCESS_VM_READ          ) then
            write(*,3040) ucIndentBitsBuf
3040              FORMAT (A25, '0x00000010 PROCESS_VM_READ          ')
        end if
        if (IAND(dwSpecificBits , PROCESS_VM_WRITE         ) == &
            PROCESS_VM_WRITE         ) then
            write(*,3050) ucIndentBitsBuf
3050              FORMAT (A25, '0x00000020 PROCESS_VM_WRITE         ')
        end if
        if (IAND(dwSpecificBits , PROCESS_DUP_HANDLE       ) == &
            PROCESS_DUP_HANDLE       ) then
            write(*,3060) ucIndentBitsBuf
3060              FORMAT (A25, '0x00000040 PROCESS_DUP_HANDLE       ')
        end if
        if (IAND(dwSpecificBits , PROCESS_CREATE_PROCESS   ) == &
            PROCESS_CREATE_PROCESS   ) then
            write(*,3070) ucIndentBitsBuf
3070              FORMAT (A25, '0x00000080 PROCESS_CREATE_PROCESS   ')
        end if
        if (IAND(dwSpecificBits , PROCESS_SET_INFORMATION  ) == &
            PROCESS_SET_INFORMATION  ) then
            write(*,3080) ucIndentBitsBuf
3080              FORMAT (A25, '0x00000200 PROCESS_SET_INFORMATION  ')
        end if
        if (IAND(dwSpecificBits , PROCESS_QUERY_INFORMATION)  ==&
            PROCESS_QUERY_INFORMATION) then
            write(*,3090) ucIndentBitsBuf
3090              FORMAT (A25, '0x00000400 PROCESS_QUERY_INFORMATION')
        end if

        if (IAND(IOR(dwStandardBits , dwSpecificBits )            &
            , INT4(PROCESS_ALL_ACCESS))  == PROCESS_ALL_ACCESS) then
            write(*,3100) ucIndentBitsBuf
3100              FORMAT (A25, '0x001F0FFF PROCESS_ALL_ACCESS == (STANDA&
RD_RIGHTS_REQUIRED | SYNCHRONIZE | 0x00000FFF) ')
        end if

        dwExtraBits =IAND(dwSpecificBits,                         &
                                   (NOT(IOR(PROCESS_TERMINATE,    &
                                   IOR(PROCESS_CREATE_THREAD,     &
                                   IOR(PROCESS_VM_OPERATION,      &
                                   IOR(PROCESS_VM_READ,           &
                                   IOR(PROCESS_VM_WRITE,          &
                                   IOR(PROCESS_DUP_HANDLE,        &
                                   IOR(PROCESS_CREATE_PROCESS,    &
                                   IOR(PROCESS_SET_INFORMATION,   &
                                   IOR(PROCESS_QUERY_INFORMATION, &
                                   IAND(INT4(PROCESS_ALL_ACCESS),       &
                                  SPECIFIC_RIGHTS_ALL)))))))))))))
        if (dwExtraBits .NE. 0) then
            write(*,*) ucIndentBuf,dwExtraBits
4000  FORMAT (A25, 'Extra specific bits    == #', Z8 '<-This is a proble&
m, should be all 0s')
        end if
    else if (WindowStationAccessMask == kamKindOfMask) then
        if (IAND(dwSpecificBits , WINSTA_ENUMDESKTOPS     ) ==  &
                WINSTA_ENUMDESKTOPS     ) then
            write(*,4010) ucIndentBitsBuf
4010              FORMAT (A25, '0x00000001 WINSTA_ENUMDESKTOPS     ')
        end if
        if (IAND(dwSpecificBits , WINSTA_READATTRIBUTES   ) ==  &
                WINSTA_READATTRIBUTES   ) then
            write(*,4020) ucIndentBitsBuf
4020              FORMAT (A25, '0x00000002 WINSTA_READATTRIBUTES   ')
        end if
        if (IAND(dwSpecificBits , WINSTA_ACCESSCLIPBOARD  ) ==  &
                WINSTA_ACCESSCLIPBOARD  ) then
            write(*,4030) ucIndentBitsBuf
4030              FORMAT (A25, '0x00000004 WINSTA_ACCESSCLIPBOARD  ')
        end if
        if (IAND(dwSpecificBits , WINSTA_CREATEDESKTOP    ) ==  &
            WINSTA_CREATEDESKTOP    ) then
            write(*,4040) ucIndentBitsBuf
4040              FORMAT (A25, '0x00000008 WINSTA_CREATEDESKTOP    ')
        end if
        if (IAND(dwSpecificBits , WINSTA_WRITEATTRIBUTES  ) ==  &
                WINSTA_WRITEATTRIBUTES  ) then
            write(*,4050) ucIndentBitsBuf
4050              FORMAT (A25, '0x00000010 WINSTA_WRITEATTRIBUTES  ')
        end if
        if (IAND(dwSpecificBits , WINSTA_ACCESSGLOBALATOMS) ==  &
                WINSTA_ACCESSGLOBALATOMS) then
            write(*,4060) ucIndentBitsBuf
4060              FORMAT (A25, '0x00000020 WINSTA_ACCESSGLOBALATOMS')
        end if
        if (IAND(dwSpecificBits , WINSTA_EXITWINDOWS      ) ==  &
            WINSTA_EXITWINDOWS      ) then
            write(*,4070) ucIndentBitsBuf
4070              FORMAT (A25, '0x00000040 WINSTA_EXITWINDOWS      ')
        end if
        if (IAND(dwSpecificBits , WINSTA_ENUMERATE        ) ==  &
            WINSTA_ENUMERATE        ) then
            write(*,4080) ucIndentBitsBuf
4080              FORMAT (A25, '0x00000100 WINSTA_ENUMERATE        ')
        end if
        if (IAND(dwSpecificBits , WINSTA_READSCREEN       ) ==  &
            WINSTA_READSCREEN       ) then
            write(*,4090) ucIndentBitsBuf
4090              FORMAT (A25, '0x00000200 WINSTA_READSCREEN       ')
        end if

        dwExtraBits = IAND(dwSpecificBits,                        &
                                    (NOT(IOR(WINSTA_ENUMDESKTOPS, &
                                    IOR(WINSTA_READATTRIBUTES,    &
                                    IOR(WINSTA_ACCESSCLIPBOARD,   &
                                    IOR(WINSTA_CREATEDESKTOP,     &
                                    IOR(WINSTA_WRITEATTRIBUTES,   &
                                    IOR(WINSTA_ACCESSGLOBALATOMS, &
                                    IOR(WINSTA_EXITWINDOWS,       &
                                    IOR(WINSTA_ENUMERATE,         &
                                    WINSTA_READSCREEN)))))))))))
        if (dwExtraBits .NE. 0) then
            write(*,5000) ucIndentBuf,dwExtraBits
5000  FORMAT (A25, 'Extra specific bits    == #', Z8 '<-This is a proble&
m, should be all 0s')
        end if
    else if (RegKeyAccessMask   == kamKindOfMask) then
        if (IAND(dwSpecificBits , KEY_QUERY_VALUE       ) ==    &
            KEY_QUERY_VALUE       ) then
            write(*,5010) ucIndentBitsBuf
5010              FORMAT (A25, '0x00000001 KEY_QUERY_VALUE       ')
        end if
        if (IAND(dwSpecificBits , KEY_SET_VALUE         ) ==    &
            KEY_SET_VALUE         ) then
            write(*,5020) ucIndentBitsBuf
5020              FORMAT (A25, '0x00000002 KEY_SET_VALUE         ')
        end if
        if (IAND(dwSpecificBits , KEY_CREATE_SUB_KEY    ) ==    &
            KEY_CREATE_SUB_KEY    ) then
            write(*,5030) ucIndentBitsBuf
5030              FORMAT (A25, '0x00000004 KEY_CREATE_SUB_KEY    ')
        end if
        if (IAND(dwSpecificBits , KEY_ENUMERATE_SUB_KEYS) ==    &
            KEY_ENUMERATE_SUB_KEYS) then
            write(*,5040) ucIndentBitsBuf
5040              FORMAT (A25, '0x00000008 KEY_ENUMERATE_SUB_KEYS')
        end if
        if (IAND(dwSpecificBits , KEY_NOTIFY            ) ==    &
            KEY_NOTIFY            ) then
            write(*,5050) ucIndentBitsBuf
5050              FORMAT (A25, '0x00000010 KEY_NOTIFY            ')
        end if
        if (IAND(dwSpecificBits , KEY_CREATE_LINK       ) ==    &
            KEY_CREATE_LINK       ) then
            write(*,5060) ucIndentBitsBuf
5060              FORMAT (A25, '0x00000020 KEY_CREATE_LINK       ')
        end if

        if (IAND(IOR(dwStandardBits , dwSpecificBits   )          &
            , KEY_READ      ) == KEY_READ      ) then
            write(*,5070) ucIndentBitsBuf
5070    FORMAT (A25, '0x00020019 KEY_READ       == ((STANDARD_RIGHTS_REA&
D | KEY_QUERY_VALUE | KEY_ENUMERATE_SUB_KEYS | KEY_NOTIFY) & (~SYN&
CHRONIZE))')
        end if
        if (IAND(IOR(dwStandardBits , dwSpecificBits   )          &
            , KEY_WRITE     ) == KEY_WRITE     ) then
            write(*,5080) ucIndentBitsBuf
5080              FORMAT (A25, '0x00020006 KEY_WRITE    == ((STANDARD_RI&
GHTS_WRITE | KEY_SET_VALUE|KEY_CREATE_SUB_KEY) & (~SYNCHRONIZE))')
        end if
        if (IAND(IOR(dwStandardBits , dwSpecificBits   )          &
            , KEY_EXECUTE   ) == KEY_EXECUTE   ) then
            write(*,5090) ucIndentBitsBuf
5090              FORMAT (A25, '0x00020019 KEY_EXECUTE    == ((KEY_READ)& 
(~SYNCHRONIZE))')
        end if
        if (IAND(IOR(dwStandardBits , dwSpecificBits )            &
            , KEY_ALL_ACCESS) ==KEY_ALL_ACCESS) then
            write(*,5100) ucIndentBitsBuf
5100            FORMAT (A25, '0x000F003F KEY_ALL_ACCESS == ((STANDARD_RI&
GHTS_ALL | KEY_QUERY_VALUE | KEY_SET_VALUE | KEY_CREATE_SUB_KEY | &
KEY_ENUMERATE_SUB_KEYS | KEY_NOTIFY | KEY_CREATE_LINK) & (~SYNCHRO&
NIZE))')
        end if

        dwExtraBits = IAND(dwSpecificBits,                        &
                                    (NOT(IOR(KEY_QUERY_VALUE,     &
                                    IOR(KEY_SET_VALUE,            &
                                    IOR(KEY_CREATE_SUB_KEY,       &
                                    IOR(KEY_ENUMERATE_SUB_KEYS,   &
                                    IOR(KEY_NOTIFY,               &
                                    IOR(KEY_CREATE_LINK,          &
                  IOR(IAND(KEY_READ,SPECIFIC_RIGHTS_ALL),         &
                  IOR(IAND(KEY_WRITE,SPECIFIC_RIGHTS_ALL),        &
                  IOR(IAND(KEY_EXECUTE,SPECIFIC_RIGHTS_ALL),      &
          IAND(KEY_ALL_ACCESS , SPECIFIC_RIGHTS_ALL)))))))))))))
        if (dwExtraBits .NE. 0) then
            write(*,6000) ucIndentBuf,dwExtraBits
6000  FORMAT (A25, 'Extra specific bits    == #', Z8 '<-This is a proble&
m, should be all 0s')
        end if
    else if (ServiceAccessMask  == kamKindOfMask) then
        if (IAND(dwSpecificBits , INT4(SERVICE_QUERY_CONFIG)) ==      &
            INT4(SERVICE_QUERY_CONFIG) ) then
            write(*,6010) ucIndentBitsBuf
6010              FORMAT (A25,'0x00000001 SERVICE_QUERY_CONFIG        ')
        end if
        if (IAND(dwSpecificBits , INT4(SERVICE_CHANGE_CONFIG )) ==    &
            INT4(SERVICE_CHANGE_CONFIG     )  ) then
            write(*,6020) ucIndentBitsBuf
6020              FORMAT (A25,'0x00000002 SERVICE_CHANGE_CONFIG       ')
        end if
        if (IAND(dwSpecificBits , INT4(SERVICE_QUERY_STATUS)) ==      &
            INT4(SERVICE_QUERY_STATUS      )  ) then
            write(*,6030) ucIndentBitsBuf
6030            FORMAT (A25, '0x00000004 SERVICE_QUERY_STATUS        ')
        end if
        if (IAND(dwSpecificBits , INT4(SERVICE_ENUMERATE_DEPENDENTS) )  &
            ==  SERVICE_ENUMERATE_DEPENDENTS) then
            write(*,6040) ucIndentBitsBuf
6040            FORMAT (A25, '0x00000008 SERVICE_ENUMERATE_DEPENDENTS')
        end if
        if (IAND(dwSpecificBits , INT4(SERVICE_START)) ==             &
            INT4(SERVICE_START             )  ) then
            write(*,6050) ucIndentBitsBuf
6050            FORMAT (A25, '0x00000010 SERVICE_START               ')
        end if
        if (IAND(dwSpecificBits , INT4(SERVICE_STOP)) ==              &
            INT4(SERVICE_STOP              )  ) then
            write(*,6060) ucIndentBitsBuf
6060            FORMAT (A25, '0x00000020 SERVICE_STOP                ')
        end if
        if (IAND(dwSpecificBits , INT4(SERVICE_PAUSE_CONTINUE) ) ==   &
            INT4(SERVICE_PAUSE_CONTINUE    )  ) then
            write(*,6070) ucIndentBitsBuf
6070            FORMAT (A25, '0x00000040 SERVICE_PAUSE_CONTINUE      ')
        end if
        if (IAND(dwSpecificBits , INT4(SERVICE_INTERROGATE)) ==       &
            INT4(SERVICE_INTERROGATE       )  ) then
            write(*,6080) ucIndentBitsBuf
6080            FORMAT (A25, '0x00000080 SERVICE_INTERROGATE         ')
        end if
        if (IAND(dwSpecificBits ,INT4(SERVICE_USER_DEFINED_CONTROL))==&
            INT4(SERVICE_USER_DEFINED_CONTROL)) then
            write(*,6090) ucIndentBitsBuf
6090            FORMAT (A25, '0x00000100 SERVICE_USER_DEFINED_CONTROL')
        end if

        if (IAND(IOR(dwStandardBits,dwSpecificBits )              &
            ,INT4(SERVICE_ALL_ACCESS)) == SERVICE_ALL_ACCESS) then
            write(*,6100) ucIndentBitsBuf
6100            FORMAT (A25, '0x000F01FF SERVICE_ALL_ACCESS == (STANDARD&
_RIGHTS_REQUIRED | SERVICE_QUERY_CONFIG | SERVICE_CHANGE_CONFIG|')
            write(*,*) 'SERVICE_QUERY_STATUS | SERVICE_ENUMERATE_D&
EPENDENTS | SERVICE_START | SERVICE_STOP | SERVICE_PAUSE_CONTINUE &
| SERVICE_INTERROGATE | SERVICE_USER_DEFINED_CONTROL)' 
        end if

        dwExtraBits = IAND(dwSpecificBits,                        &
                                    (NOT(IOR(INT4(SERVICE_QUERY_CONFIG),&
                                     IOR(INT4(SERVICE_CHANGE_CONFIG),   &
                                     IOR(INT4(SERVICE_QUERY_STATUS),    &
                                     IOR(INT4(SERVICE_ENUMERATE_DEPENDENTS),&
                                     IOR(INT4(SERVICE_START),           &
                                     IOR(INT4(SERVICE_STOP),            &
                                     IOR(INT4(SERVICE_PAUSE_CONTINUE),  &
                                     IOR(INT4(SERVICE_INTERROGATE),     &
                                 IOR(INT4(SERVICE_USER_DEFINED_CONTROL),&
         IAND(INT4(SERVICE_ALL_ACCESS),SPECIFIC_RIGHTS_ALL)))))))))))))
        if (dwExtraBits .NE. 0) then
            write(*,7000) ucIndentBuf,dwExtraBits
7000  FORMAT (A25, 'Extra specific bits    == #', Z8 '<-This is a proble&
m, should be all 0s')
        end if
    else if(DefDaclInAccessTokenAccessMsk == kamKindOfMask)     &
                        then
        write(*,7020) ucIndentBitsBuf
7020          FORMAT (A25, 'Specific bits in default Dacl(s) in token   &
not broken down into defines')
    else
        write(*,*) ucIndentBuf, 'You will need to write some code &
(such as that directly'
        write(*,*) ucIndentBuf, '  above the code that wrote out t&
his message) to decode'
        write(*,*) ucIndentBuf, '  this kind of access mask'
    end if
end if

!**************************************************************************
!*
!* Print then decode the ACCESS_SYSTEM_SECURITY bit
!*
!**************************************************************************

write(*,*) ucIndentBuf,dwAccessSystemSecurityBit
7500  FORMAT(A25, 'Access System Security == #', Z8)

!**************************************************************************
!*
!* Print then decode the generic rights bits, which will rarely be on
!*
!* Generic bits are nearly always mapped by Windows NT before it tries to do
!*   anything with them.  You can ignore the fact that generic bits are
!*   special in any way, although it helps to keep track of what the mappings
!*   are so that you don't have any surprises
!*
!* The only time the generic bits are not mapped immediately is if they are
!*   placed in an inheritable ACE in an ACL, or in an ACL that will be
!*   assigned by default (such as the default DACL in an access token).  In
!*   that case they're mapped when the child object is created (or when the
!*   default DACL is used at object creation time)
!*
!**************************************************************************
write(*,*) ucIndentBuf,dwGenericBits
7600  FORMAT(A25, 'Access System Security == #', Z8)

if (dwGenericBits .NE. 0) then
    if (IAND(dwGenericBits, GENERIC_READ) == GENERIC_READ) then
        write(*,7700) ucIndentBitsBuf
7700          FORMAT (A25, '0x80000000 GENERIC_READ   ')
    end if
    if (IAND(dwGenericBits,GENERIC_WRITE) == GENERIC_WRITE) then
        write(*,7710) ucIndentBitsBuf
7710          FORMAT (A25, '0x40000000 GENERIC_WRITE  ')
    end if
    if (IAND(dwGenericBits,GENERIC_EXECUTE) == GENERIC_EXECUTE) &
                then
        write(*,7720) ucIndentBitsBuf
7720          FORMAT (A25, '0x20000000 GENERIC_EXECUTE')
    end if
    if (IAND(dwGenericBits,GENERIC_ALL) == GENERIC_ALL    ) then
        write(*,7730) ucIndentBitsBuf
7730          FORMAT (A25, '0x10000000 GENERIC_ALL    ')
    end if

    dwExtraBits = IAND(dwGenericBits,(NOT(IOR(GENERIC_READ,       &
                                 IOR(GENERIC_WRITE,               &
                                 IOR(GENERIC_EXECUTE,             &
                                   GENERIC_ALL))))))
    if (dwExtraBits .NE. 0) then
        write(*,8000) ucIndentBuf,dwExtraBits
8000  FORMAT (A25, 'Extra specific bits    == #', Z8 '<-This is a proble&
m, should be all 0s')
    end if
end if
end

!****************************************************************************\
!*
!* FUNCTION: LookupSIDName
!*
!****************************************************************************/

integer*4 function LookupSIDName(psidSID, lpszOldIndent)
!MS$ ATTRIBUTES VALUE :: psidSID
use chksdinc
use msfwin
integer*4       psidSID
character*(*)   lpszOldIndent

interface
integer(4) function SIDStringName(psidSID, lpszSIDStringName) 
!MS$ ATTRIBUTES VALUE :: psidSID
integer*4       psidSID 
character*(*)   lpszSIDStringName 
end function
end interface


character*(SZ_INDENT_BUF)       ucIndentBuf  
character*(SZ_ACCT_NAME_BUF)    ucNameBuf 
integer*4                       dwNameLength 
character*(SZ_DMN_NAME_BUF)     ucDomainNmBuf 
integer*4                       dwDNameLength 
character*(SZ_SID_STRING_BUF)   ucSIDStringBuf 
integer*4                       peAcctNameUse
integer*4                       dwLookupStatus
integer*4                       bGtBadLokupThatsNotLoclLgonSID
character*100                   lpszTempBuffer
integer*4                       PtrVal

ucIndentBuf   = ''C
ucNameBuf  = ''C
dwNameLength  = SZ_ACCT_NAME_BUF
dwDNameLength = SZ_DMN_NAME_BUF
ucDomainNmBuf  = ""C
ucSIDStringBuf = ""C
peAcctNameUse = SidTypeInvalid


PtrVal = LOC(lpszOldIndent)
if (PtrVal .ne. 0) then
    ret = lstrcpy (ucIndentBuf, lpszOldIndent)
end if
lpszTempBuffer = "  "C
ret = lstrcat (ucIndentBuf, lpszTempBuffer)

if (IsValidSid(psidSID) .EQV. .FALSE.) then
    call PERR("IsValid")
    LookupSIDName = 0
    return
end if

if (SIDStringName(psidSID, ucSIDStringBuf) == 0) then
    call PERR("SIDStringName")
    LookupSIDName = 0
    return
end if
if (LookupAccountSid(                 &                            
          NULL_CHARACTER,             &       ! Look on local machine               
          psidSID,                    &                            
          ucNameBuf,                  &                            
          LOC(dwNameLength),          &                            
          ucDomainNmBuf,              &                            
          LOC(dwDNameLength),         &                            
          LOC(peAcctNameUse)) .EQV. .FALSE.) then
    dwLookupStatus = GetLastError()


!************************************************************************\
!*
!* Got a bad Lookup, so check is SID the Local Logon SID?
!*
!* The problem is that LookupAccountSid api will find all the well-known
!*   SIDs except the Local Logon SID.  The last two sub-authorities are
!*   always different, so to check to see if the SID we're looking at is
!*   the Local Logon SID, we take the psidLogonIdsSid variable we built at
!*   initialization time, and blast into it's last two sub-authorities the
!*   last two sub-authorities that we have.  Then compare for EqualSid
!*
!************************************************************************/

    ! Must have same number of sub authorities

    bGtBadLokupThatsNotLoclLgonSID = FALSE  ! Assume the best :)

    i = GetSidSubAuthorityCount(psidLogonIdsSid)
    i1 = GetSidSubAuthorityCount(psidSID)

    if (i .NE. i1) then
     ! Not same number of sub-authorities, so can't be a match
        bGtBadLokupThatsNotLoclLgonSID = TRUE
    else
      ! Force the last two sub-authorities to match
        i = GetSidSubAuthority( psidLogonIdsSid, 1 )
        i1 = GetSidSubAuthority( psidSID, 1 )
        call CopyMemory(i, i1, 4)
        i = GetSidSubAuthority( psidLogonIdsSid, 2)
        i1 = GetSidSubAuthority( psidSID, 2)
        call CopyMemory(i, i1,4)

!**********************************************************************
!*
!* EqualPrefixSid could be used instead if we want to blast in all but
!*   the last sub-authority.  For demonstration purposes, as long as we
!*   did one of the two previous assignment statements, we may as well to
!*   the other and use EqualSID
!*
!**********************************************************************

        if (EqualSid(LOC(psidSID),LOC(psidLogonIdsSid)) .NEQV. .FALSE.) then
            write(*,9000) ucIndentBuf,ucSIDStringBuf
9000              FORMAT (A25,'SID is the Local Logon SID', A25)
        else
            bGtBadLokupThatsNotLoclLgonSID = TRUE
        end if
    end if
    if (bGtBadLokupThatsNotLoclLgonSID .NE. 0) then

!**********************************************************************\
!*
!* ERROR_NONE_MAPPED means account unknown.  RegEdt32.exe will show
!*   1332-error-type accounts as Account Unknown, so we will also
!*
!**********************************************************************/

        if (ERROR_NONE_MAPPED == dwLookupStatus) then
            write(*,9050) ucIndentBuf,ucDomainNmBuf,ucNameBuf,    &
                                    ucSIDStringBuf
9050  FORMAT (A25,'SID domain ==', A25, 'Name == ',A25,'(Account Unknown&
)', A25)
        else
            call SetLastError(dwLookupStatus)
            call PERR("LookupAccountSid")
            LookupSIDName = 0
            return
        end if
    end if
else
   ! Got good Lookup, so SID Is NOT the Local Logon SID
    write(*,9060) ucIndentBuf, ucDomainNmBuf, ucNameBuf,          &
                        ucSIDStringBuf
9060  FORMAT (A25,'SID domain ==', A25, 'Name == ',A25,'   ',  A25)


!************************************************************************
!*
!* For demonstration purposes see which well-known SID it might be
!* For demonstration purposes do a silly search demonstrating
!*   no two well-known SIDs are equal
!*
!************************************************************************

    if (EqualSid(LOC(psidSID),LOC(psidNullSid)) .NEQV. .FALSE.) then
        write(*,9500) ucIndentBuf
9500    FORMAT(A25,'SID is the Null SID')
    end if
    if (EqualSid(LOC(psidSID),LOC(psidWorldSid)) .NEQV. .FALSE.) then
        write(*,9510) ucIndentBuf
9510    FORMAT(A25,'SID is the World SID')
    end if
    if (EqualSid(LOC(psidSID),LOC(psidLocalSid)) .NEQV. .FALSE.) then
        write(*,9520) ucIndentBuf
9520    FORMAT(A25,'SID is the Local SID')
    end if
    if (EqualSid(LOC(psidSID),LOC(psidCreatorOwnerSid)) .NEQV. .FALSE.) then
        write(*,9530) ucIndentBuf
9530    FORMAT(A25,'SID is the CreatorOwner SID')
    end if
    if (EqualSid(LOC(psidSID),LOC(psidCreatorGroupSid)) .NEQV. .FALSE.) then
        write(*,9540) ucIndentBuf
9540    FORMAT(A25,'SID is the CreatorGroup SID')
    end if
    if (EqualSid(LOC(psidSID),LOC(psidNtAuthoritySid)) .NEQV. .FALSE.) then
        write(*,9550) ucIndentBuf
9550    FORMAT(A25,'SID is the NtAuthority SID')
    end if
    if (EqualSid(LOC(psidSID),LOC(psidDialupSid)) .NEQV. .FALSE.) then
        write(*,9560) ucIndentBuf
9560    FORMAT(A25,'SID is the DialUp SID')
    end if
    if (EqualSid(LOC(psidSID),LOC(psidNetworkSid)) .NEQV. .FALSE.) then
        write(*,9570) ucIndentBuf
9570    FORMAT(A25,'SID is the Network SID')
    end if
    if (EqualSid(LOC(psidSID),LOC(psidBatchSid)) .NEQV. .FALSE.) then
        write(*,9580) ucIndentBuf
9580    FORMAT(A25,'SID is the Batch SID')
    end if
    if (EqualSid(LOC(psidSID),LOC(psidInteractiveSid)) .NEQV. .FALSE.) then
        write(*,9590) ucIndentBuf
9590    FORMAT(A25,'SID is the Interactive SID')
    end if
    if (EqualSid(LOC(psidSID),LOC(psidServiceSid)) .NEQV. .FALSE.) then
        write(*,9600) ucIndentBuf
9600    FORMAT(A25,'SID is the Service SID')
    end if
    if (EqualSid(LOC(psidSID),LOC(psidLocalSystemSid)) .NEQV. .FALSE.) then
        write(*,9610) ucIndentBuf
9610    FORMAT(A25,'SID is the LocalSystem SID')
    end if
    if (EqualSid(LOC(psidSID),LOC(psidBuiltinDomainSid)) .NEQV. .FALSE.) then
        write(*,9620) ucIndentBuf
9620    FORMAT(A25,'SID is the Builtin Domain SID')
    end if
end if

select case (peAcctNameUse)
    case (SidTypeUser)
        write(*,9700) ucIndentBuf
9700          FORMAT (A25, 'SID type is SidTypeUser')

    case (SidTypeGroup)
        write(*,9710) ucIndentBuf
9710          FORMAT (A25, 'SID type is SidTypeGroup')
    
    case (SidTypeDomain)
        write(*,9720) ucIndentBuf
9720          FORMAT (A25, 'SID type is SidTypeDomain')
    
    case (SidTypeAlias)
        write(*,9730) ucIndentBuf
9730          FORMAT (A25, 'SID type is SidTypeAlias')
    
    case (SidTypeWellKnownGroup)
        write(*,9740) ucIndentBuf
9740          FORMAT (A25, 'SID type is SidTypeWellKnownGroup')
    
    case (SidTypeDeletedAccount)
        write(*,9750) ucIndentBuf
9750          FORMAT (A25, 'SID type is SidTypeDeletedAccount')
    
    case (SidTypeInvalid)
        write(*,9760) ucIndentBuf
9760          FORMAT (A25, 'SID type is SidTypeInvalid')
    
    case (SidTypeUnknown)
        write(*,9770) ucIndentBuf
9770          FORMAT (A25, 'SID type is SidTypeUnknown')
    
    case DEFAULT
        write(*,9780) ucIndentBuf
9780          FORMAT (A25, 'SID type is IMPOSSIBLE!!!!  Run debugger, se&
e value!')
end select
end 
