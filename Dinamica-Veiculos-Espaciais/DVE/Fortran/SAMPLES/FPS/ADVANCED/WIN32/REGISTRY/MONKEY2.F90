!************************************************************************
!*
!*  FUNCTION: EnumerateLevel()
!*
!*  PURPOSE: To get a valid key handle (either to determine if the one sent
!*           to the function was one of the pre-defined, or to open a key
!*           specified by the path), and to pass that key handle along
!*           to QueryKey().
!*
!*           To enumerate the children of a key, you must have
!*           an open handle to it.  The four top keys of the
!*           Registry are predefined and open for use:
!*           HKEY_LOCAL_MACHINE, HKEY_USERS, HKEY_CURRENT_USER,
!*           and HKEY_CLASSES_ROOT.  These 4 can be used for
!*           RegEnumKey as is but to RegEnumKey on any of the
!*           children of these you must first have an open key
!*           handle to the child.
!*
!*           If hKeyRoot != 0, assume you are lower than the
!*           first level of the Registry and the user is trying
!*           to enumerate one of the children.  First calculate
!*           the name of the child, and then use RegOpenKey to
!*           get an open handle.
!*
!*           If hKeyRoot == 0, assume you are at the top level
!*           of the Registry, and set the hKey to be enumerated
!*           to be one of the 4 predefined values, the specific
!*           one indicated by the ListBox selection.
!*
!************************************************************************
subroutine EnumerateLevel (hDlg, NameLBSelect,sRegPath, hKeyRoot)
!MS$ ATTRIBUTES REFERENCE :: sRegPath
use msfwin
use monkeyin


interface 
subroutine QueryKey (x, y)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_QueryKey@8' :: QueryKey
integer*4   x
integer*4   y
end subroutine
end interface

integer*4       hDlg
character*(*)   NameLBSelect
character*(*)   sRegPath
integer*4       hKeyRoot

integer*4       hKey
integer*4       retCode
character*80    Buf

sregpath = sregpath
      
        
   if (hKeyRoot .ne. 0) then
                                 ! If RegPath is not NULL, then
                                 ! you have to add a backslash to the
                                 ! path name before appending the next
                                 ! level child name.
      
      if (RegPath(1:1) .ne. char(0)) then
         i = lstrcat (RegPath, "\\"C)
      end if

                                 ! Add the next level child name.
      i = lstrcat (RegPath,NameLBSelect)

                                 ! Use RegOpenKeyEx() with the new
                                 ! Registry path to get an open handle
                                 ! to the child key you want to
                                 ! enumerate.


      retCode = RegOpenKeyEx (hKeyRoot,                      &
                         RegPath,                                 &
                         0,                                       &
                         IOR(KEY_ENUMERATE_SUB_KEYS,              &
                         IOR(KEY_EXECUTE,                         &
                         KEY_QUERY_VALUE)),                       &
                         LOC(hKey))

      if (retCode .ne. ERROR_SUCCESS) then
         if (retCode == ERROR_ACCESS_DENIED) then
            write(Buf, 100) 
100         FORMAT ('Error:unable to open key. Probably due to security reasons.')
         else
            write (Buf, 200) retCode
200         FORMAT ('Error: Unable to open key, RegOpenKey = ',I5)
         end if
         i = MessageBox (hDlg, Buf,""C, MB_OK)
         i = PostMessage (hDlg, WM_COMMAND, IDB_BACK, 0)
         return
      end if
   else
                                 ! Set the *hKeyRoot handle based
                                 ! on the text taken from the ListBox.

      if (lstrcmp (NameLBSelect, "HKEY_CLASSES_ROOT"C) == 0) &
         then
         hKeyRoot = HKEY_CLASSES_ROOT
      end if

      if (lstrcmp (NameLBSelect, "HKEY_USERS"C) == 0) then
         hKeyRoot = HKEY_USERS
      end if

      if (lstrcmp (NameLBSelect, "HKEY_LOCAL_MACHINE"C) == 0)&
         then
         hKeyRoot = HKEY_LOCAL_MACHINE
      end if

      if (lstrcmp (NameLBSelect, "HKEY_CURRENT_USER"C) == 0) &
         then
         hKeyRoot = HKEY_CURRENT_USER
      end if

      hKey = hKeyRoot     ! hKey is used in RegEnumKey().

   end if !end if/else *hKeyRoot
   call QueryKey (hDlg, hKey)
   i = RegCloseKey (hKey)   ! Close the key handle.
   !      rect.top = 0 rect.left = 5 rect.right = 1200 rect.bottom = 25
   !      hDC = GetDC (hDlg)
   !      FillRect (hDC, &rect, GetStockObject(WHITE_BRUSH))
   !      TextOut (hDC, 5, 5, RegPath, strlen(RegPath))
   !      ReleaseDC (hDlg, hDC)
   i  = SetDlgItemText (hDlg, IDE_TEXTOUT, RegPath)
end
