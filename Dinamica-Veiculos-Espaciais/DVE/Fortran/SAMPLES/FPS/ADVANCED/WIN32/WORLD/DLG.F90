!**********************************************************************
!* Function: ScaleDlgProc(HWND, UINT, WPARAM, LPARAM)                 *
!*                                                                    *
!*  Purpose: Processes "Scale Image" Dialog Box Messages.             *
!*                                                                    *
!* Comments: The following messages are processed:                    *
!*                                                                    *
!*           WM_INITDIALOG                                            *
!*           WM_COMMAND                                               *
!*                                                                    *
!**********************************************************************


integer function ScaleDlgProc( hDlg, uMsg, wParam, lParam )
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ScaleDlgProc@16' :: ScaleDlgProc
use worldinc

integer hDlg, uMsg, wParam, lParam
character*(MAXINPUT)    buffer
character*(MAXINPUT)    HorzInputBuf
character*(MAXINPUT)    VertInputBuf
save HorzInputBuf, VertInputBuf
integer index

lParam = lParam

   select case ( uMsg )

   !****************************************************************
   !*     WM_INITDIALOG: Strings representing the possible scale   *
   !*        factors are loaded into the comboboxes. The current   *
   !*        selection is indicated.                               *
   !****************************************************************
       case (WM_INITDIALOG)
       do index = FIRSTSTRING, LASTSTRING
             i = LoadString( GetModuleHandle(NULL), index, buffer, MAXINPUT)
            i = SendDlgItemMessage( hDlg, IDC_HORZ, CB_ADDSTRING, 0, LOC(buffer) )
              i = SendDlgItemMessage( hDlg, IDC_VERT, CB_ADDSTRING, 0, LOC(buffer) )
          end do
         if( (bFileJustOpen .ne. 0) .OR. (bFileOpen .eq. 0)) then
            HorzInputBuf = " 1.0"C
            VertInputBuf = " 1.0"C
            bFileJustOpen = FALSE
         end if

         i = SendDlgItemMessage( hDlg, IDC_HORZ, CB_SELECTSTRING, 0, LOC(HorzInputBuf) )
         i = SendDlgItemMessage( hDlg, IDC_VERT, CB_SELECTSTRING, 0, LOC(VertInputBuf) )
         ScaleDlgProc = TRUE

   !****************************************************************
   !*     WM_COMMAND: If the OK button is selected, the current    *
   !*        horizontal and vertical scaling factors are obtained  *
   !*        from the ComboBox and the transform is updated. If    *
   !*        the CANCEL button is selected, EndDialog() is called. *
   !****************************************************************
      case (WM_COMMAND)
       select case ( wParam ) 
             case (IDOK)
             index = SendDlgItemMessage( hDlg, IDC_HORZ, CB_GETCURSEL, 0, 0 )
               i = LoadString( GetModuleHandle(NULL), index,HorzInputBuf, MAXINPUT )
               xForm1%eM11 = chartoreal( LOC(HorzInputBuf))

               index = SendDlgItemMessage( hDlg, IDC_VERT, CB_GETCURSEL, 0, 0 )
               i = LoadString( GetModuleHandle(NULL), index, VertInputBuf, MAXINPUT )
               xForm1%eM22 = chartoreal(LOC(VertInputBuf))

               i = EndDialog( hDlg, TRUE )
               ScaleDlgProc = TRUE
              case (IDCANCEL)
               i = EndDialog( hDlg, FALSE )
               ScaleDlgProc = TRUE
       end select
      case default
         ScaleDlgProc = FALSE
   end select
   return        
end 

