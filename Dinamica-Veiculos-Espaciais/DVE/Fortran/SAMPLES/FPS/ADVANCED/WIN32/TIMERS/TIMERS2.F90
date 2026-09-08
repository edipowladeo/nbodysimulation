!******************************************************************************\
!*
!*  FUNCTION:    TimerFunc
!*
!*  INPUTS:      hwnd     - window associated with timer
!*               uMsg     - WM_TIMER message
!*               idEvent  - timer's ID
!*               dwTime   - current system time
!*
!*  RETURNS:     0
!*
!*  GLOBAL VARS: gaFlashRects - array of flashing rectangles coordinates
!*
!*  LOCAL VARS:  hdc - device context of main window
!*
!*  COMMENTS:    Inverts the gaFlashRect corresponding to idEvent
!*
!******************************************************************************/

subroutine TimerFunc (hwnd, uMsg, idEvent, dwTime)
!MS$ATTRIBUTES STDCALL, ALIAS : '_TimerFunc@16' :: TimerFunc
use timerinc
integer*4 hwnd, uMsg, idEvent, dwTime
integer*4 hdc 

uMsg    = uMsg
dwTime  = dwTime

hdc = GetDC (hwnd)

i = InvertRect (hdc, gaFlashRects(idEvent))
i = ReleaseDC  (hwnd, hdc)
end 



!******************************************************************************\
!*
!*  FUNCTION:    SetButtonPositions
!*
!*  INPUTS:      cx - new width of main window
!*               cy - new height of main window
!*
!*  GLOBAL VARS: gahwndButtons - array of button HWNDs (unmodified)
!*
!*  COMMENTS:    Repositions buttons according to new window size (cx,cy)
!*
!******************************************************************************/

subroutine SetButtonPositions (cx, cy)
!MS$ ATTRIBUTES VALUE :: cx
!MS$ ATTRIBUTES VALUE :: cy
use timerinc
integer*4 cx, cy

! upper-left button
i = SetWindowPos (gahwndButtons(ID_TIMER1), NULL,                 &
           BUTTONBORDER,                                          &
           cy/2 - BUTTONBORDER - BUTTONHEIGHT,                    &
           cx/2 - 2*BUTTONBORDER,                                 &
           BUTTONHEIGHT,                                          &
           SWP_SHOWWINDOW)
! upper-right button
i = SetWindowPos (gahwndButtons(ID_TIMER2), NULL,                 &
           cx/2 + BUTTONBORDER,                                   &
           cy/2 - BUTTONBORDER - BUTTONHEIGHT,                    &
           cx/2 - 2*BUTTONBORDER,                                 &
           BUTTONHEIGHT,                                          &
           SWP_SHOWWINDOW)
! lower-left button
i = SetWindowPos (gahwndButtons(ID_TIMER3), NULL,                 &
           BUTTONBORDER,                                          &
           cy - BUTTONBORDER - BUTTONHEIGHT,                      &
           cx/2 - 2*BUTTONBORDER,                                 &
           BUTTONHEIGHT,                                          &
           SWP_SHOWWINDOW)
! lower-right button
i = SetWindowPos (gahwndButtons(ID_TIMER4), NULL,                 &
           cx/2 + BUTTONBORDER,                                   &
           cy - BUTTONBORDER - BUTTONHEIGHT,                      &
           cx/2 - 2*BUTTONBORDER,                                 &
           BUTTONHEIGHT,                                          &
           SWP_SHOWWINDOW)
end 

