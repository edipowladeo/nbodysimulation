!/****************************************************************************
!
!    FUNCTION: MainWndProc(HWND, unsigned, WORD, LONG)
!
!    PURPOSE:  Processes messages
!
!    MESSAGES:
!
!        WM_COMMAND    - application menu (About dialog box)
!        WM_CREATE     - create window and objects
!        WM_PAINT      - update window, draw objects
!        WM_DESTROY    - destroy window
!
!    COMMENTS:
!
!        Handles to the objects you will use are obtained when the WM_CREATE
!        message is received, and deleted when the WM_DESTROY message is
!        received.  The actual drawing is done whenever a WM_PAINT message is
!        received.
!
!****************************************************************************/

integer*4 function MainWndProc(hWnd, message, wParam, lParam)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MainWndProc@16' :: MainWndProc
use msfwina
use outinc
integer*4   hWnd, message, wParam, lParam

interface 
integer(4) function  About (hDlg,messsage,wParam,lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_About@16' :: About
integer     hDlg
integer     messsage
integer     wParam
integer     lParam
end function About
end interface

integer                 hDC          !/* display-context variable  */
type (T_PAINTSTRUCT)      ps
type (T_RECT)             rcTextBox
integer                 hOldPen      !/* old pen handle            */
type (T_TEXTMETRIC)      txtmetric
integer                 nDrawX
integer                 nDrawY
integer*4               ret
logical(4)              bret
character*300           szText


select case (message) 
    case (WM_COMMAND)
        if (LoWord(wParam) == INT2(IDM_ABOUT)) then
            ret = DialogBox(hInst, LOC("AboutBox"C), hWnd, LOC(About))
        else
            MainWndProc = DefWindowProc(hWnd, message, wParam, lParam)
            return
        end if

    case (WM_CREATE)

      !/* Create the brush objects */

        hRedBrush =   CreateSolidBrush(Rgb(INT1(255),   INT1(0),   INT1(0)))
        hGreenBrush = CreateSolidBrush(Rgb(  INT1(0), INT1(255),  INT1(0)))
        hBlueBrush =  CreateSolidBrush(Rgb(  INT1(0),   INT1(0), INT1(255)))

      !/* Create the "---" pen */

        hDashPen = CreatePen(PS_DASH,    &  !/* style */           
           1,                            &  !/* width */          
           Rgb(INT1(0), INT1(0), INT1(0)))                   !/* color */

      !/* Create the "..." pen */

        hDotPen = CreatePen(2,      &        !/* style */            
           1,                       &        !/* width */              
           Rgb(INT1(0), INT1(0), INT1(0)))                     !/* color */

    case (WM_PAINT)
      !/* Set up a display context to begin painting */

        hDC = BeginPaint (hWnd, ps)

      !/* Get the size characteristics of the current font.  */
      !/* This information will be used for determining the  */
      !/* vertical spacing of text on the screen.            */

        bret = GetTextMetrics (hDC, txtmetric)

      !/* Initialize drawing position to 1/4 inch from the top  */
      !/* and from the left of the top, left corner of the      */
      !/* client area of the main windows.                      */

        nDrawX = GetDeviceCaps(hDC, LOGPIXELSX) / 4   !/* 1/4 inch */
        nDrawY = GetDeviceCaps(hDC, LOGPIXELSY) / 4   !/* 1/4 inch */

      !/* Send characters to the screen.  After displaying each   */
      !/* line of text, advance the vertical position for the     */
      !/* next line of text.  The pixel distance between the top  */ 
      !/* of each line of text is equal to the standard height of */
      !/* the font characters (tmHeight), plus the standard       */
      !/* amount of spacing (tmExternalLeading) between adjacent  */
      !/* lines.                                                  */

        bret = TextOut (hDC, nDrawX, nDrawY, "These characters are being painted using ",          &
                                    len ("These characters are being painted using "))

        nDrawY = nDrawY + txtmetric%tmExternalLeading + txtmetric%tmHeight

        bret = TextOut (hDC, nDrawX, nDrawY, "the TextOut() function, which is fast and ",          &
                                    len ("the TextOut() function, which is fast and "))
        nDrawY = nDrawY + txtmetric%tmExternalLeading + txtmetric%tmHeight

        bret = TextOut (hDC, nDrawX, nDrawY, "allows programmer control of placement and ",          &
                                    len ("allows programmer control of placement and "))
        nDrawY = nDrawY + txtmetric%tmExternalLeading + txtmetric%tmHeight

        bret = TextOut (hDC, nDrawX, nDrawY, "formatting details.  However, TextOut() ",          &
                                    len ("formatting details.  However, TextOut() "))
        nDrawY = nDrawY + txtmetric%tmExternalLeading + txtmetric%tmHeight

        
        bret = TextOut (hDC, nDrawX, nDrawY, "does not provide any automatic formatting.",          &
                                    len ("does not provide any automatic formatting."))
        nDrawY = nDrawY + txtmetric%tmExternalLeading + txtmetric%tmHeight

      !/* Put text in a 5-inch by 1-inch rectangle and display it. */
      !/* First define the size of the rectangle around the text   */

        nDrawY = nDrawY + GetDeviceCaps(hDC, LOGPIXELSY) / 4  
        !/* 1/4 inch */
        bret = SetRect (rcTextBox , nDrawX , nDrawY           &
           , nDrawX + (5 * GetDeviceCaps(hDC, LOGPIXELSX))        &!/* 5" */
           , nDrawY + (1 * GetDeviceCaps(hDC, LOGPIXELSY))        &!/* 1" */
        )

      !/* Draw the text within the bounds of the above rectangle */

        szText = "This text is being displayed with a single " // &
                "call to DrawText().  DrawText() isn't as fast "//&
                "as TextOut(), and it is somewhat more " //       &
              "constrained, but it provides numerous optional " //&
              "formatting features, such as the centering and " //&
                "line breaking used in this example."C
 
        ret = DrawText (                                          &
                 hDC                                              &
               , szText                                           &
               , len (szText)                                     &
               , rcTextBox                                        &
               , IOR(DT_CENTER , IOR(DT_EXTERNALLEADING           &
               , IOR(DT_NOCLIP, IOR(DT_NOPREFIX, DT_WORDBREAK)))))
      
      !/*  Paint the next object immediately below the bottom of   */
      !/*  the above rectangle in which the text was drawn.        */

        nDrawY = rcTextBox%bottom

      !/* The (x,y) pixel coordinates of the objects about to be   */
      !/* drawn are below, and to the right of, the current        */
      !/* coordinate (nDrawX,nDrawY).                              */

      !/* Draw a red rectangle.. */

        hOldBrush = SelectObject(hDC, hRedBrush)
        bret = Rectangle (hDC, nDrawX, nDrawY, nDrawX+50,nDrawY+30)

      !/* Draw a green ellipse */

        ret = SelectObject(hDC, hGreenBrush)                      
        bret = Ellipse (                                           &
             hDC                                                  &
           , nDrawX + 150                                         &
           , nDrawY                                               &
           , nDrawX + 150 + 50                                    &
           , nDrawY + 30                                          &
        )

      !/* Draw a blue pie shape */

        ret = SelectObject(hDC, hBlueBrush)
        bret = Pie (                                               &
             hDC                                                  &
           , nDrawX + 300                                         &
           , nDrawY                                               &
           , nDrawX + 300 + 50                                    &
           , nDrawY + 50                                          &
           , nDrawX + 300 + 50                                    &
           , nDrawY                                               &
           , nDrawX + 300 + 50                                    &
           , nDrawY + 50                                          &
        )

        nDrawY = nDrawY + 50

      !/* Restore the old brush */

        ret = SelectObject(hDC, hOldBrush)
       !/* Select a "---" pen, save the old value */

        nDrawY = nDrawY + GetDeviceCaps(hDC, LOGPIXELSY) / 4  !/* 1/4 inch */
        hOldPen = SelectObject(hDC, hDashPen)

      !/* Move to a specified point */

        bret = MoveToEx(hDC, nDrawX, nDrawY, NULL_POINT )

      !/* Draw a line */

        bret = LineTo(hDC, nDrawX + 350, nDrawY)

      !/* Select a "..." pen */

        ret = SelectObject(hDC, hDotPen)

      !/* Draw an arc connecting the line */

        bret = Arc (                                               &
             hDC                                                  &
           , nDrawX                                               &
           , nDrawY - 20                                          &
           , nDrawX + 350                                         &
           , nDrawY + 20                                          &
           , nDrawX                                               &
           , nDrawY                                               &
           , nDrawX + 350                                         &
           , nDrawY                                               &
        )

      !/* Restore the old pen */

        ret = SelectObject(hDC, hOldPen)

      !/* Tell Windows you are done painting */

        bret = EndPaint (hWnd,  ps)

    case (WM_DESTROY)                      
        bret = DeleteObject(hRedBrush)
        bret = DeleteObject(hGreenBrush)
        bret = DeleteObject(hBlueBrush)
        bret = DeleteObject(hDashPen)
        bret = DeleteObject(hDotPen)
        call PostQuitMessage(0)

    case DEFAULT
        MainWndProc = DefWindowProc(hWnd, message, wParam, lParam)
        return
end select
MainWndProc = 0
return
end 


!/****************************************************************************
!
!    FUNCTION: About(HWND, unsigned, WORD, LONG)
!
!    PURPOSE:  Processes messages for "About" dialog box
!
!    MESSAGES:
!
!        WM_INITDIALOG - initialize dialog box
!        WM_COMMAND    - Input received
!
!****************************************************************************/

integer*4 function About( hDlg, message, wParam, lParam )
!MS$ ATTRIBUTES STDCALL, ALIAS : '_About@16' :: About
use msfwina
use outinc
integer*4   hDlg, message, wParam, lParam
logical(4)  bret

LPARAM = LPARAM
select case (message)
    case (WM_INITDIALOG)
        About = 1
        return

    case (WM_COMMAND)
        if ((LoWord(wParam) == INT2(IDOK)) .OR.                       &
                (LoWord(wParam) == INT2(IDCANCEL))) then
            bret = EndDialog(hDlg, TRUE)
            About = 1
            return
        end if
end select

About = 0
return
end 
