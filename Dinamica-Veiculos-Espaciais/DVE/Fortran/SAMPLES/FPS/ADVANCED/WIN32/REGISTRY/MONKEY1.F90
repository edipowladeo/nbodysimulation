!************************************************************************\
!*
!*  FUNCTION: DisplayKeyData()
!*
!*  PURPOSE:  To display the keys values and value types to the Value edit
!*            field.  This function is called when the right hand listbox
!*            is double clicked.  The functionality is much like that found
!*            in the function PrintTree, please see it for more details.
!*
!************************************************************************/


subroutine DisplayKeyData (hDlg, sRegPath, hKeyRoot)
use msfwin
use monkeyin

integer*4                   hDlg
character*(*)               sRegPath
integer*4                   hKeyRoot
integer*4                   hKey
integer*4                   dwLBIndex
character*(LINE_LEN)        Buf
character*(MAX_VALUE_NAME)  ValueName
integer*4                   cbValueName 
integer*4                   dwType
integer*4                   retCode

character*(MAX_PATH)    ClassName
integer*4               dwcClassLen 
integer*4               dwcSubKeys
integer*4               dwcMaxSubKey
integer*4               dwcMaxClass
integer*4               dwcValues
integer*4               dwcMaxValueName
integer*4               dwcMaxValueData
integer*4               dwcSecDesc
type (T_FILETIME)       ftLastWriteTime
character*1024          bData
character*1024          outBuf 
character*1024          BinaryStrBuf
integer*4               ptr ![allocatable] (:)
integer*4               cbData
integer*4               i
integer*4               cStrLen
character*4             ByteBuf
character*100           lpszHeader


sregpath = sregpath

  ! OPEN THE KEY.

   cbValueName = MAX_VALUE_NAME
   dwcClassLen = MAX_PATH     ! LBIndex should == value index.
   dwLBIndex = SendMessage (GetDlgItem (hDlg, IDL_LISTBOX2), LB_GETCURSEL, 0, 0)

   retCode = RegOpenKeyEx (hKeyRoot,&    ! Key handle at root level. 
                     RegPath,&     ! Path name of child key.  &
                     0,&           ! Reserved.                     &
                     KEY_EXECUTE,& ! Requesting read access.       &
                     LOC(hKey))      ! Address of key to be returned.
   if (retCode .ne. 0) then
      write (Buf, 1000) retCode
1000  FORMAT ('Error: RegOpenKeyEx = ', I5)
      i = MessageBox (hDlg, Buf, "DisplayKeyData()"C, MB_OK)
      return
   end if

   ! ADD A QUERY AND ALLOCATE A BUFFER FOR BDATA.

   retCode =  RegQueryInfoKey (hKey,& ! Key handle.                &
              ClassName,&        ! Buffer for class name.    &
              LOC(dwcClassLen),&      ! Length of class string.    &
              NULL,&                  ! Reserved.                      &
              LOC(dwcSubKeys), &      ! Number of sub keys.        &
              LOC(dwcMaxSubKey),&     ! Longest sub key size.      &
              LOC(dwcMaxClass), &     ! Longest class string.      &
              LOC(dwcValues),&        ! Number of values for this key. &
              LOC(dwcMaxValueName),&  ! Longest Value name.        &
              LOC(dwcMaxValueData),&  ! Longest Value data.        &
              LOC(dwcSecDesc),&       ! Security descriptor.       &
              ftLastWriteTime)  ! Last write time.            
   if (retCode .ne. 0) then
      write (Buf, 2000)  retCode
2000  FORMAT ('Error: RegQIK = ', I5) 
      i = MessageBox (hDlg, Buf, ""C, MB_OK)
   end if
    
    cbData = dwcMaxValueData

! ENUMERATE THE KEY.
   retCode = RegEnumValue (hKey,&      ! Key handle returned from           &
                                       !RegOpenKeyEx.                   &
                     dwLBIndex,&       ! Value index, taken from listbox. &
                     ValueName,&  ! Name of value.           &
                     LOC(cbValueName),&! Size of value name.       &
                     NULL,&            ! Reserved, dword = NULL.       &
                     LOC(dwType),&     !  Type of data.             &
                     LOC(bData),&      ! Data buffer.             &
                     LOC(cbData))      ! Size of data buffer.
   if (retCode .ne. ERROR_SUCCESS) then
      if (dwType < REG_FULL_RESOURCE_DESCRIPTOR) then
         write (Buf, 3000) retCode, cbData
3000     FORMAT ('Error: RegEnumValue = ', I5, 'cbData = ',I5)
         i = MessageBox (hDlg, Buf, ""C, MB_OK)
      end if
   end if
   
   
   select case (dwType)
   !    REG_NONE                    ( 0 )   ! No value type
   !    REG_SZ                      ( 1 )   ! Unicode nul terminated string
   !    REG_EXPAND_SZ               ( 2 )   ! Unicode nul terminated string
   !    (with environment variable references)
   !    REG_BINARY                  ( 3 )   ! Free form binary
   !    REG_DWORD                   ( 4 )   ! 32-bit number
   !    REG_DWORD_LITTLE_ENDIAN     ( 4 )   ! 32-bit number (same as REG_DWORD)
   !    REG_DWORD_BIG_ENDIAN        ( 5 )   ! 32-bit number
   !    REG_LINK                    ( 6 )   ! Symbolic Link (unicode)
   !    REG_MULTI_SZ                ( 7 )   ! Multiple Unicode strings
   !    REG_RESOURCE_LIST           ( 8 )   ! Resource list in the resource map
   !    REG_FULL_RESOURCE_DESCRIPTOR ( 9 )  ! Resource list in the hardware description

      case (REG_NONE)
         i = SetDlgItemText (hDlg, IDE_VALUE1, "REG_NONE: No defined value type."C)
      
      case (REG_SZ)
         
         i = SetDlgItemText (hDlg, IDE_VALUE1, "REG_SZ: A null-terminated Unicode string."C)

!         outBuf(1) = '\0'C
         i = lstrcat (outBuf, '\"'C)
         i = lstrcat (outBuf, bData)
         i = lstrcat (Buf,'\"'C)

         i = SetDlgItemText (hDlg, IDE_VALUE2, outBuf)
!         deallocate(outBuf)
         !      HeapFree (hHeap, 0, outBuf)

      case (REG_EXPAND_SZ)
         
         i = SetDlgItemText (hDlg, IDE_VALUE1,"REG_EXPAND_SZ: A String referencing environment variables i.e. PATH."C)

         i = lstrcat (outBuf, '\"')
!        i = lstrcat (outBuf, cbData)
         i = lstrcat (outBuf,'\"'C)
         i = SetDlgItemText (hDlg, IDE_VALUE2, outBuf)

!        deallocate(outBuf)

      case (REG_BINARY)
         lpszHeader = "REG_BINARY: Freeform binary data."C
         i = SetDlgItemText (hDlg, IDE_VALUE1, lpszHeader)
         i = SetCursor (LoadCursor (NULL, IDC_WAIT))
!        allocate(BinaryStrBuf((3 * cbData) + 1), STAT=ierr)
         BinaryStrBuf(1:1) = '\0'C
            ByteBuf(1:1) = '\0'C
            do i = 1 ,cbData 
               write(ByteBuf, 5000) bData(i:i)
5000           FORMAT  (A)
               i2 = lstrcat (BinaryStrBuf, ByteBuf)
            end do
            i = SetDlgItemText (hDlg, IDE_VALUE2, BinaryStrBuf)
!         else
!            lpszMessage = "Error: BinaryStrBuf=malloc failed"C
!            lpszHeader = "Debug: DisplayKeyData"C
!            i = MessageBox (hDlg, lpszMessage,lpszHeader,MB_OK)
!         end if
         i = SetDlgItemText (hDlg, IDL_LISTBOX2, BinaryStrBuf)
!         deallocate(BinaryStrBuf)
         i = SetCursor (LoadCursor (NULL, IDC_ARROW))

      case (REG_DWORD)
         lpszHeader = "REG_DWORD: A 32 bit number."C
         i = SetDlgItemText (hDlg, IDE_VALUE1, lpszHeader)
         i1 = ICHAR(bData(1:1))
         i = SetDlgItemInt (hDlg, IDE_VALUE2, i1, .FALSE.)
          
      case (REG_DWORD_BIG_ENDIAN)
         lpszHeader = "REG_DWORD_BIG_ENDIAN: A 32 bit number in big endian format."C
         i = SetDlgItemText (hDlg, IDE_VALUE1, lpszHeader)
         i1 = ICHAR(bData(1:1))
         i = SetDlgItemInt (hDlg, IDE_VALUE2, i1, .TRUE.)

      case (REG_LINK)
         lpszHeader = "REG_LINK: A Unicode symbolic link."C
         i = SetDlgItemText (hDlg, IDE_VALUE1, lpszHeader)
         i = SetDlgItemText (hDlg, IDE_VALUE2, bData)

      case (REG_MULTI_SZ)
         lpszHeader = "REG_MULTI_SZ: An array of null-terminated strings."C
         i = SetDlgItemText (hDlg, IDE_VALUE1, lpszHeader)
         i = SetCursor (LoadCursor (NULL, IDC_WAIT))
         ! Count the NULLs in the buffer to
         ! find out how many strings there are.
         cStrLen=4
         do i=1,  cbData 
            if (ICHAR(bData(i:i)) == 0) then
               cStrLen =cStrLen+4  ! Add room for two quotes and two
                                   ! spaced per string.
            end if
         end do

!        allocate(outBuf(cbData + cStrLen), STAT = ierr)

         ptr = 1        !bData        ! Set ptr to beginning of buffer.

         outBuf(1:1) = '\0'C                   ! Initialize output string.

         i2   = lstrcat (outBuf,"{"C)          ! Do first bracket.
         do while (ICHAR(bData(ptr:ptr)) .ne. 0)         ! Loop til you hit 2 NULLs in a row.
            i2 = lstrcat (outBuf,'\"'C)        ! Put quotes around each string.
            i2 = lstrcat (outBuf, '\"  'C)
            ptr = lstrlen(bdata(ptr:ptr))+1
         end do
         i2 = lstrcat (outBuf, "}"C)            ! Add final bracket.
         i2 = SetDlgItemText (hDlg, IDE_VALUE2, outBuf)
         i2 = SetCursor (LoadCursor (NULL, IDC_ARROW))
!        deallocate(outBuf)
!        HeapFree (hHeap, 0, outBuf)                 ! free output string.


      case (REG_RESOURCE_LIST)            ! CM_RESOURCE_LIST is kind of complex,
                                          ! it's defined in ntconfig.h.  Print
                                          ! it as a free formed binary data now,
                                          ! and structure it later with a
                                          ! different release.
         i2 = SetDlgItemText (hDlg, IDE_VALUE1, "REG_RESOURCE_LIST: A device-driver resource list."C)
!        allocate(BinaryStrBuf((3 * cbData) + 1), STAT=ierr)
!         if (ierr == 0) then
            BinaryStrBuf(1:1) = '\0'C
            ByteBuf(1:1) = '\0'C
            do i = 1 ,cbData 
               write(ByteBuf, 9000) bData(i:i)
9000           FORMAT  (A)
               i2 = lstrcat (BinaryStrBuf, ByteBuf)
            end do
            i = SetDlgItemText (hDlg, IDE_VALUE2, BinaryStrBuf)
!         else
!            i = MessageBox (hDlg,"Error: BinaryStrBuf=malloc failed"C , "Debug: DisplayKeyData"C, MB_OK)
!         end if

         i = SetDlgItemText (hDlg, IDL_LISTBOX2, BinaryStrBuf)
!         deallocate(BinaryStrBuf)

      case (REG_FULL_RESOURCE_DESCRIPTOR)
         i = SetDlgItemText (hDlg, IDE_VALUE1, "REG_FULL_RESOURCE_DESCRIPTOR: A resource list in the hardware description."C)
      case default
         write (Buf, 6000) dwType
6000     FORMAT ('Undefine in this verion of the Registry Monkey. ', I5)
         i = SetDlgItemText (hDlg, IDE_VALUE1, Buf)
   end select
!   deallocate(bData)
end

!************************************************************************\
!*
!*  FUNCTION: QueryKey()
!*
!*  PURPOSE:  To display the key's children (subkeys) and the names of
!*            the Values associated with it.  This function uses RegEnumKey,
!*            RegEnumValue, and RegQueryInfoKey.
!*
!************************************************************************/
subroutine QueryKey (hDlg, hKey)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_QueryKey@8' :: QueryKey
use msfwin
use monkeyin

integer*4                       hDlg, hKey
character*(MAX_PATH)            KeyName
character*(MAX_PATH)          ClassName                ! Buffer for class name.
integer*4                       dwcClassLen              ! Length of class string.
integer*4                       dwcSubKeys               ! Number of sub keys.
integer*4                       dwcMaxSubKey             ! Longest sub key size.
integer*4                       dwcMaxClass              ! Longest class string.
integer*4                       dwcValues                ! Number of values for this key.
integer*4                       dwcMaxValueName          ! Longest Value name.
integer*4                       dwcMaxValueData          ! Longest Value data.
integer*4                       dwcSecDesc               ! Security descriptor.
type (T_FILETIME)               ftLastWriteTime          ! Last write time.
integer*4                       i
integer*4                       retCode
integer*4                       j
integer*4                       retValue
character*(MAX_VALUE_NAME)      ValueName
integer*4                       dwcValueName  
character*80                    Buf



call ZeroMemory(LOC(ClassName),MAX_PATH)
dwcClassLen     = MAX_PATH
dwcValueName    = MAX_VALUE_NAME

! Get Class name, Value count.

   i = RegQueryInfoKey (hKey, &        ! Key handle.                    
              ClassName,&              ! Buffer for class name.         
              LOC(dwcClassLen),&       ! Length of class string.        
              NULL,&                   ! Reserved.                      
              LOC(dwcSubKeys),&        ! Number of sub keys.            
              LOC(dwcMaxSubKey),&      ! Longest sub key size.          
              LOC(dwcMaxClass),&       ! Longest class string.          
              LOC(dwcValues),&         ! Number of values for this key. 
              LOC(dwcMaxValueName),&   ! Longest Value name.            
              LOC(dwcMaxValueData),&   ! Longest Value data.            
              LOC(dwcSecDesc),&        ! Security descriptor.           
              ftLastWriteTime)         ! Last write time.

   i = SetDlgItemText (hDlg, IDE_CLASS, ClassName)
   i = SetDlgItemInt  (hDlg, IDE_CVALUES, dwcValues, .FALSE.)

   i = SendMessage (GetDlgItem (hDlg, IDL_LISTBOX),LB_ADDSTRING, 0, LOC(".."C))

    ! Loop until RegEnumKey fails, get
    ! the name of each child and enter
    ! it into the box.
  
    ! Enumerate the Child Keys.
   
    i = SetCursor (LoadCursor (NULL, IDC_WAIT))
    retCode = ERROR_SUCCESS 
    i = -1

    do while (retCode == ERROR_SUCCESS  ) 
      i = i + 1
      retCode = RegEnumKey (hKey, i, KeyName, MAX_PATH)
      if (retCode == ERROR_SUCCESS ) then
         i = SendMessage (GetDlgItem(hDlg, IDL_LISTBOX),LB_ADDSTRING, 0, LOC(KeyName))
      end if
    end do
    i = SetCursor (LoadCursor (NULL, IDC_ARROW))

    ! Enumerate the Key Values
    i = SetCursor (LoadCursor (NULL, IDC_WAIT))

    if (dwcValues .ne. 0) then
      retValue = ERROR_SUCCESS  
      do j = 0, dwcValues - 1
         dwcValueName = MAX_VALUE_NAME
         ValueName(1:1) = '\0'C
         retValue = RegEnumValue (hKey, j, ValueName,      &
                                LOC(dwcValueName),              &
                                NULL,                           &
                                NULL,&             !dwType,     
                                NULL,&             !bData,      
                                NULL)              !&bcData)
         if ((retValue .ne. ERROR_SUCCESS ) .and. (retValue .ne. ERROR_INSUFFICIENT_BUFFER)) then         
            write (Buf, 300) j, retValue, dwcValueName
300         FORMAT ('0 based index = ',I5,'retValue = ', I5, 'ValueLen =', I5)
            i = MessageBox (hDlg, Buf,"Debug"C, MB_OK)
         end if
         Buf(1:1) = '\0'C
         if (lstrlen(ValueName) == 0) then
            i = lstrcpy (ValueName, "<NO NAME>"C)
         end if
         write (Buf, 410) j, ValueName
410      FORMAT (I5,') ', A30 )
         i = SendMessage (GetDlgItem (hDlg, IDL_LISTBOX2),LB_ADDSTRING, 0, LOC(Buf))
      end do ! end for()
   end if
   i = SetCursor (LoadCursor (NULL, IDC_ARROW))
end


