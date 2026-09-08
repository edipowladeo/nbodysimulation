!/*************************************************************************\
!*
!*  FUNCTION:  VOID ResetMenu (VOID)
!*
!*  PURPOSE:   Updates the menu with check marks to indicate the pages state
!*             and protection.
!*
!*  VARIABLES USED:
!*
!*    - i:     Local integer used for counting in a for loop.
!*    - hMenu: Local menu handle to the menu.
!*
!*  CALLED BY:
!*
!*    MainWndProc()
!*
!*  COMMENTS:
!*    This function uses a for loop to uncheck all the menu items.  It then
!*    calls VirtualQuery() to  determine information about the page, and
!*    updates the menu items with check marks as appropriate.
!*
!\*************************************************************************/
subroutine ResetMenu ()
use vmeminc
integer     hMenu
integer     i
integer*4   ret

hMenu = GetMenu(hWind)

do i = IDM_FREE, IDM_READWRITE
    ret = CheckMenuItem(hMenu, i, IOR(MF_BYCOMMAND ,              &
                                    MF_UNCHECKED))
end do

ret = VirtualQuery (base, MemInfo, SIZE_MEM_BASIC_INFO)

select case (MemInfo%State)

    case (MEM_COMMIT)
        ret = CheckMenuItem(hMenu,                                &
            IDM_COMMIT,                                           &
            IOR(MF_BYCOMMAND , MF_CHECKED))

    case (MEM_FREE)
        ret = CheckMenuItem(hMenu,                                &
            IDM_FREE,                                             &
            IOR(MF_BYCOMMAND , MF_CHECKED))

    case (MEM_RESERVE)
        ret = CheckMenuItem(hMenu,                                &
            IDM_RESERVE,                                          &
            IOR(MF_BYCOMMAND , MF_CHECKED))
end select


select case (MemInfo%Protect)
    case (0)

    case (PAGE_READWRITE)
        ret = CheckMenuItem(hMenu,                                &
               IDM_READWRITE,                                     &
               IOR(MF_BYCOMMAND , MF_CHECKED))


    case (PAGE_READONLY)
        ret = CheckMenuItem(hMenu,                                &
                IDM_READONLY,                                     &
                IOR(MF_BYCOMMAND , MF_CHECKED))

    case (PAGE_NOACCESS)
        ret = CheckMenuItem(hMenu,                                &
               IDM_NOACCESS,                                      &
               IOR(MF_BYCOMMAND , MF_CHECKED))
end select

ret = CloseHandle (hMenu)

end 

!/*************************************************************************\
!*
!*  FUNCTION:  LONG APIENTRY ShowDlgProc (HWND, UINT, UINT, LONG)
!*
!*  PURPOSE:   This is a dialog box function which queries page information
!*             using VirtualQuery, and then displays the information in
!*             the appropriate edit fields.
!*
!*  MESSAGES:
!*
!*    WM_SYSCOMMAND:
!*             If this message is trapped, the dialog box is terminated.
!*
!*    WM_INITDIALOG:
!*             Does a VirtualQuery, checks the values returned in the
!*             fields of the MEMORY_BASIC_INFORMATION structure, and
!*             fills the edit fields of the dialog box with the appropriate
!*             information.
!*
!*  CALLED BY:
!*
!*    MainWndProc()
!*
!\*************************************************************************/

integer function ShowDlgProc (hdlg, message, wParam, lParam)
!MS$ATTRIBUTES STDCALL, ALIAS : '_ShowDlgProc@16' :: ShowDlgProc
use vmeminc
integer hdlg, message, wParam, lParam
integer*4   ret

LPARAM = LPARAM
select case (message)
    case (WM_SYSCOMMAND)
        if (wParam == SC_CLOSE) then
            ret = EndDialog(hdlg, TRUE)
            ShowDlgProc = TRUE
            return
        end if

        ShowDlgProc = 0
        return

    case (WM_INITDIALOG)

        ret = VirtualQuery (base, MemInfo, SIZE_MEM_BASIC_INFO)

        ret = SetDlgItemInt (hdlg, IDE_BASEADDR,                  &
                MemInfo%BaseAddress, .FALSE.)
        ret = SetDlgItemInt (hdlg, IDE_ALLOCBASE,                 &
                MemInfo%AllocationBase, .FALSE.)

        select case (MemInfo%AllocationProtect)
            case (PAGE_NOACCESS)
               ret = SetDlgItemText (hdlg, IDE_INITPROT, "No Access"C)

            case (PAGE_READONLY)
               ret = SetDlgItemText (hdlg, IDE_INITPROT, "Read Only"C)

            case (PAGE_READWRITE)
               ret = SetDlgItemText (hdlg, IDE_INITPROT, "Read/Write"C)

            case DEFAULT
               ret = SetDlgItemText (hdlg, IDE_INITPROT, "Unknown"C)

        end select

        ret = SetDlgItemInt (hdlg, IDE_SIZE, MemInfo%RegionSize,  &
                        .FALSE.)


        select case (MemInfo%State)
            case (MEM_FREE)
               ret = SetDlgItemText (hdlg, IDE_STATE, "Free"C)

            case (MEM_RESERVE)
               ret = SetDlgItemText (hdlg, IDE_STATE, "Reserved"C)

            case (MEM_COMMIT)
               ret = SetDlgItemText (hdlg, IDE_STATE, "Commited"C)

            case DEFAULT
               ret = SetDlgItemText (hdlg, IDE_STATE, "Unknown"C)
        end select


        select case (MemInfo%Protect)
            case (0)
               ret = SetDlgItemText (hdlg, IDE_PROTECT,"Undefined"C)

            case (PAGE_NOACCESS)
               ret = SetDlgItemText (hdlg, IDE_PROTECT,"No Access"C)

            case (PAGE_READONLY)
               ret = SetDlgItemText (hdlg, IDE_PROTECT, "Read Only"C)

            case (PAGE_READWRITE)
               ret = SetDlgItemText (hdlg, IDE_PROTECT, "Read/Write"C)

            case DEFAULT
               ret = SetDlgItemText (hdlg, IDE_PROTECT, "Unknown"C)
        end select

        ShowDlgProc = TRUE
        return

    case DEFAULT
        ShowDlgProc = 0
        return
end select
ShowDlgProc = 0
return
end 

subroutine WERR (who,where)
use vmeminc
character*80   who, where
integer*4   ret

write (Buf, 100)  who, GetLastError()
100   format ('ERROR: ', A80, ' returned ', I)
write (Buf2, 200)   where
200   format ('From within ', A)
ret = MessageBox(hwind, Buf, Buf2, MB_OK)
end
