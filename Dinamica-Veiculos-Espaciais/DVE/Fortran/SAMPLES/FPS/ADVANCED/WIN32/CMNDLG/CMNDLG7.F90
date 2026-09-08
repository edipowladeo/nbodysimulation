!****************************************************************************
!*
!*    FUNCTION: SaveToFile( HWND )
!*
!*    PURPOSE:  Saves the current buffer to the current file.
!*
!*    COMMENTS:
!*
!*        This function will save the current text buffer into the file
!*        specified from the GetSaveFileName() common dialog function.
!*
!*    RETURN VALUES:
!*        TRUE - The file was saved successfully.
!*        FALSE - The buffer was not saved to a file.
!*
!*************************************************************************** 
integer*4 function SaveToFile( hWnd )
use cmndlgin
integer hWnd

integer             hFile
type (T_OFSTRUCT)   OfStruct1
integer             wStyle
character*256       buf
character*500       lpStrPtr

   if (IOR(OpenFN%Flags , OFN_FILEMUSTEXIST) .ne. 0) then
      wStyle = OF_READWRITE
   else
      wStyle = IOR(OF_READWRITE , OF_CREATE)
   end if

   ret = convertFtoCstring(lpStrPtr,OpenFN%lpstrFile);
   hFile = OpenFile(lpStrPtr, OfStruct1, wStyle)

   if (hFile  == -1) then
      i = MessageBox( hWnd, "Unable to create the specified file"C, ""C, MB_OK )
      SaveToFile = FALSE
      return
   end if
   
   !     write it's contents into a file
   if (lwrite( hFile, FileBuf, dwFileSize)==-1) then
      i = MessageBox( hWnd, "Error writing file"C, ""C, MB_OK )
      SaveToFile = FALSE
      return
   end if

!     close the file
   i = lclose( hFile )

   write(buf, '(A25)') OpenFN%lpstrFile 
   i  = MessageBox(hWnd, buf, "File Saved"C, MB_OK)
   SaveToFile = TRUE
   return
end


! ***************************************************************************
!*
!*    FUNCTION: FileSaveHookProc(HWND, UINT, UINT, LONG)
!*
!*    PURPOSE:  Processes messages for FileSave common dialog box
!*
!*    COMMENTS:
!*
!*        This hook procedure prompts the user if they want to save the
!*        current file.  If they choose YES, the file is saved and the dialog
!*        is dismissed.  If they choose NO, they are returned to the
!*        GetSaveFileName() common dialog.
!*
!*        If the current mode calls for a customized template, this function
!*        will test the 'Create File?' checkbox.  If the user choses no, the
!*        OFN_FILEMUSTEXIST flag is set.
!*
!*    RETURN VALUES:
!*        TRUE - User chose 'Yes' from the "Are you sure message box".
!*        FALSE - User chose 'No' return to the dialog box.
!*
!*
!*************************************************************************** 

integer*4 function FileSaveHookProc( hDlg, message, wParam,lParam)
!MS$ ATTRIBUTES STDCALL, ALIAS :'_FileSaveHookProc@16' :: FileSaveHookProc
use cmndlgin

interface 
integer*4 function MainWndProc( hWnd, message, wParam, lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MainWndProc@16':: MainWndProc
integer  hWnd , message , wParam, lParam
end function
end interface

interface 
integer function FileOpenHookProc( hDlg, message, wParam,  lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FileOpenHookProc@16':: FileOpenHookProc
integer hDlg, message, wParam, lParam
end function
end interface


interface 
integer function About(hDlg, message, wParam, lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_About@16':: About
integer  hDlg, message, wParam, lParam
end function
end interface

interface 
integer function EnterNew(hDlg, message, wParam, lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_EnterNew@16':: EnterNew
integer hDlg , message  , wParam  , lParam 
end function
end interface

interface 
integer function ChooseColorHookProc( hDlg, message, wParam,  lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ChooseColorHookProc@16':: ChooseColorHookProc
integer hDlg, message, wParam, lParam
end function
end interface

interface 
integer function ChooseFontHookProc( hDlg, message, wParam,  lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ChooseFontHookProc@16':: ChooseFontHookProc
integer hDlg, message, wParam, lParam
end function
end interface

interface 
integer function FindTextHookProc( hDlg, message, wParam,  lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FindTextHookProc@16':: FindTextHookProc
integer hDlg, message, wParam, lParam
end function
end interface

interface 
integer function ReplaceTextHookProc( hDlg, message, wParam,  lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ReplaceTextHookProc@16':: ReplaceTextHookProc
integer hDlg, message, wParam, lParam
end function
end interface

interface 
integer function PrintDlgHookProc( hDlg, message, wParam,  lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_PrintDlgHookProc@16':: PrintDlgHookProc
integer hDlg, message, wParam, lParam
end function
end interface

interface 
integer function PrintSetupHookProc( hDlg, message, wParam,  lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_PrintSetupHookProc@16':: PrintSetupHookProc
integer hDlg, message, wParam, lParam
end function
end interface

interface 
integer function InitApplication( hInstance )
integer hInstance
end function
end interface

interface 
integer function InitInstance(hInstance, nCmdShow)
integer hInstance, nCmdShow
end function
end interface

interface 
integer function OpenNewFile( hWnd )
integer hWnd
end function
end interface

interface 
integer function SaveToFile( hWnd )
integer hWnd
end function
end interface

interface 
integer function SaveAs( hWnd )
integer hWnd
end function
end interface

interface 
subroutine SearchFile( LPFINDREPLACE )
!MS$ATTRIBUTES STDCALL, ALIAS : '_SearchFile@4' :: SearchFile
integer*4 LPFINDREPLACE
end subroutine
end interface

interface 
integer function ChooseNewFont( hWnd )
integer*4 hWnd 
end function
end interface

interface 
integer function ChooseNewColor( hWnd )
integer*4 hWnd 
end function
end interface

interface 
subroutine PrintFile( hWnd )
integer hWnd
end subroutine
end interface

interface 
subroutine CallFindText( hWnd ) 
integer hWnd
end subroutine
end interface

interface 
subroutine CallReplaceText( hWnd )
integer hWnd
end subroutine
end interface

interface 
subroutine ProcessCDError(dwErrorCode, hWnd)
integer dwErrorCode, hWnd
end subroutine
end interface



integer     hDlg     !  window handle of the dialog box  
integer     message  !   type of message                  
integer     wParam   !  message-specific information     
integer     lParam


character*256   szTempText
character*256   szString
character*100   lpszHEader

lparam = lparam

   select case (message)
      case (WM_COMMAND)
         if (LOWORD(wParam) == IDOK) then
            i = GetDlgItemText( hDlg, edt1, szTempText, 255)
            if(IAND(OpenFN%Flags,OFN_ENABLETEMPLATE ) .ne. 0) then
            !  check to see if the Create File box has been checked
            if ((SendMessage( GetDlgItem(hDlg, chx2),&
                            BM_GETCHECK, 0, 0)) ==FALSE ) then
               OpenFN%Flags = IOR(OpenFN%Flags ,OFN_FILEMUSTEXIST)
            end if
         else
            write( szString, 300) szTempText
300         FORMAT ('Are you sure you want to save ', A50)
            lpszHeader = "Information"C
            if ( MessageBox( hDlg, szString, lpszHeader,&
                         MB_YESNO ) == IDYES ) then
            end if
            FileSaveHookProc=TRUE
            return
         end if
      end if
   end select
   FileSaveHookProc= FALSE
   return
end 
