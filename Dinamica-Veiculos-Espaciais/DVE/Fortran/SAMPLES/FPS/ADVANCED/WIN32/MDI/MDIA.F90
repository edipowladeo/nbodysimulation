!\***************************************************************************/

integer*4 function About ( hDlg, message, wParam, lParam )
!MS$ ATTRIBUTES STDCALL, ALIAS : '_About@16' :: About
use mdiinc
integer hDlg, message, wParam, lParam

integer*4   ret
lParam = lParam

select case (message)
    case (WM_INITDIALOG)
        About = 1
        return

    case (WM_COMMAND)
        if (wParam == IDOK) then
            ret = EndDialog(hDlg, wParam)
        end if
end select

About = 0
return
end 

!/***************************************************************************\
!*
!* TextWndProc
!*
!* Text Window procedure for displaying miscellaneous messages to user.
!*
!* History:
!* 10-07-91
!*   3D text output
!*
!\***************************************************************************/

integer*4  function TextWndProc (hwnd, message, wParam, lParam)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_TextWndProc@16' :: TextWndProc
use msfwina
use mdiinc
integer hwnd, message, wParam, lParam      

integer*4 hFont
type (T_PAINTSTRUCT)        ps
type (T_RECT)               rc
character*128               ach
integer*4                   len, nxBorder, nyBorder
integer*4                   hOldFont
type (T_LOGFONT)            lf
integer*4                   hDC
integer*4                   hOldFont1
type (T_TEXTMETRIC)         tm
type (T_RECT)               rects
integer                     lHeight


SAVE    hFont, hOldFont
data hFont  /NULL/, hOldFont /NULL/


select case (message)

    case (WM_CREATE)

        ret = SystemParametersInfo(SPI_GETICONTITLELOGFONT,       &
                    SIZEOFLF, LOC(lf), FALSE)

        hDC = GetDC(hwnd)
!            // this is the height for 8 point size font in pixels
        lf%lfHeight = 8 * GetDeviceCaps(hDC, LOGPIXELSY) / 72

        hFont = CreateFontIndirect(lf)
        hOldFont1 = SelectObject(hDC, hFont)
        ret = GetTextMetrics(hDC, tm)
        ret = GetClientRect(GetParent(hwnd), rects)

!            // base the height of the window on size of text
        lHeight = tm%tmHeight+6*GetSystemMetrics(SM_CYBORDER)+2
!            // saved the height for later reference
        ret = SetWindowLong(hwnd, GWL_USERDATA, lHeight)
        ret = SetWindowPos(hwnd, NULL,                            &
               0,                                                 &
               rects%bottom-lHeight,                              &
               rects%right-rects%left,                            &
               lHeight,                                           &
               IOR(SWP_NOZORDER, SWP_NOMOVE))                     

        ret = ReleaseDC(hwnd, hDC)

    
    case (WM_DESTROY)
        if (hFont .NE. 0) then
            ret = DeleteObject(hFont)
        end if

    case (WM_SETTEXT)
        ret = DefWindowProc(hwnd, message, wParam, lParam)
        ret = InvalidateRect(hwnd, NULL_RECT, .FALSE.)
        ret = UpdateWindow(hwnd)
        TextWndProc = 0
        return

    case (WM_PAINT)

        ret = BeginPaint(hwnd, ps)

        ret = GetClientRect(hwnd, rc)

        nxBorder = GetSystemMetrics(SM_CXBORDER)
        rc%left  = rc%left + 9*nxBorder
        rc%right = rc%right - 9*nxBorder

        nyBorder = GetSystemMetrics(SM_CYBORDER)
        rc%top    = rc%top + 3*nyBorder
        rc%bottom = rc%bottom - 3*nyBorder

  !            // 3D Text
        len = GetWindowText(hwnd, ach, SIZEOFACH)
        ret = SetBkColor(ps%hdc, GetSysColor(COLOR_BTNFACE))

        ret = SetBkMode(ps%hdc, TRANSPARENT)
        ret = SetTextColor(ps%hdc, Rgb(INT1(64),INT1(96),INT1(96)))
        if (hFont .NE. 0) then
            hOldFont = SelectObject(ps%hdc, hFont)
        end if
        ret = ExtTextOut(ps%hdc, rc%left+2*nxBorder+2, rc%top+2,  &
                            IOR(ETO_OPAQUE , ETO_CLIPPED),        &
                            rc, ach, len, NULL)

        ret = SetTextColor(ps%hdc, Rgb(INT1(128),INT1(128),INT1(128)))
        if (hFont .NE. 0) then
            hOldFont = SelectObject(ps%hdc, hFont)
        end if

        ret = ExtTextOut(ps%hdc, rc%left+2*nxBorder+1, rc%top+1,  &
         ETO_CLIPPED, rc, ach, len, NULL)

        ret = SetTextColor(ps%hdc, Rgb(INT1(255),INT1(255),INT1(255)))
        if (hFont .NE. 0) then
            hOldFont = SelectObject(ps%hdc, hFont)
        end if

        ret = ExtTextOut(ps%hdc, rc%left+2*nxBorder, rc%top,      &
                        ETO_CLIPPED, rc, ach, len, NULL)

        ret = SetBkMode(ps%hdc, OPAQUE)

        if (hOldFont .NE. 0) then
            ret = SelectObject(ps%hdc, hOldFont)
        end if

        ret = EndPaint(hwnd, ps)
        TextWndProc = 0
        return
end select
TextWndProc = DefWindowProc(hwnd, message, wParam, lParam)
return
end


