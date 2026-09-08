!***************************************************************************
!*
!*    FUNCTION: MainWndProc(HWND, unsigned, WORD, LONG)
!*
!*    PURPOSE:  Processes messages
!*
!*    COMMENTS:
!*
!*        This function processes all messags sent to the window.  When the
!*        user choses one of the options from one of the menus, the command
!*        is processed here and passed onto the function for that command.
!*        This function also processes the special "FindReplace" message that
!*        this application registers for hook processing of the FindText()
!*        and ReplaceText() common dialog functions.
!*
!*************************************************************************** 

integer function MainWndProc( hWnd, message, wParam, lParam )
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MainWndProc@16' ::MainWndProc
use cmndlgin

integer hWnd         !  window handle                    
integer message      !  type of message                  
integer wParam       !  additional information           
integer lParam       !  additional information           

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

integer*4               hDC
type (T_PAINTSTRUCT)    ps
integer                 nDrawX
integer                 nDrawY
integer                 hFont
integer                 Handle
integer                 NewFont
type(T_FINDREPLACE)     FR
logical(4)              bret
character*512           FileNameString
save NewFont

   select case (message) 
      case (WM_CREATE)
      !  initialize the output on the screen
         FileBuf = "Hello World!"C
         dwFileSize = lstrlen(FileBuf)
         crColor = 0
         NewFont = .FALSE.

      case (WM_PAINT)
      ! Set up a display context to begin painting  
         hDC = BeginPaint (hWnd, ps)

         !  Initialize drawing position to 1/4 inch from the top   
         !  and from the left of the top, left corner of the       
         !  client area of the main windows.                       
         nDrawX = GetDeviceCaps(hDC, LOGPIXELSX) / 4   !  1/4 inch  
         nDrawY = GetDeviceCaps(hDC, LOGPIXELSY) / 4   !  1/4 inch  

         if ( NewFont == TRUE ) then
            hFont = CreateFontIndirect(lf)
            Handle = SelectObject( hDC, hFont )
         end if

         i = SetTextColor( hDC, crColor )
         i = TextOut (hDC, nDrawX, nDrawY,FileBuf,dwFileSize)
         !  end painting and release hDC
         i = EndPaint( hWnd,ps)
      
      case (WM_COMMAND)           !  message: command from application menu *
         select case( INT4(LOWORD( wParam )))
            case (IDM_OPENFILE)
               if ( OpenNewFile( hWnd ) == TRUE ) then
                  !  enable the Save As and Print menu items
                  i = EnableMenuItem( GetMenu( hWnd ), IDM_SAVEFILE,&
                            IOR(MF_BYCOMMAND , MF_ENABLED ))
                  i = EnableMenuItem( GetMenu( hWnd ), IDM_PRINT,&
                            IOR(MF_BYCOMMAND , MF_ENABLED ))
                  i = DrawMenuBar( hWnd)
                  !  reset the title in the title bar to reflect the
                  !  new open file
                  iret = ConvertFToCString(FileNameString,OpenFN%lpstrFile )
                  i = SetWindowText( hWnd, FileNameString )
                  !  reset the current color and current font to the
                  !  default
                  crColor = 0
                  NewFont = FALSE
                  i  = InvalidateRect( hWnd, NULL_RECT, .TRUE.)
               end if
            
            case (IDM_SAVEFILE)
                  OpenFN%Flags = 0
                  i = SaveToFile( hWnd )
            
            case (IDM_SAVEFILEAS)
                  if ( SaveAs( hWnd ) == TRUE ) then
                     i = EnableMenuItem( GetMenu( hWnd ), IDM_SAVEFILE,&
                            IOR(MF_BYCOMMAND , MF_ENABLED ))
                     iret = ConvertFToCString(FileNameString,OpenFN%lpstrFile)
                     i = SetWindowText( hWnd,FileNameString)
                     i = DrawMenuBar( hWnd )
                  end if
            
            case (IDM_EXIT)
               call PostQuitMessage(0)
            
            case (IDM_PRINT)
                  call PrintFile( hWnd )
            
            case (IDM_CHOOSECOLOR)
               if (ChooseNewColor( hWnd ) .ne. 0) then
                  i = InvalidateRect( hWnd, NULL_RECT, .TRUE.)
               end if

            case (IDM_CHOOSEFONT)
               NewFont = ChooseNewFont( hWnd )
               if ( NewFont .ne. 0) then
                  i = InvalidateRect( hWnd, NULL_RECT, .TRUE. )
               end if
            
            case (IDM_FINDTEXT)
               call CallFindText( hWnd )
            
            case (IDM_REPLACETEXT)
               call CallReplaceText( hWnd )

            case (IDM_STANDARD)
               !  enable the ChooseColor() option
               i = EnableMenuItem(GetMenu(hWnd), IDM_CHOOSECOLOR,&
                         IOR(MF_BYCOMMAND , MF_ENABLED ))
               !  uncheck previous selection
               i = CheckMenuItem( GetMenu( hWnd ), wMode, &
                                  IOR(MF_UNCHECKED , MF_BYCOMMAND))
               ! reset mode
               wMode = INT2(LOWORD(wParam))
               !  check new selection
               i = CheckMenuItem( GetMenu( hWnd ), wMode, &
                                    IOR(MF_CHECKED , MF_BYCOMMAND))
               i = DrawMenuBar( hWnd)
            
            case (IDM_HOOK, IDM_CUSTOM)
               !  disable the ChooseColor() option
               i = EnableMenuItem(GetMenu(hWnd), IDM_CHOOSECOLOR,&
                         IOR(MF_BYCOMMAND , MF_GRAYED ))
               !  uncheck previous selection
               i = CheckMenuItem( GetMenu( hWnd ), wMode, &
                               IOR(MF_UNCHECKED , MF_BYCOMMAND))
               ! reset mode
               wMode = INT2(LOWORD(wParam))                       
               ! check new selection
               i  = CheckMenuItem( GetMenu( hWnd ), wMode, &
                               IOR(MF_CHECKED , MF_BYCOMMAND))
               i = DrawMenuBar( hWnd)
            
            case (IDM_ENTERNEW)
               if (DialogBoxParam(hInst, &               !  current instance          
                        LOC("EnterNewBox"C), &           !  resource to use           
                        hWnd, &                          !  parent handle             
                        LOC(EnterNew), 0) == TRUE) then
                  i = InvalidateRect( hWnd, NULL_RECT, .TRUE.)
               end if 
            
            case (IDM_ABOUT)
               i = DialogBoxParam(hInst, &             !  current instance          
                         LOC("AboutBox"C),&                      !  resource to use           
                        hWnd,&                    !  parent handle             
                        LOC(About), 0)           !  About() instance address  
            
            case default
               MainWndProc = DefWindowProc(hWnd, message, wParam,lParam)
               return
         end select

      case (WM_DESTROY)                  !  message: window being destroyed *
         call PostQuitMessage(0)

      case default
         if (message == FindReplaceMsg) then
            lpFr = lparam
            call CopyMemory (LOC(FR), lpFr, 40)
            if (IAND(FR%flags, FR_DIALOGTERM)) then
                MainWndProc = 0
                return
            end if
            call SearchFile (lpFR)
            bret = InvalidateRect( hWnd, NULL_RECT, .TRUE.)
            MainWndProc = 0
            return
         end if

         MainWndProc = DefWindowProc(hWnd, message, wParam, lParam)
         return
   end select
   MainWndProc = 0
   return
end 


!***************************************************************************
!*
!*    FUNCTION: EnterNew(HWND, UINT, UINT, LONG)
!*
!*    PURPOSE:  Processes messages for "EnterNew" dialog box
!*
!*    COMMENTS:
!*
!*        This function allows the user to enter new text in the current
!*        window.  This text is stored in the global current buffer.
!*
!*************************************************************************** 

integer*4 function EnterNew( hDlg, message, wParam, lParam )
!MS$ ATTRIBUTES STDCALL, ALIAS : '_EnterNew@16' :: EnterNew
use cmndlgin

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




integer hDlg                !  window handle of the dialog box  
integer message             !  type of message                  
integer wParam              !  message-specific information     
integer lParam


character*(FILE_LEN-1) Buf

LPARAM = LPARAM
   select case (message)
      case (WM_INITDIALOG)                !  message: initialize dialog box *
         EnterNew = TRUE
         return

      case (WM_COMMAND)                      !  message: received a command *
         if (INT2(LOWORD(wParam)) == IDOK) then
            buf = "                                                     &
                          "C
            i  = GetDlgItemText( hDlg, IDEDIT,Buf,FILE_LEN-1)
            FileBuf = Buf 
            dwFileSize = lstrlen(FileBuf)
            i  = EndDialog( hDlg, TRUE )
            EnterNew = TRUE
            return
            else if (INT2(LOWORD(wParam)) == IDCANCEL) then
            !  System menu close command?  
            i = EndDialog(hDlg, FALSE)       !  Exits the dialog box         
            EnterNew = TRUE
            return
         end if
   end select
   EnterNew = FALSE
   return
end 





