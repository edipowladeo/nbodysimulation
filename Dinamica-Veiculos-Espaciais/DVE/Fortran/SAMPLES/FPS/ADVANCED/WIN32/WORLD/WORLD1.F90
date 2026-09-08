!**********************************************************************
!* Function: AboutDlgProc(HWND, UINT, WPARAM, LPARAM)                 *
!*                                                                    *
!*  Purpose: Processes "About" Dialog Box Messages                    *
!*                                                                    *
!* Comments: The Dialog Box is displayed when the user selects        *
!*           Help.About.                                              *
!*                                                                    *
!**********************************************************************

integer*4 function AboutDlgProc( hDlg, uMsg, wParam, lParam )
!MS$ ATTRIBUTES STDCALL, ALIAS : '_AboutDlgProc@16' :: AboutDlgProc
use worldinc

interface 
integer function MainWndProc( hwnd, mesg, wParam, lParam )
integer  hwnd 
integer mesg 
integer wParam
integer lParam 
end function MainWndProc
end interface



interface 
integer function ScaleDlgProc( hwnd, mesg, wParam, lParam )
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ScaleDlgProc@16' :: ScaleDlgProc
integer  hwnd 
integer mesg 
integer wParam 
integer lParam 
end function ScaleDlgProc
end interface

interface 
subroutine SetUnityXform
end subroutine SetUnityXform
end interface

interface 
integer function OpenMetaFl (hwnd)
integer hwnd
end function OpenMetaFl
end interface

integer*4 hDlg
integer*4 uMsg
integer*4 wParam
integer*4 lParam
!type (OPENFILENAME) OFName

lParam = lParam

   select case ( uMsg ) 
      case (WM_COMMAND)
         select case (INT4(LOWORD( wParam ) ))
            case (IDOK)
               i =  EndDialog( hDlg, TRUE )
               AboutDlgProc = 1
               return
         end select
      case default
         AboutDlgProc = 0
         return 
   end select
return 
end 
    


!**********************************************************************
!* Function: BOOL OpenMetafile( HWND )                                *
!*                                                                    *
!*  Purpose: Gets Metafile name and opens the Metafile                *
!*                                                                    *
!* Comments: Uses the Common Dialog GetOpenFileName() to prompt user  *
!*           for the name of the Metafile to be opened.  If the name  *
!*           is successfully retrieved, GetEnhMetaFile() is used to   *
!*           open the Metafile.                                       *
!*                                                                    *
!**********************************************************************
integer function OpenMetafl( hWnd )
use worldinc

integer hWnd
logical lret

   szFile(1:) = char(0)
   szFileTitle(1:) = char(0)
   

   iret = lstrcpy(szFilter,"Metafile (*.EMF)|*.emf|All Files (*.*)|*.*||"C)
   call ConvertFilterString(szFilter)

   FileBuffer(1:) = char(0)
   
   ofname%lStructSize       = 76 !sizeof (OPENFILENAME)
   ofname%hwndOwner         = hWnd
   ofname%lpstrFilter       = LOC(szFilter)
   ofname%lpstrCustomFilter = NULL
   ofname%nMaxCustFilter    = 0
   ofname%nFilterIndex      = 0
   ofname%lpstrFile         = LOC(Filebuffer)
   ofname%nMaxFile          = MAX_PATH
   ofname%lpstrFileTitle    = NULL
   ofname%nMaxFileTitle     = 0
   ofname%lpstrInitialDir   = LOC(""C)
   ofname%lpstrTitle        = NULL
   ofname%Flags             = OFN_HIDEREADONLY
   ofname%nFileOffset       = 0
   ofname%nFileExtension    = 0
   ofname%lpstrDefExt       = NULL
   ofname%lCustData         = 0
   ofname%lpfnHook          = NULL
   ofname%lpTemplateName    = NULL

   lret = GetOpenFileName (OFName)
   ierror = CommDlgExtendedError ()

   if( lret .eqv. .FALSE. ) then
      OpenMetafl = 0
   else 
      iret = ConvertFToCString(FileName, OFName%lpstrFile)
      hEMF = GetEnhMetaFile(FileName)
      bFileOpen = TRUE
      bFileJustOpen = TRUE
      OpenMetafl = 1
   end if
   end 

!**********************************************************************
!* Function: void SetUnityXform( VOID )                               *
!*                                                                    *
!*  Purpose: Helper routine which sets the unity transform            *
!*                                                                    *
!* Comments: These fields have the following use in this application: *
!*                                                                    *
!*                  eM11: Horizontal Scaling Factor                   *
!*                  eM12: Not Used                                    *
!*                  eM21: Not Used                                    *
!*                  eM22: Vertical Scaling Factor                     *
!*                  eDx: Horizontal Translation                       *
!*                  eDy: Vertical Translation                         *
!*                                                                    *
!**********************************************************************
subroutine SetUnityXform( )
use worldinc
   xForm1%eM11 = 1.0
   xForm1%eM12 = 0.0
   xForm1%eM21 = 0.0
   xForm1%eM22 = 1.0
   xForm1%eDx  = 0.0
   xForm1%eDy  = 0.0
end 
