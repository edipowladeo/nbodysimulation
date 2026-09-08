!***************************************************************************
!*
!*    FUNCTION: About(HWND, UINT, UINT, LONG)
!*
!*    PURPOSE:  Processes messages for "About" dialog box
!*
!*    COMMENTS:
!*
!*       No initialization is needed for this particular dialog box, but TRUE
!*       must be returned to Windows.
!*
!*       Wait for user to click on "Ok" button, then close the dialog box.
!*
!*************************************************************************** 

integer*4 function About( hDlg, message, wParam, lParam)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_About@16' :: About
use msfwina

interface 
integer*4 function MainWndProc( hWnd, message, wParam, lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MainWndProc@16':: MainWndProc
integer  hWnd , message , wParam, lParam
end function
end interface


interface 
integer function EnterNew(hDlg, message, wParam, lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_EnterNew@16':: EnterNew
integer hDlg , message  , wParam  , lParam 
end function
end interface

interface 
integer function FileOpenHookProc( hDlg, message, wParam,  lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FileOpenHookProc@16':: FileOpenHookProc
integer hDlg, message, wParam, lParam
end function
end interface

interface 
integer function FileSaveHookProc( hDlg, message, wParam,  lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FileSaveHookProc@16':: FileSaveHookProc
integer hDlg, message, wParam, lParam
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



integer hDlg             !  window handle of the dialog box  
integer message          !   type of message                  
integer wParam           !  message-specific information     
integer lParam

lParam = lParam

   select case (message)
      case (WM_INITDIALOG)               !  message: initialize dialog box  
         About = TRUE
         return

      case (WM_COMMAND)                      !   message: received a command  
         if (LOWORD(wParam) == IDOK &          !  "OK" box selected?         
            .OR. LOWORD(wParam) == IDCANCEL) then        !  System menu close command?  
            i = EndDialog(hDlg, TRUE)        !  Exits the dialog box         
            About = TRUE
            return
         end if
   end select

   About = .FALSE.
   return                           !  Didn't process a message     
end

!***************************************************************************
!*
!*    FUNCTION: FileOpenHookProc(HWND, UINT, UINT, LONG)
!*
!*    PURPOSE:  Processes messages for GetFileNameOpen() common dialog box
!*
!*    COMMENTS:
!*
!*        This function will prompt the user if they are sure they want
!*        to open the file if the OFN_ENABLEHOOK flag is set.
!*
!*        If the current option mode is CUSTOM, the user is allowed to check
!*        a box in the dialog prompting them whether or not they would like
!*        the file created.  If they check this box, the file is created and
!*        the string 'Empty' is written to it.
!*
!*    RETURN VALUES:
!*        TRUE - User chose 'Yes' from the "Are you sure message box".
!*        FALSE - User chose 'No' return to the dialog box.
!*
!*************************************************************************** 

integer*4 function FileOpenHookProc(hDlg, message, wParam, lParam)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FileOpenHookProc@16' :: FileOpenHookProc
use cmndlgin

integer hDlg        !  window handle of the dialog box  
integer message     !   type of message                  
integer wParam      !  message-specific information     
integer lParam

interface 
integer*4 function MainWndProc( hWnd, message, wParam, lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MainWndProc@16':: MainWndProc
integer  hWnd , message , wParam, lParam
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
integer function FileSaveHookProc( hDlg, message, wParam,  lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FileSaveHookProc@16':: FileSaveHookProc
integer hDlg, message, wParam, lParam
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


!//functions
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




integer             hFile
character*256       szTempText
character*256       szString
character*100       lpszMessage
type (T_OFSTRUCT)   OfStruct1

lparam = lparam

   select case (message)
      case (WM_COMMAND)
         if (LOWORD(wParam) == IDOK) then
            !i= GetDlgItemText(hDlg,edt1,szTempText,255)
            if ( IAND(OpenFN%Flags , OFN_PATHMUSTEXIST ) .ne. 0) then
               write(szString, 100) szTempText
100            format  ('Are you sure you want to open', A256)

               if ( MessageBox( hDlg, szString, "Information"C, &
                        MB_YESNO ) == IDYES ) then
                  !exit  
               end if
               FileOpenHookProc = TRUE
               return
            end if
            !  check to see if the Create File box has been checked
            !if ((SendMessage( GetDlgItem(hDlg, chx2),&
            !                       BM_GETCHECK, 0, 0 )) == TRUE ) then
            !  if so, create the file
            hFile = OpenFile(szTempText, ofstruct1, OF_CREATE)
            if (hFile == -1) then
               lpszMessage ="Directory could not be created."C
               i = MessageBox( hDlg,&
                            lpszMessage,&
                            ""C,&
                            MB_OK )
               FileOpenHookProc = FALSE
               return
            end if
            FileBuf = "Empty"C
            dwFileSize = len(FileBuf)
            if (lwrite( hFile, FileBuf, dwFileSize)==-1) then
               lpszMessage = "Error writing file."C
               i = MessageBox(hDlg,lpszMessage,""C,MB_OK)
               !  close the file
               i = lclose( hFile )
            end if
         end if
    end select
    FileOpenHookProc = FALSE
    return
end 

!***************************************************************************
!*
!*    FUNCTION: OpenNewFile(HWND)
!*
!*    PURPOSE:  Invokes common dialog function to open a file and opens it.
!*
!*    COMMENTS:
!*
!*        This function initializes the OPENFILENAME structure and calls
!*        the GetOpenFileName() common dialog function.  This function will
!*        work regardless of the mode: standard, using a hook or using a
!*        customized template.
!*
!*    RETURN VALUES:
!*        TRUE - The file was opened successfully and read into the buffer.
!*        FALSE - No files were opened.
!*
!*************************************************************************** 

integer*4 function OpenNewFile( hWnd )
use cmndlgin

integer hWnd


interface 
integer function FileOpenHookProc( hDlg, message, wParam,  lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FileOpenHookProc@16':: FileOpenHookProc
integer hDlg, message, wParam, lParam
end function
end interface


integer hFile
integer cBufLen
type (T_OFSTRUCT)   OfStruct1
character*100       lpszTitle, lpszDefExt, lpszMessage
integer wStyle
character*500       lpStrPtr

    szFile = "*.txt"C
    szFileTitle = " "C
    lpszTitle= "Open a File"C
    lpszDefExt= "*.txt"C
    iret = lstrcpy(szFilter,"Text Files (*.TXT)|*.TXT|All Files (*.*)|*.*||"C)
    call ConvertFilterString(szFilter)

   OpenFN%lStructSize       = 76 !sizeof(OpenFN)
   OpenFN%hwndOwner         = hWnd
   OpenFN%hInstance         = hInst
   OpenFN%lpstrFilter       = LOC(szFilter)
   OpenFN%lpstrCustomFilter = NULL
   OpenFN%nMaxCustFilter    = 0
   OpenFN%nFilterIndex      = 1
   OpenFN%lpstrFile         = LOC(szFile)
   OpenFN%nMaxFile          = 256
   OpenFN%lpstrFileTitle    = LOC(szFileTitle)
   OpenFN%nMaxFileTitle     = 256
   OpenFN%lpstrInitialDir   = NULL
   OpenFN%lpstrTitle        = LOC(lpszTitle)
   OpenFN%nFileOffset       = 0
   OpenFN%nFileExtension    = 0
   OpenFN%lpstrDefExt       = LOC(lpszDefExt)
   OpenFN%lCustData         = 0

   select case( wMode )
      case (IDM_STANDARD)
         OpenFN%Flags = IOR(OFN_SHOWHELP , IOR(OFN_PATHMUSTEXIST,&
                IOR(OFN_FILEMUSTEXIST , OFN_HIDEREADONLY)))

      case (IDM_HOOK)
         OpenFN%Flags = IOR(OFN_SHOWHELP , IOR(OFN_PATHMUSTEXIST ,&
                IOR(OFN_FILEMUSTEXIST , IOR(OFN_HIDEREADONLY , &
                OFN_ENABLEHOOK))))
         OpenFN%lpfnHook = LOC(FileOpenHookProc) !MakeProcInstance(LOC(FileOpenHookProc), NULL)

      case (IDM_CUSTOM)
         OpenFN%Flags = IOR(OFN_SHOWHELP , IOR(OFN_ENABLEHOOK ,&
                       IOR(OFN_HIDEREADONLY , OFN_ENABLETEMPLATE)))
         OpenFN%lpfnHook = LOC(FileOpenHookProc) !MakeProcInstance(LOC(FileOpenHookProc),NULL)
         OpenFN%lpTemplateName = INT(MAKEINTRESOURCE(INT2(FILEOPENORD)))
      end select
      
      if (GetOpenFileName(OpenFN) .neqv. .FALSE.) then
         if (IAND(OpenFN%Flags , OFN_READONLY ) .ne. 0) then
            wStyle = OF_READ
         else
            wStyle = OF_READWRITE
         end if

!        open the file

         ret = convertFtoCstring(lpStrPtr,OpenFN%lpstrFile);
         hFile = OpenFile(lpStrPtr,OfStruct1, wStyle )
         if (hFile == -1) then
            lpszMessage = "File open failed."C
            i = MessageBox( hWnd, lpszMessage, ""C, MB_OK )
            OpenNewFile = FALSE
            return
         end if
!        read it's contents into a buffer
         cBufLen = lread( hFile, LOC(FileBuf), FILE_LEN )

         if (cBufLen == -1) then
            lpszMessage = "Zero bytes read."C
            i  = MessageBox( hWnd, lpszMessage, ""C, MB_OK )
            OpenNewFile = FALSE
         return
         end if
!        close the file
      i = lclose( hFile )

      dwFileSize = cBufLen
   else
      call ProcessCDError(CommDlgExtendedError(), hWnd )
      OpenNewFile = .FALSE.
      return
   end if
      OpenNewFile = .TRUE.
      return
end 
 
