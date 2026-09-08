!*****************************************************************************
!*                                                                            *
!*  FUNCTION: WndProc(HWND, unsigned, WORD, LONG)                             *
!*                                                                            *
!*  PURPOSE:  Processes window messages and sets up a 256 bar representation  *
!*            of the current physical palette. Specifically, in response to:  *
!*                                                                            *
!*               WM_CREATE  -Allocates for and sets up a LOGPALETTE           *
!*                           structure, creates a logical palette the same    *
!*                           size as the physical palette and obtains a       *
!*                           handle to the logical palette.                   *
!*                                                                            *
!*               WM_DESTROY -Destroys the logical palette and shuts down app. *
!*                                                                            *
!*               WM_PAINT   -Resizes client area to hold as many vertical     *
!*                           color bars as there are physical palette entries.*
!*                           Also realises the current logical palette and    *
!*                           draws one color bar corresponding to each        *
!*                           palette entry                                    *
!*                                                                            *
!*           WM_RBUTTONDOWN -Captures the mouse and initiates the below       *
!*                           process:                                         *
!*                                                                            *
!*           WM_MOUSEMOVE   -Following a WM_RBUTTONDOWN, if the right mouse   *
!*                           key is depressed, displays info about the        *
!*                           pixel RGB value and palette index of the mouse   *
!*                           coordinates.                                     *
!*                                                                            *
!*           WM_RBUTTONUP   -Release mouse capture and terminates the above   *
!*                           process                                          *
!*                                                                            *
!*           WM_LBUTTONDOWN -Determines and displays the palette index and    *
!*                           RGB value of the bar under the mouse.            *
!*                                                                            *
!*           WM_KEYDOWN     -Allows use of the arrow keys in stepping thro'   *
!*                           palette entries.                                 *
!*                                                                            *
!*******************************************************************************
integer*4 function WndProc (hWnd,iMessage,wParam,lParam)
!MS$ATTRIBUTES STDCALL, ALIAS : '_WndProc@16' :: WndProc
use msfwina
use mypalinc
integer*4 hWnd, iMessage, wParam, lParam


interface
subroutine ShowColor (hWnd, hDC,Index)
!MS$ATTRIBUTES STDCALL, ALIAS : '_ShowColor@12' :: ShowColor
integer*4 hWnd,hDC,Index
end subroutine ShowColor
end interface

integer*4               hDC
type (T_PAINTSTRUCT)    ps
integer*2               iLoop
integer*4               nStart
integer*4               hBrush
integer*4               hOldBrush
type (T_POINT)          pt1
type (RGPT)             rgptstruct
type (T_POINTS)         pt
integer*4               nIncr
integer*4               dwColor
integer*4               dwLastColor
integer*4               i, x
integer*2               i21, i22 
BYTE                    Red,Green,Blue
integer*4               LRed,LGreen,LBlue

save nIncr, dwColor, dwLastColor, i, x

select case (iMessage) 
   case (WM_DESTROY)
        call PostQuitMessage (0) 

   case (WM_CREATE)
        ! Allocate enough memory for a logical palette with
        ! PALETTESIZE entries and set the size and version fields
        ! of the logical palette structure.
        !
        pLogPal(1) = MakeLong(INT2(#300), PALETTESIZE)
        ! fill in intensities for all palette entry colors */
        do iLoop = 2, PALETTESIZE+1 
            i21 = INT2(iLoop-2)
            i22 = MakeWord(INT1(0),INT1(PC_EXPLICIT))
            pLogPal(iLoop) = MakeLong(i21, i22)
        end do

        !  create a logical color palette according the information
        !  in the LOGPALETTE structure.
        !
        hPal = CreatePalette (pLogPal(1))


   case (WM_GETMINMAXINFO)
        call CopyMemory (LOC(rgptstruct), lParam, 40)

        rgptstruct%iInfo(6) = nXBorder * 2 + PALETTESIZE
        rgptstruct%iInfo(7) = nXBorder * 2 + nYTitle*3

        WndProc = DefWindowProc (hWnd, iMessage, wParam, lParam) 
        return
        

   case (WM_PAINT)

        ! Divide client width into equal-sized parts, one per palette
        ! entry, and re-calculate client width so that it will display
        ! exactly as many vertical bars as there are palette entries.
        !
         i = GetClientRect(hWnd,rClientRect)
         nSizeX = (rClientRect%right - rClientRect%left)
         nSizeX = (nSizeX/iNumColors) * iNumColors

         nSizeY = rClientRect%bottom - rClientRect%top
         i = GetWindowRect(hWnd,rClientRect)

        ! Adjust window width so that it can display exactly
        ! as many vertical bars( of equal width) as there are palette
        ! colors.
        !

        i = SetWindowPos( hWnd,                                   &
                       NULL,                                      &
                       0,                                         &
                       0,                                         &
                       nSizeX + 2*nXBorder,                       &
                       rClientRect%bottom - rClientRect%top,      &
                 IOR(SWP_NOMOVE,IOR(SWP_NOZORDER,SWP_NOACTIVATE)))

        hDC = BeginPaint(hWnd, ps)

        ! Select the palette into the window device context and
        ! make the Palette Manager map the logical palette to the
        ! system palette (realize it).
        !
        i = SelectPalette (hDC, hPal, .TRUE.)
        i = RealizePalette (hDC)

        ! Calculate width of each color bar to be displayed */
        nIncr = nSizeX / iNumColors
        nStart = 0
        ! Paint the individual bars separately on the app. window */
        do iLoop = 1,  iNumColors

            ! Since this app. uses a logical palette, use the
            ! PALETTEINDEX macro to specify the palette entry
            ! index instead of using an explicit RGB value.
            !
            hBrush       = CreateSolidBrush (INT4(PALETTEINDEX (iLoop-1)))
            dwPal(iLoop) = GetNearestColor (hDC, INT4(PALETTEINDEX(iLoop-1) ))
            hOldBrush    = SelectObject (hDC,hBrush) 
            i = PatBlt (hDC, nStart, 0, nIncr, nSizeY, PATCOPY)
            nStart       = nStart       + nIncr
            i = SelectObject (hDC, hOldBrush)
            i = DeleteObject (hBrush) 
        end do
        write (szTitlebuf, 1000) iNumColors
1000  FORMAT ('MyPal Colors=', I3)
        i = SetWindowText (hWnd, szTitlebuf)

        i = EndPaint(hWnd,ps)
        

   case (WM_MOUSEMOVE)

        if (IAND(wParam,MK_RBUTTON) .NE. 0) then
            pt1%x = INT4(LOWORD(lparam))
            pt1%y = INT4(HIWORD(lparam))

            i = ClientToScreen(hWnd, pt1)

            ! Get RGB value (color) of pixel under mouse coordinate */
            dwColor = GetPixel(hDCGlobal, pt1%x, pt1%y)

            ! If color value already exists in palette lookup table,
            ! obtain it's index.
            !
            do i=1, iNumColors  
                if ( dwColor == dwPal(i) ) then
                    exit
                end if
            end do
            iIndex = i

            ! If previous color value was not identical to current one,
            ! display color boxes on either side of title bar,
            ! the R, G, B values and palette index of current color.
            !
            if (dwColor .NE. dwLastColor) then
                write ( szTitlebuf, 2000)                         &
                            iNumColors,                           &
                            iIndex,                               &
                            GetRedValue (dwColor),                &
                            GetGreenValue (dwColor),              &
                            GetBlueValue (dwColor)
2000  FORMAT ('MyPal Colors=',I5,'Index=',I5,'R=',I3,'G=',I3,'B='I3)
                i = SetWindowText (hWnd, szTitlebuf)
                call ShowColor (hWnd, hDCGlobal,iIndex)
                dwLastColor = dwColor
            end if
        end if

   case (WM_RBUTTONDOWN)

        ! Determine number of color bar under mouse, thus the index
        ! of color in palette.
        !
        x = LOWORD(lParam)
        iIndex = (x / nIncr )
        write ( szTitlebuf, 3000) iNumColors,iIndex,iNumColors,iRasterCaps 
3000  FORMAT ('MyPal Colors=',I5,'Index=',I5,'PALSIZE=',I5,'RASTERCAPS=',I5)


        i = SetWindowText (hWnd, szTitlebuf)

        ! Set mouse capture so that subsequent WM_MOUSEMOVEs
        ! (with right mouse button depressed) will allow MyPal
        ! to display RGB info anywhere on the screen without losing
        ! the focus.
        !
        i = SetCapture (hWnd)
        bCaptureOn = .TRUE.
        hDCGlobal = GetDC(NULL)
        if (hPal .NE. 0) then
            i = SelectPalette (hDCGlobal, hPal, .FALSE.)
            i = RealizePalette (hDCGlobal)
        end if

   case (WM_RBUTTONUP)
        ! Stops displaying RGB and palette info and releases mouse
        ! capture
        !
        i = ReleaseDC (NULL, hDCGlobal)
        bCaptureOn = .FALSE.
        i = ReleaseCapture ()

   case (WM_MOVE)
        ! If you have a wide column, this adds 1/2 so X is centered */
        iGlobalXOffset  = LOWORD (lParam)
        iGlobalYOffset  = HIWORD (lParam) + nXBorder

   case (WM_SIZE)
        iYMiddle = (HIWORD (lParam)/2)

   case (WM_LBUTTONDOWN, WM_KEYDOWN)

       if (iMessage == WM_LBUTTONDOWN) then 
           ! determine which column was hit by the mouse 
           x = LOWORD(lParam)
           iIndex = (x / nIncr )
       else
           ! Use arrow keys to step thro' the palette entries */
           select case (wParam) 
               case (VK_RIGHT, VK_UP)
                            ! go to next (higher) palette entry */
                            iIndex = iIndex + 1
               case (VK_LEFT, VK_DOWN)
                            ! go to previous (lower) palette entry */
                            iIndex = iIndex - 1
               case (VK_NEXT)
                            iIndex = iIndex + 10
               case (VK_PRIOR)
                            iIndex = iIndex - 10
               case (VK_HOME)
                            ! go to first palette entry */
                            iIndex = 0
               case (VK_END)
                            ! go to last palette entry */
                            iIndex = iNumColors-1
               case default
                            WndProc = 0
                            return 
           end select
           ! Make sure the palette index is within range else
           ! set it to the limiting values and give a warning beep.
           !
           if (iIndex < 0) then
               iIndex = 0
               i = MessageBeep(1)
           else
               if (iIndex > iNumColors) then
                   iIndex = iNumColors-1
                   i = MessageBeep(1)
               end if
           end if
           
           if (nIncr > 1) then
              pt%x = INT2((iIndex * nIncr) +                      &
                      iGlobalXOffset   +                          &
                      (nIncr / 2))
           else
              pt%x = INT2((iIndex * nIncr) + iGlobalXOffset + 1)
           end if
           pt%y = INT2(iYMiddle + iGlobalYOffset)

           i = SetCursorPos (pt%x, pt%y)
       end if

       if (.TRUE. .eqv. bCaptureOn) then
           i = MessageBeep(1)
       end if

       ! Select & realize the palette or the colors > 0x7
       ! will not match up.
       !
       hDC = GetDC(NULL)
       i = SelectPalette  (hDC, hPal, .TRUE.)
       i = RealizePalette (hDC) 

       dwColor = GetNearestColor (hDC, INT4(PALETTEINDEX (iIndex)))

       Red   = GetRedValue (dwColor)
       Green = GetGreenValue (dwColor) 
       Blue  = GetBlueValue (dwColor)

       LRed = MAKELONG(MAKEWORD(Red,0),0)
       LBlue = MAKELONG(MAKEWORD(Blue,0),0)
       LGreen = MAKELONG(MAKEWORD(Green,0),0)

       write ( szTitlebuf, 5000) iNumColors,iIndex,LRed,LGreen,LBlue 

5000  FORMAT ('MyPal Colors=',I5,'Index=',I5,'R=',I5,'G=',I5,'B='I5)

       i = SetWindowText (hWnd, szTitlebuf)
       
       call ShowColor (hWnd,hDC,iIndex)
       i = ReleaseDC(NULL, hDC)

   case default
        WndProc = DefWindowProc (hWnd, iMessage, wParam, lParam) 
        return

end select 
WndProc = 0
return

end
