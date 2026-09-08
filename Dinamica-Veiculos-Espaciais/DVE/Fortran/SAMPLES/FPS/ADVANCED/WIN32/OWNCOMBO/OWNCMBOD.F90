!****************************************************************************
!*                                                                          *
!*  FUNCTION   : ListBoxExample (hDlg, message, wParam, lParam)             *
!*                                                                          *
!*  PURPOSE    : Dialog function for the owner-draw list box example.       *
!*               It sets up the example dialog with the owner-draw list box,*
!*               adds the colors to the list box, and handles setting the   *
!*               selection and focus for the items.                         *
!*                                                                          *
!****************************************************************************/
logical(4) function ListBoxExample (hDlg, message, wParam, lParam)
!MS$ATTRIBUTES STDCALL, ALIAS : '_ListBoxExample@16' :: ListBoxExample
use msfwin
use owncbinc
integer*4   hDlg, message, wParam, lParam

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
type (T_DRAWITEMSTRUCT)     dis
type (T_MEASUREITEMSTRUCT)  mis
integer(4)      ret
logical(4)      bret


select case (message)
    case (WM_COMMAND)
        select case (INT4(LoWord(wParam)))
            case (IDOK)
               ret = EndDialog (hDlg, 0)
               ListBoxExample = .TRUE.
               return 

            !/* Clicking any of these buttons adds the corresponding color
            ! * to the list box. The application-supplied data is the RGB
            ! * value for the color to be drawn in the listbox.
            ! */
            case (ID_BLACK)
                ret = SendMessage (GetDlgItem (hDlg, ID_LISTBOX), &
                              LB_ADDSTRING,                       &
                              0,                                  &
                              Rgb (INT1(0),INT1(0),INT1(0)))
                ListBoxExample = .TRUE.
                return 

            case (ID_RED)
                ret = SendMessage (GetDlgItem (hDlg, ID_LISTBOX), &
                              LB_ADDSTRING,                       &
                              0,                                  &
                              Rgb (INT1(255),INT1(0),INT1(0)))
                ListBoxExample = .TRUE.
                return 

            case (ID_BLUE)
                ret = SendMessage (GetDlgItem (hDlg, ID_LISTBOX), &
                              LB_ADDSTRING,                       &
                              0,                                  &
                              Rgb (INT1(0),INT1(0),INT1(255)))
                ListBoxExample = .TRUE.
                return 

            case (ID_GREEN)
                ret = SendMessage (GetDlgItem (hDlg, ID_LISTBOX), &
                              LB_ADDSTRING,                       &
                              0,                                  &
                              Rgb (INT1(0),INT1(255),INT1(0)))
                ListBoxExample = .TRUE.
                return 

            case DEFAULT
                ListBoxExample = .FALSE.
                return 
        end select

    case (WM_DRAWITEM)
        !/* Get pointer to the DRAWITEMSTRUCT */
        lpdis = lParam
        call CopyMemory (LOC(dis), lpdis, SIZEOFDRAWITEMSTRUCT)
        if (dis%itemID == -1) then
            !/* We have a request to draw an item in the list box, yet there
            ! * are no list box items. This is sent when the user TABS into
            ! * an empty list box or an empty list box gets the focus. We
            ! * have to indicate (somehow) that this owner-draw list box has
            ! * the focus. We do it in response to this message. Note that
            ! * lpdis->itemData field would be invalid in this instance so
            ! * we can't allow it to fall into our standard routines.
            ! */
            call HandleFocusState(lpdis, -5)
        else
            select case (dis%itemAction)
                case (ODA_DRAWENTIRE)
                    call DrawEntireItem(lpdis, -7)

                case (ODA_SELECT)
                    call HandleSelectionState(lpdis, -3)

                case (ODA_FOCUS)
                    call HandleFocusState(lpdis, -5)
            end select
        end if

        !/* Return TRUE meaning that we processed this message. */
        ListBoxExample = .TRUE.
        return 

    case (WM_MEASUREITEM)
        lpmis = lParam
        call CopyMemory (LOC(mis), lpmis, SIZEOFMEASUREITEMSTRUCT)
        
        !/* All the items are the same height since the list box style is
        ! * LBS_OWNERDRAWFIXED
        ! */
        mis%itemHeight = 30
        call CopyMemory (lpmis, LOC(mis), SIZEOFMEASUREITEMSTRUCT)

    case (WM_CLOSE)
        bret = EndDialog(hDlg, 0)
        ListBoxExample = .TRUE.
        return 

    case DEFAULT
        ListBoxExample = .FALSE.
        return 
end select

ListBoxExample = .TRUE.
return 
end

!****************************************************************************
!*                                                                          *
!*  FUNCTION   : ComboBoxExample(hWnd, message, wParam, lParam)             *
!*                                                                          *
!*  PURPOSE    : Dialog function for the text combo dialog. The push buttons*
!*               send various messages to the combo box and the edit control*
!*               when selected. They allow the user to vary data sent with  *
!*               each message.                                              *
!*                                                                          *
!****************************************************************************/
logical(4) function ComboBoxExample(hDlg, message, wParam, lParam)
!MS$ATTRIBUTES STDCALL, ALIAS : '_ComboBoxExample@16' :: ComboBoxExample
use msfwin
use owncbinc
integer*4   hDlg, message, wParam, lParam
integer*4   hWndCombo             !/* Handle to the combo box control */
                                   !/* in the dialog box window        */
integer*4   hWndCheckBox          !/* Handle to the Auto Check Box    */
character   strSingleEditLine*255  !/* Single line edit control input  */
integer*4   wIndex, wCount
integer(4)  ret
logical(4)  bret


!/* Get handles to the Combo box and the Check box */
hWndCombo     = GetDlgItem(hDlg, ID_COMBOBOX)
hWndCheckBox  = GetDlgItem(hDlg, ID_STEPSBOX)

select case (message)
    case (WM_COMMAND)
        !select case (INT4(LoWord(wParam)))
        sel = INT4(LoWord(wParam))
            if (sel == IDOK) then
            !case (IDOK)
                bret = EndDialog (hDlg,0)
                ComboBoxExample = .TRUE.
                return
            else if (sel == ID_UNSLBUTTON) then
            !case (ID_UNSLBUTTON)
                !/* Selecting this button unselects any selection in the
                ! * combo box.
                ! */
                bret = SetDlgItemText (hDlg, ID_TEXT1, ""C)
                bret = SetDlgItemText (hDlg, ID_TEXT2, ""C)
                wIndex = SendMessage( hWndCombo,CB_GETCURSEL,0,0)
                if (wIndex == CB_ERR) then
                    ret = MessageBox (hDlg, "No Selection"C, &
                                            ""C, MB_OK)
                else
                    ret = SendMessage (hWndCombo, CB_SETCURSEL,   &
                                            -1, 0)
                end if
                ret = SetFocus (GetDlgItem (hDlg, ID_SINGLEEDIT))

            else if (sel == ID_NUMSELBUTTON) then
            !case (ID_NUMSELBUTTON)
                !/* An integer value is taken from the edit control and an
                ! * attempt is made to select a combo box entry having this
                ! * index.
                ! */
                bret = SetDlgItemText (hDlg, ID_TEXT1, ""C)
                bret = SetDlgItemText (hDlg, ID_TEXT2, ""C)
                wCount = SendMessage (hWndCombo,CB_GETCOUNT,0,0)
                wIndex = GetDlgItemInt (hDlg, ID_SINGLEEDIT,      &
                                        NULL, .TRUE.)
                if (wIndex .ge. wCount) then
                    ret = MessageBox (hDlg, "Bad Selection"C,&
                                        ""C, MB_OK)
                else
                    ret = SendMessage(hWndCombo, CB_SETCURSEL,    &
                                        wIndex, 0)
                end if
                ret = SetFocus (GetDlgItem (hDlg, ID_SINGLEEDIT))


            else if (sel == ID_TXTSELBUTTON) then
            !case (ID_TXTSELBUTTON)
                !/* A text string is taken from the edit control and an
                ! * attempt is made to select a combo box entry having the
                ! * string as a prefix.
                ! */
                bret = SetDlgItemText (hDlg, ID_TEXT1, ""C)
                bret = SetDlgItemText (hDlg, ID_TEXT2, ""C)
                bret = GetDlgItemText (hDlg, ID_SINGLEEDIT,        &
                              strSingleEditLine, 255)
                wIndex = SendMessage (hWndCombo,                  &
                                        CB_SELECTSTRING,          &
                                        -1,                       &
                                        LOC(strSingleEditLine))
                if (wIndex == CB_ERR) then
                    ret = MessageBox (hDlg, "Bad Selection"C,&
                                        ""C, MB_OK)
                end if
                ret = SetFocus (GetDlgItem (hDlg, ID_SINGLEEDIT))

            else if (sel == ID_FNDSELBUTTON) then
            !case (ID_FNDSELBUTTON)
                !/* Searches for the text specified in the list of combo
                ! * entries and returns the index (in combo box) of the
                ! * first match. The index is displayed in the "Text1"
                ! * field of the dialog.
                ! */
                bret = SetDlgItemText (hDlg, ID_TEXT1, ""C)
                bret = SetDlgItemText (hDlg, ID_TEXT2, ""C)
                bret = GetDlgItemText (hDlg,                    &
                                 ID_SINGLEEDIT,                 &
                                 strSingleEditLine,             &
                                 255)
                wIndex = SendMessage (hWndCombo,                  &
                                        CB_FINDSTRING,-1,         &
                                        LOC(strSingleEditLine))
                if (wIndex == CB_ERR) then                      
                    ret = MessageBox (hDlg, "Bad Selection"C, &
                                ""C, MB_OK)
                else
                    bret = SetDlgItemInt (hDlg, ID_TEXT1, wIndex,  &
                                            .FALSE.)
                end if
                ret = SetFocus (GetDlgItem (hDlg, ID_SINGLEEDIT))
                

            else if (sel == ID_CLRBUTTON) then
            !case (ID_CLRBUTTON)
                !/* Clears the combo box of all it's entries */
                bret = SetDlgItemText (hDlg, ID_TEXT1, ""C)
                bret = SetDlgItemText (hDlg, ID_TEXT2, ""C)
                wCount = SendMessage (hWndCombo,CB_GETCOUNT,0,0)
                if (wCount == 0) then
                    ret = MessageBox (hDlg, "Already clear"C,&
                                    ""C, MB_OK)
                else
                    bret = SetDlgItemInt (hDlg, ID_TEXT1, wCount,  &
                                                        .TRUE.)
                    bret = SetDlgItemText (hDlg, ID_TEXT2,         &
                                   "Items cleared"C )
                    ret = SendMessage (hWndCombo, CB_RESETCONTENT,&
                                            0, 0)
                end if
                ret = SetFocus (GetDlgItem (hDlg,ID_SINGLEEDIT))

            else if (sel == ID_ADDBUTTON) then
            !case (ID_ADDBUTTON)
                !/* Takes the string specified in the edit control and
                ! * adds it to the combo box.
                ! */
                bret = SetDlgItemText (hDlg, ID_TEXT1, ""C)
                bret = SetDlgItemText (hDlg, ID_TEXT2, ""C)
                bret = GetDlgItemText (hDlg, ID_SINGLEEDIT,        &
                                strSingleEditLine, 255)
                ret = SendMessage (hWndCombo,                     &
                              CB_ADDSTRING,                       &
                              0,                                  &
                              LOC(strSingleEditLine))
                ret = SetFocus (GetDlgItem (hDlg, ID_SINGLEEDIT))

            else if (sel == ID_DELETEBUTTON) then
            !case (ID_DELETEBUTTON)
                !/* Delete the currently selected item from the combo box. */
                bret = SetDlgItemText (hDlg, ID_TEXT1, ""C)
                bret = SetDlgItemText (hDlg, ID_TEXT2, ""C)
                wIndex = SendMessage (hWndCombo, CB_GETCURSEL,0,0)
                if (SendMessage (hWndCombo, CB_DELETESTRING,      &
                                    wIndex, 0) == CB_ERR) then
                    ret = MessageBox (hDlg, "No Selection"C, &
                                    ""C, MB_OK)
                else
                    bret = SetDlgItemText (hDlg, ID_TEXT1,         &
                                    "deleted index #"C)
                    bret = SetDlgItemInt  (hDlg, ID_TEXT2,         &
                                    wIndex, .TRUE.)
                end if
                ret = SetFocus (GetDlgItem (hDlg, ID_SINGLEEDIT))

            else if (sel == ID_CBDIRBUTTON) then
            !case (ID_CBDIRBUTTON)
                !/* Appends a directory listing of the current directory
                ! * to the combo box entries.
                ! */
                bret = SetDlgItemText (hDlg, ID_TEXT1, ""C)
                bret = SetDlgItemText (hDlg, ID_TEXT2, ""C)
                wIndex = SendMessage (hWndCombo,                  &
                                            CB_DIR,               &
                                            IOR(#10,#4000),       &
                                            LOC("*.*"C))
                ret = SetFocus (GetDlgItem (hDlg, ID_SINGLEEDIT))


            
            else if (sel == ID_CPYBUTTON) then
            !case (ID_CPYBUTTON)
                !/* Copies the currently selected item in the combo box to
                ! * the edit control.
                ! */
                bret = SetDlgItemText (hDlg, ID_TEXT1, ""C)
                bret = SetDlgItemText (hDlg, ID_TEXT2, ""C)
                wIndex = SendMessage (hWndCombo, CB_GETCURSEL,    &
                                        0, 0)
                if (wIndex == CB_ERR) then
                    ret = MessageBox(hDlg, "No Selection"C,  &
                                    ""C, MB_OK)
                else
                    wCount = SendMessage (hWndCombo,              &
                                    CB_GETLBTEXTLEN, wIndex, 0)
                    ret = SendMessage (hWndCombo,                 &
                                  CB_GETLBTEXT,                   &
                                  wIndex,                         &
                                  LOC(strSingleEditLine))
                    bret = SetDlgItemText(hDlg, ID_SINGLEEDIT,     &
                                    strSingleEditLine)
                    bret = SetDlgItemText(hDlg, ID_TEXT1,          &
                                    "copied index #"C)
                    bret = SetDlgItemInt(hDlg, ID_TEXT2,           &
                                        wIndex, .TRUE.)
                end if
                ret = SetFocus (GetDlgItem (hDlg, ID_SINGLEEDIT))

            !/* When the combo notification box is checked, a message box
            ! * is flashed showing what notification codes the combo box is
            ! * returning to the app. in response to the messages sent by
            ! * the buttons.
            ! */
            else if (sel == ID_COMBOBOX) then   
            !case (ID_COMBOBOX)
                if (SendMessage (hWndCheckBox, BM_GETCHECK, 0, 0) &
                                    .NE. 0) then
                    select case (INT4(HiWord(lParam)))
                        case (CBN_ERRSPACE)
                          ret = MessageBox (hDlg,                 &
                                "CB Out of Space"C,               &
                                "CB MSG"C,                        &
                                MB_OK)

                        case (CBN_SELCHANGE)
                          ret = MessageBox (hDlg,                 &
                              "CB Sel Change"C,                   &
                              "CB MSG"C,                          &
                              MB_OK)

                        case (CBN_DBLCLK)
                           ret = MessageBox(hDlg,                 &
                                 "CB Double Click"C,              &
                                 "CB MSG"C,                       &
                                 MB_OK)

                        case (CBN_SETFOCUS)
                           bret = SetDlgItemText(hDlg, ID_TEXT1,  &
                                     "CB SetFocus"C )

                        case (CBN_KILLFOCUS)
                          bret = SetDlgItemText(hDlg, ID_TEXT1,    &
                                    "CB KillFocus"C)
                    end select
                end if

            else 
            !case DEFAULT
                ComboBoxExample = .FALSE.
                return
            end if
        !end select

    case (WM_CLOSE)
        bret = EndDialog(hDlg, 0)
        ComboBoxExample = .TRUE.
        return

    case DEFAULT
        ComboBoxExample = .FALSE.
        return
end select
ComboBoxExample = .TRUE.
return
end





