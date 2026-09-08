!*************************************************************************\
!*
!*  PROGRAM: Monkey: the Registry Monkey Utility.
!*  PURPOSE: To demonstrate Registry API.
!*  
!*************************************************************************/

!*************************************************************************\
!*
!*  FUNCTION: WinMain(HANDLE, HANDLE, LPSTR, int)
!*
!*  PURPOSE: Creates the dialogbox.
!*
!*  COMMENTS:
!*
!*************************************************************************/

integer*4 function WinMain (hInstance,hPrevInstance,lpCmdLine,nCmdShow)
!MS$ ATTRIBUTES STDCALL, ALIAS :'_WinMain@16' :: WinMain
use msfwin
use monkeyin
include 'monkey.fi'

integer*4       hInstance
integer*4       hPrevInstance
integer*4       lpCmdLine
integer*4       nCmdShow
integer*4       retCode
character*256   NameLBSelect 
integer*4       FullBranches
integer*4       hFile
character*100  lpszDlgName

   lpcmdline = lpcmdline
   hprevinstance = hprevinstance
   nCmdShow = nCmdShow

   hInst   = hInstance
   hHeap   = HeapCreate (0, 0, 0)
   hFile = INVALID_HANDLE_VALUE
   FullBranches = TRUE
   NameLBSelect  = ""C
   RegPath  = ""C
   lpszDlgName = "MonkeyDlg"C


   retCode = DialogBoxParam (hInst, LOC(lpszDlgName), NULL, LOC(MonkeyDlgProc), 0)
   i = HeapDestroy (hHeap)
   WinMain = retCode
   return  
end

!************************************************************************\
!*
!*  FUNCTION: MonkeyDlgProc()
!*
!*  PURPOSE:  Handle the Monkey dialog box messages.
!*
!*  MESSAGES:
!*
!*    WM_INITDIALOG  - Posts WM_GETFIRSTKEY message.
!*
!*    WM_GETFIRSTKEY - Puts the first 4 pre-defined keys in the listbox.
!*
!*    IDL_LISTBOX    - Trapped when an item in the left hand listbox
!*                     has been double clicked.  It posts a IDB_NEXT message.
!*
!*    IDL_LISTBOX2   - Trapped when an item in the right hand listbox has
!*                     been double clicked.  It basically calls DisplayKeyData,
!*                     which fills the Value edit fields with the data from
!*                     the current key's specified value information.
!*
!*    IDB_PRINT      - Basically calls PrintTree() which does a recursive
!*                     print of the Registry from the current key to the
!*                     end of it's branches.
!*
!*    IDB_BACK       - Sets the dialog box with the information from the
!*                     previously selected key (one closer to the root of
!*                     the registry, the parent of the current key).
!*
!*    IDB_NEXT       - Sets the dialog box with the information on the
!*                     selected key child.
!*
!*    IDR_FULL       - Sets a global variable used to determine if the
!*                     user wants to print full Registry information
!*                     or only information from keys that have value
!*                     associated with it.  Variable is set to TRUE.
!*
!*    IDR_TRIMMED    - Same as above, only the variable is set to FALSE.
!*
!************************************************************************/

integer*4 function MonkeyDlgProc (hDlg, wMsg, wParam, lParam)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MonkeyDlgProc@16' :: MonkeyDlgProc
use msfwin
use monkeyin

interface 
subroutine EnumerateLevel (hDlg, NameLBSelect,sRegPath, hKeyRoot)
!MS$ ATTRIBUTES REFERENCE :: sRegPath
integer*4       hDlg
character*(*)   NameLBSelect
character*(*)   sRegPath 
integer*4       hKeyRoot
end subroutine
end interface

interface 
subroutine QueryKey (x, y)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_QueryKey@8' :: QueryKey
integer*4   x
integer*4   y
end subroutine
end interface

interface 
subroutine DisplayKeyData (x, y, z)
integer*4       x
character*(*)   y
integer*4       z
end subroutine
end interface

integer*4           hDlg, wMsg, wParam, lParam

integer*4           KeyClassLength
integer*4           KeyNameLength
integer*4           indexLB

character*256       NameLBSelect 
character*256       temptext
integer*4           hKeyRoot
logical*4           FullBranches

integer*4           hFile

character*100       lpszMessage, lpszHeader
save                hKeyRoot,NameLBSelect, FullBranches, hFile


    lparam = lparam
    

    KeyClassLength = 256
    KeyNameLength = 256
    !      hFile = INVALID_HANDLE_VALUE
    !      FullBranches = TRUE
    !      NameLBSelect  = ""C
    !      RegPath  = ""C

   select case (wMsg)
      case (WM_INITDIALOG)
      RegPath(1:1) = char(0)

         ! Post a message to get the first 4 pre-defined keys, and set
         !  Full Branches to be the print default.
         i = PostMessage (hDlg, WM_GETFIRSTKEY, 0, 0)
         i = CheckDlgButton (hDlg, IDR_FULL, TRUE)
         MonkeyDlgProc  = 1
         return

      case (WM_GETFIRSTKEY)
         ! Initialize by putting the first 4 predefined keys of the
         ! registry in the list box.

         i = SendMessage (GetDlgItem(hDlg, IDL_LISTBOX),LB_ADDSTRING, 0, LOC("HKEY_LOCAL_MACHINE"C ))
         i = SendMessage (GetDlgItem(hDlg, IDL_LISTBOX),LB_ADDSTRING, 0, LOC("HKEY_CURRENT_USER"C ))
         i = SendMessage (GetDlgItem(hDlg, IDL_LISTBOX),LB_ADDSTRING, 0, LOC("HKEY_USERS"C ))
         i = SendMessage (GetDlgItem(hDlg, IDL_LISTBOX),LB_ADDSTRING, 0, LOC("HKEY_CLASSES_ROOT"C ))
         hKeyRoot = 0                   ! Initialize hKeyRoot.
         MonkeyDlgProc  = 1
         return

      case (WM_SYSCOMMAND)
         if (wParam == SC_CLOSE) then
            i = EndDialog (hDlg, TRUE)
            if (hFile .ne. INVALID_HANDLE_VALUE) then
               i = CloseHandle (hFile)
            end if
            MonkeyDlgProc  = 1
         return
      end if

      case (WM_COMMAND)

         select case (INT4(LOWORD(wParam)))
            case (IDR_FULL)
               ! If Full Branches pressed, set global var to TRUE.
               FullBranches = TRUE
               MonkeyDlgProc  = 1
               return

            case (IDR_TRIMMED)
               ! If Trimmed Branches pressed, set global var to FALSE.
               FullBranches = FALSE
               MonkeyDlgProc  = 1
               return

            case (IDL_LISTBOX)
               ! If double click in left hand listbox, clear Value
               ! edit fields, and execute Next functionality.
               if ( HIWORD (wParam) == LBN_DBLCLK) then
                  i = SetDlgItemText (hDlg, IDE_VALUE1, ""C)
                  i = SetDlgItemText (hDlg, IDE_VALUE2, ""C)
                  i = PostMessage (hDlg, WM_COMMAND, IDB_NEXT, 0)
               end if
               MonkeyDlgProc  = 1
               return

            case (IDL_LISTBOX2)
               ! If double click right hand listbox, clear Value edit
               ! fields, then display the key's data.
               if (  HIWORD (wParam) == LBN_DBLCLK) then
                  i = SetDlgItemText (hDlg, IDE_VALUE1, ""C)
                  i = SetDlgItemText (hDlg, IDE_VALUE2, ""C)
                  call DisplayKeyData (hDlg, RegPath, hKeyRoot)
               end if
               MonkeyDlgProc  = 1
               return
            case (IDB_NEXT)
               ! Get the index of the cursor selection
               ! in the list box.
               indexLB = SendMessage (GetDlgItem (hDlg, IDL_LISTBOX),LB_GETCURSEL, 0, 0)
               ! If nothing is selected, flag user and return, otherwise
               ! process the selected key.
               ! LB_ERR indicates nothing selected.
               if (indexLB == LB_ERR) then
                  lpszMessage = "Please select an item from the list box"C
                  lpszHeader = "Registry Monkey Utility"C
                  i = MessageBox (hDlg, lpszMessage,lpszHeader, MB_OK)
                  MonkeyDlgProc  = 1
                  return
               end if

               !   If listbox item 0 is pressed, user wants to move
               ! back up.  Execute the Back functionality.
               if ((indexLB == 0) .and. (hKeyRoot .ne. 0)) then
                  i = PostMessage (hDlg, WM_COMMAND, IDB_BACK, 0)
                  MonkeyDlgProc  = 1
                  return
               end if


               ! Get text from selection in LB.
               i = SendMessage (GetDlgItem (hDlg, IDL_LISTBOX), LB_GETTEXT, indexLB, LOC(NameLBSelect))
               temptext = NameLBSelect

               ! Put name of chosen item in Name field.
               i = SetDlgItemText (hDlg, IDE_NAME, NameLBSelect)

               ! Then clear ListBox entries.
               i = SendMessage (GetDlgItem (hDlg, IDL_LISTBOX),&
                       LB_RESETCONTENT, 0, 0)
               i  = SendMessage (GetDlgItem (hDlg, IDL_LISTBOX2),&
                       LB_RESETCONTENT, 0, 0)

               call EnumerateLevel (hDlg,temptext,RegPath,hKeyRoot)

               MonkeyDlgProc  = 1
               return
            case (IDB_BACK)

               ! For this case (hRootKey = 0)you're at the top level already.
               ! Tell the user, then return
               if (hKeyRoot == 0) then
                  i = MessageBox (hDlg, "Top Level: You can not backu&
                        p any further%"C,"Registry Monkey Utility"C, MB_OK)
                  MonkeyDlgProc  = 1
                  return
               end if

               !   For all remaining cases, clear the listboxes.
               i = SendMessage (GetDlgItem (hDlg, IDL_LISTBOX),LB_RESETCONTENT, 0, 0)
               i = SendMessage (GetDlgItem (hDlg, IDL_LISTBOX2),LB_RESETCONTENT, 0, 0)

               ! If hRootKey has a value, but the pathname is blank,
               ! then you must be 1 level deep, reset to level 0 by
               ! posting WM_GETFIRSTKEY.
               ilen = lstrlen(RegPath)
               if (ilen == 0) then
                  i = SetDlgItemText (hDlg, IDE_NAME, ""C)
                  i = PostMessage (hDlg, WM_GETFIRSTKEY, 0, 0)
                  MonkeyDlgProc  = 1
                  return
               end if
               ! Two cases left.  One in which the path has only one
               ! key name in it, and no back slash character (meaning
               ! strrchr() will return NULL) and one the other case
               ! where there are more than one key name in the path (
               ! and at least one back slash for strrchr().  If this
               ! is the first case, we want to fakeout EnumerateLevel
               ! into thinking we just picked one of the pre-defined keys,
               ! and then re-enumerate it's child keys.
               iind = index(RegPath, '\', .TRUE.)
               if (iind == 0) then
                  RegPath(1:1) = char(0)

                  select case (hKeyRoot)
                     case (HKEY_LOCAL_MACHINE)
                        i = lstrcpy (NameLBSelect, "HKEY_LOCAL_MACHINE"C)
                     case (HKEY_USERS)
                        i = lstrcpy (NameLBSelect, "HKEY_USERS"C)
                     case (HKEY_CURRENT_USER)
                        i  = lstrcpy (NameLBSelect, "HKEY_CURRENT_USER"C)
                     case (HKEY_CLASSES_ROOT)
                        i = lstrcpy (NameLBSelect, "HKEY_CLASSES_ROOT"C)
                  end select
                  i = SetDlgItemText (hDlg, IDE_NAME, NameLBSelect)
                  hKeyRoot = 0
                  call EnumerateLevel(hDlg,NameLBSelect,RegPath,hKeyRoot)
               else
                  ! In the final case, we can just trim the last key
                  ! name off the path, and re-enumerate the level.
                  RegPath(iind:iind) = char(0)
                  iind = index(RegPath, '\', .TRUE.)

                  if (iind .ne. 0) then
                     i = lstrcpy (NameLBSelect,RegPath(iind+1:))
                     RegPath(iind:iind) = char(0)
                  else
                     i = lstrcpy (NameLBSelect, RegPath)
                     RegPath(1:1) = char(0)
                  end if
                  i = SetDlgItemText (hDlg, IDE_NAME, NameLBSelect)
                  call EnumerateLevel(hDlg,NameLBSelect,RegPath,hKeyRoot)
               end if
            MonkeyDlgProc  = 1
            return
         case default
            MonkeyDlgProc  = 0
            return
      end select
   end select
   MonkeyDlgProc  = 0
   return
end










