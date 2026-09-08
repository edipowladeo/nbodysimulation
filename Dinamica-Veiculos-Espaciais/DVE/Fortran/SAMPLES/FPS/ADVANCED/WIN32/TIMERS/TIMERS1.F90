!******************************************************************************\
!*
!*  FUNCTION:    SetgaFlashRectPositions
!*
!*  INPUTS:      cx - new width of main window
!*               cy - new height of main window
!*
!*  GLOBAL VARS: gaFlashRects - array of flashing rectangles coordinates
!*                            (modified)
!*
!*  COMMENTS:    Repositions flashing rectangles according to new window
!*               size (cx,cy)
!*
!******************************************************************************/

subroutine SetFlashRectPositions (cx, cy)
!MS$ ATTRIBUTES VALUE :: cx
!MS$ ATTRIBUTES VALUE :: cy
use timerinc
integer*4 cx, cy

                                            ! upper-left rect  
gaFlashRects(ID_TIMER1)%left   = BUTTONBORDER
gaFlashRects(ID_TIMER1)%top    = 3*TEXTHEIGHT + BUTTONBORDER
gaFlashRects(ID_TIMER1)%right  = cx/2 - BUTTONBORDER
gaFlashRects(ID_TIMER1)%bottom = cy/2 - BUTTONHEIGHT -  2*BUTTONBORDER

                                            ! upper-right rect 
gaFlashRects(ID_TIMER2)%left   = cx/2 + BUTTONBORDER
gaFlashRects(ID_TIMER2)%top    = 3*TEXTHEIGHT + BUTTONBORDER
gaFlashRects(ID_TIMER2)%right  = cx - BUTTONBORDER
gaFlashRects(ID_TIMER2)%bottom = cy/2 - BUTTONHEIGHT -  2*BUTTONBORDER

                                            ! lower-left rect  
gaFlashRects(ID_TIMER3)%left   = BUTTONBORDER
gaFlashRects(ID_TIMER3)%top    = cy/2 + 3*TEXTHEIGHT +BUTTONBORDER
gaFlashRects(ID_TIMER3)%right  = cx/2 - BUTTONBORDER
gaFlashRects(ID_TIMER3)%bottom = cy - BUTTONHEIGHT -2*BUTTONBORDER

                                            ! lower-right rect 
gaFlashRects(ID_TIMER4)%left   = cx/2 + BUTTONBORDER
gaFlashRects(ID_TIMER4)%top    = cy/2 + 3*TEXTHEIGHT +BUTTONBORDER
gaFlashRects(ID_TIMER4)%right  = cx - BUTTONBORDER
gaFlashRects(ID_TIMER4)%bottom = cy - BUTTONHEIGHT -2*BUTTONBORDER
end 



!******************************************************************************\
!*
!*  FUNCTION:    DrawStuff
!*
!*  INPUTS:      hwnd - main window handle
!*               hdc  - DC for main window
!*
!*  GLOBAL VARS: gaFlashRects - array of flashing rectangles coordinates
!*                            (not modified)
!*
!*  LOCAL VARS:  rect - client rectangle
!*               hbr  - temporary brush handle
!*
!*  COMMENTS:    Draws separators, "Timer #" headers, & rectangles
!*
!******************************************************************************/

subroutine DrawStuff (hwnd, hdc)
!MS$ ATTRIBUTES VALUE :: hwnd
!MS$ ATTRIBUTES VALUE :: hdc
use timerinc
integer*4       hwnd, hdc
type (T_RECT)   rect1
integer*4       hbr

  !
  ! Draw the separator lines between the timer info "windows"
  !

    i = GetClientRect (hwnd, rect1)
    i = MoveToEx (hdc, rect1%right/2, 0, NULL_POINT)
    i = LineTo (hdc, rect1%right/2, rect1%bottom)

    i = MoveToEx (hdc, 0, rect1%bottom/2, NULL_POINT)
    i = LineTo (hdc, rect1%right, rect1%bottom/2)

  !
  ! Draw the "Timer #" headers
  !
    i = TextOut (hdc, BUTTONBORDER, TEXTHEIGHT, "Timer 1:"C, 8)
    i = TextOut (hdc, rect1%right/2 + BUTTONBORDER, TEXTHEIGHT,       &
                "Timer 2:"C, 8)
    i = TextOut (hdc, BUTTONBORDER, rect1%bottom/2 + TEXTHEIGHT,      &
                "Timer 3:"C, 8)
    i = TextOut (hdc, rect1%right/2 + BUTTONBORDER, rect1%bottom/2 +  &
                TEXTHEIGHT,"Timer 4:"C, 8)

  !
  ! Draw the rectangles to flash on timer messages
  !

    hbr = CreateSolidBrush (#0000ff)
    i = FillRect (hdc, gaFlashRects(ID_TIMER1), hbr)
    i = DeleteObject (hbr)
    hbr = CreateSolidBrush (#00ff00)
    i = FillRect (hdc, gaFlashRects(ID_TIMER2), hbr)
    i = DeleteObject (hbr)
    hbr = CreateSolidBrush (#ff0000)
    i = FillRect (hdc, gaFlashRects(ID_TIMER3), hbr)
    i = DeleteObject (hbr)
    hbr = CreateSolidBrush (#2266aa)
    i = FillRect (hdc, gaFlashRects(ID_TIMER4), hbr)
    i = DeleteObject (hbr)
end 
