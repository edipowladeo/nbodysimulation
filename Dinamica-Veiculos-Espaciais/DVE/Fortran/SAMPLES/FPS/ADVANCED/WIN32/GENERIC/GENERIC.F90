integer function WinMain( hInstance, hPrevInstance, lpszCmdLine, nCmdShow )
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WinMain@16' :: WinMain
use msfwin


integer hInstance
integer hPrevInstance
integer nCmdShow
integer lpszCmdLine

type (T_WNDCLASS)       wc
type (T_MSG)            mesg
integer                 hWnd
integer                 hmenu
integer                 ghInstance
integer                 temp1
COMMON /globdata/       ghInstance

include 'generic.fi'

character*100 lpszClassName, lpszIconName, lpszMenuName, lpszAppName


lpszCmdLine = lpszCmdLine
nCmdShow = nCmdShow
temp1 = hInstance

lpszClassName ="Generic"C
lpszAppName ="Generic Sample"C
lpszMenuName ="Generic"C
lpszIconName ="Generic"C  
if(hPrevInstance .eq. 0) then
     wc%lpszClassName = LOC(lpszClassName)
     wc%lpfnWndProc = LOC(MainWndProc)
     wc%style = IOR(CS_VREDRAW , CS_HREDRAW)
     wc%hInstance = hInstance
     wc%hIcon = LoadIcon( hInstance, LOC(lpszIconName))
     wc%hCursor = LoadCursor( NULL, IDC_ARROW )
     wc%hbrBackground = ( COLOR_WINDOW+1 )
     wc%lpszMenuName = 0 
     wc%cbClsExtra = 0
     wc%cbWndExtra = 0
     i2 =  RegisterClass(wc)
end if

hmenu = LoadMenu(hInstance, LOC(lpszMenuName))
ghInstance = hInstance

hWnd = CreateWindowEx(  0, lpszClassName,                      &
                        lpszAppName,                           &
                        INT(WS_OVERLAPPEDWINDOW),              &
                        CW_USEDEFAULT,                         &
                        0,                                     &
                        CW_USEDEFAULT,                         &
                        0,                                     &
                        NULL,                                  &
                        hmenu,                                 &
                        hInstance,                             &
                        NULL                                   &
                        )

i = ShowWindow( hWnd, SW_SHOWNORMAL)
do while( GetMessage (mesg, NULL, 0, 0) .NEQV. .FALSE.) 
   i =  TranslateMessage( mesg )
   i =  DispatchMessage( mesg )
end do

WinMain = mesg.wParam
end 

integer function MainWndProc ( hWnd, mesg, wParam, lParam )
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MainWndProc@16' :: MainWndProc
use msfwin
use gene_inc
interface 
integer*4 function  AboutDlgProc( hwnd, mesg, wParam, longParam )
!MS$ ATTRIBUTES STDCALL, ALIAS : '_AboutDlgProc@16' :: AboutDlgProc
integer hwnd 
integer mesg  
integer wParam
integer longParam 
end function 
end interface
integer hWnd, mesg, wParam, lParam

integer*4  ret
integer ghInstance
COMMON /globdata/ ghInstance
integer           temp1
character*100  lpszDlgName, lpszHelpFileName, lpszContents, lpszMessage
character*100  lpszHeader

   select case ( mesg )
      case (WM_COMMAND)
         temp1 = INT4(LOWORD(wParam))
         temp1 = IDM_HELPCONTENTS
         select case ( INT4(LOWORD(wParam ) ))
 
            case (IDM_EXIT)
               i = SendMessage( hWnd, WM_CLOSE, 0, 0 )
  
            case (IDM_ABOUT)
               lpszDlgName = "AboutDlg"C
               ret = DialogBoxParam(ghInstance,LOC(lpszDlgName),hWnd,& 
                  LOC(AboutDlgProc), 0)

            case (300)  !IDM_HELPCONTENTS
               lpszHelpFileName ="c:\\f90\\generic\\GENERIC.hlp"C
               lpszContents = "CONTENTS"C
               if (WinHelp (hWnd, lpszHelpFileName, HELP_KEY, &
                               LOC(lpszContents)) .EQV. .FALSE.) then
               lpszMessage = "Unable to activate help"C
               lpszHeader = "Generic"
               ret = MessageBox (hWnd,                  &
                                 lpszMessage,&
                                 lpszHeader,                 &
                                 IOR(MB_SYSTEMMODAL,             &
                                 IOR(MB_OK, MB_ICONHAND)))
               end if

            case (IDM_HELPSEARCH)
               lpszHelpFileName ="c:\\f90\\generic\\GENERIC.HLP"C
               lpszContents = "CONTENTS"C
               if (WinHelp(hWnd, "GENERIC.HLP"C,            &
                       HELP_PARTIALKEY, LOC(""C)) .EQV. .FALSE.) then
                  lpszMessage = "Unable to activate help"C
                  lpszHeader = "Generic"C
                  ret = MessageBox (hWnd,                 &
                                 lpszMessage,&
                                 lpszHeader,                 &
                                 IOR(MB_SYSTEMMODAL ,            &
                                 IOR(MB_OK, MB_ICONHAND)))
               end if

            case (IDM_HELPHELP)
               if (WinHelp(hWnd, ""C, HELP_HELPONHELP, 0).EQV. .FALSE.)& 
                                                       then
                  lpszMessage = "Unable to activate help"C
                  lpszHeader = "Generic"C
                  ret = MessageBox (GetFocus(),                 &
                                 lpszMessage,&
                                 lpszHeader,                 &
                                 IOR(MB_SYSTEMMODAL,IOR(MB_OK, MB_ICONHAND)))
               end if

            ! Here are all the other possible menu options,
            ! all of these are currently disabled:
            ! case (IDM_NEW, IDM_OPEN, IDM_SAVE,IDM_SAVEAS,IDM_UNDO,&
            ! IDM_CUT, IDM_COPY, IDM_PASTE, IDM_LINK, IDM_LINKS)

               case DEFAULT
                  WndProc = DefWindowProc(hWnd, message, wParam,    &
                                       lParam)
                  return
            end select

!****************************************************************
!*     WM_DESTROY: PostQuitMessage() is called                  *
!****************************************************************

         case (WM_DESTROY)
               call PostQuitMessage( 0 )

!****************************************************************
!*     Let the default window proc handle all other messages    *
!****************************************************************

         case default
               MainWndProc = DefWindowProc( hWnd, mesg, wParam, lParam )
         end select

      end 


