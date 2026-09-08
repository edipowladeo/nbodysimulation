!****************************************************************************
!*                                                                          *
!*  FUNCTION   : OwnerComboBoxExample(hWnd, message, wParam, lParam)        *
!*                                                                          *
!*  PURPOSE    : Dialog function for the dropdown list combo box with       *
!*               owner-draw.                                                *
!*                                                                          *
!****************************************************************************/
logical*4 function OwnerComboBoxExample (hDlg, message, wParam, lParam)
!MS$ATTRIBUTES STDCALL, ALIAS : '_OwnerComboBoxExample@16' :: OwnerComboBoxExample
use msfwin
use owncbinc


integer*4   hDlg, message, wParam,lParam

interface
subroutine DrawEntireItem(lpdis, inflate)
!MS$ATTRIBUTES VALUE :: lpdis
!MS$ATTRIBUTES VALUE :: inflate
integer(4)  lpdis
integer(4)  inflate
end subroutine DrawEntireItem

subroutine HandleSelectionState(lpdis, inflate)
!MS$ATTRIBUTES VALUE :: lpdis
!MS$ATTRIBUTES VALUE :: inflate
integer(4)  lpdis
integer(4)  inflate
end subroutine HandleSelectionState

subroutine HandleFocusState(lpdis, inflate)
!MS$ATTRIBUTES VALUE :: lpdis
!MS$ATTRIBUTES VALUE :: inflate
integer(4)  lpdis
integer(4)  inflate
end subroutine HandleFocusState

end interface

integer*4       lpdis
integer*4       lpmis
type (T_DRAWITEMSTRUCT)      dis
type (T_MEASUREITEMSTRUCT)   mis


select case (message)
    case (WM_COMMAND)
        select case (INT4(LoWord(wParam)))
            case (IDOK)
                ret = EndDialog (hDlg, 0)
                OwnerComboBoxExample = .TRUE.
                return

            !/* Clicking any of these buttons adds the corresponding color
            ! * to the combo box. The application-supplied data is the RGB
            ! * value for the color to be drawn in the listbox.
            ! */
            case (ID_BLACK)
                ret = SendMessage (GetDlgItem(hDlg, ID_LISTBOX),  &
                             CB_ADDSTRING,                        &
                             0,                                   &
                             Rgb (INT1(0),INT1(0),INT1(0)))
                OwnerComboBoxExample = .TRUE.
                return

            case (ID_RED)
                ret = SendMessage (GetDlgItem (hDlg, ID_LISTBOX), &
                             CB_ADDSTRING,                        &
                             0,                                   &
                             Rgb (INT1(255),INT1(0),INT1(0)))
                OwnerComboBoxExample = .TRUE.
                return

            case (ID_BLUE)
                ret = SendMessage (GetDlgItem(hDlg, ID_LISTBOX),  &
                             CB_ADDSTRING,                        &
                             0,                                   &
                             Rgb (INT1(0),INT1(0),INT1(255)))
                OwnerComboBoxExample = .TRUE.
                return

            case (ID_GREEN)
                ret = SendMessage (GetDlgItem(hDlg, ID_LISTBOX),  &
                             CB_ADDSTRING,                        &
                             0,                                   &
                             Rgb (INT1(0),INT1(255),INT1(0)))
                OwnerComboBoxExample = .TRUE.
                return

            case DEFAULT
                OwnerComboBoxExample = .TRUE.
                return
        end select

    case (WM_DRAWITEM)
        !/* Get pointer to the DRAWITEMSTRUCT */
        lpdis = lParam
        call CopyMemory (LOC(dis), lpdis, SIZEOFDRAWITEMSTRUCT)
        if (dis%itemID == -1) then
            !/* We have a request to draw an item in the combo box, yet there
            ! * are no combo box items. This is sent when the user TABS into
            ! * an empty combo box or an empty combo box gets the focus. We
            ! * have to indicate (somehow) that this owner-draw combo box has
            ! * the focus. We do it in response to this message. Note that
            ! * lpdis->itemData field would be invalid in this instance so
            ! * we can't allow it to fall into our standard routines.
            ! */
            call HandleFocusState(lpdis, -2)
        else
            select case (dis%itemAction)
                case (ODA_DRAWENTIRE)
                    call DrawEntireItem(lpdis, -4)

                case (ODA_SELECT)
                    call HandleSelectionState(lpdis, 0)

                case (ODA_FOCUS)
                    call HandleFocusState(lpdis, -2)
            end select
        end if

        !/* Return TRUE meaning that we processed this message. */
        OwnerComboBoxExample = .TRUE.
        return

    case (WM_MEASUREITEM)
        lpmis = lParam
        call CopyMemory (LOC(mis), lpmis, SIZEOFMEASUREITEMSTRUCT)
        !/* All the items are the same height since the combo box is
        ! * CBS_OWNERDRAWFIXED
        ! */
        if (mis%itemID == -1) then
            !/* If -1 for item, then we are setting the height of the
            ! * always visible static item part of the dropdown combo box.
            ! */
            mis%itemHeight = 25
            call CopyMemory (lpmis, LOC(mis),                     &
                            SIZEOFMEASUREITEMSTRUCT)
            OwnerComboBoxExample = .TRUE.
            return
        end if
        mis%itemHeight = 30
        call CopyMemory (lpmis, LOC(mis), SIZEOFMEASUREITEMSTRUCT)


    case (WM_CLOSE)
        ret = EndDialog(hDlg, 0)
        OwnerComboBoxExample = .TRUE.
        return

    case DEFAULT
        OwnerComboBoxExample = .FALSE.
        return
end select
OwnerComboBoxExample = .TRUE.
return
end
