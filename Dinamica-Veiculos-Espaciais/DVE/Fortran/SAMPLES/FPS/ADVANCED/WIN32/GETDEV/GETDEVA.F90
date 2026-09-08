!/**************************************************************************\
!*
!*  subroutine:  ExpandInfo()
!*
!*  input parameters:
!*   hwnd  - parent of the list box with the info.
!*   index - the input value which was sent to GetDeviceCaps().
!*   value - the return value from calling GetDeviceCaps().
!*
!*  global variables:
!*   buffer - string to hold info sent to list box.
!*   space  - format string to wsprintf
!*
!*  Some of the return values from GetDeviceCaps() are bit strings
!*   where each bit has a constant defined for it in wingdi.h.  This
!*   function simply translates the bits into the string constant and
!*   then places that in the listbox.
!*
!\**************************************************************************/
subroutine ExpandInfo ( hwnd, index, val)
!MS$ATTRIBUTES VALUE :: hwnd
!MS$ATTRIBUTES VALUE :: index
!MS$ATTRIBUTES VALUE :: val
use msfwin
use getdvinc
integer     hwnd, index, val

select case (index)

    case (TECHNOLOGY)
        do i = 1 , NDevice
            if (val == Device(i)%val) then
                write(buffer,100) Device(i)%String
100                   format ('    ', A)
                ret = SendDlgItemMessage (hwnd, DID_LISTBOX,      &
                                LB_ADDSTRING, 0,LOC(buffer))
            end if
        end do
    
    case (CURVECAPS)
        do i = 1 , NCurveCaps  
            if (IAND(val ,CurveCap(i)%val) .NE. 0) then
                write(buffer,100) CurveCap(i)%String
                ret = SendDlgItemMessage (hwnd, DID_LISTBOX,      &
                            LB_ADDSTRING, 0, LOC(buffer))
            end if
        end do

    case (LINECAPS)
        do i = 1 , NLineCaps 
            if (IAND(val , LineCap(i)%val).NE. 0) then
                write(buffer,100) LineCap(i)%String
                ret = SendDlgItemMessage (hwnd, DID_LISTBOX,      &
                        LB_ADDSTRING, 0, LOC(buffer))
            end if
        end do

    case (POLYGONALCAPS)
        do i = 1 , NPolygonalCaps 
            if (IAND(val , PolygonalCap(i)%val) .NE. 0) then
                write(buffer,100) PolygonalCap(i)%String
                ret = SendDlgItemMessage (hwnd, DID_LISTBOX,      &
                                LB_ADDSTRING, 0, LOC(buffer))
        end if
        end do


    case (TEXTCAPS)
        do i = 1 , NTextCaps 
            if (IAND(val , TextCap(i)%val) .NE. 0) then
                write(buffer,100) TextCap(i)%String
                ret = SendDlgItemMessage (hwnd, DID_LISTBOX,      &
                            LB_ADDSTRING, 0, LOC(buffer))
            end if
        end do

    case (CLIPCAPS)
        do i = 1 , NClipCaps 
            if (IAND(val , ClipCap(i)%val) .NE. 0) then
                write(buffer,100) ClipCap(i)%String
                ret = SendDlgItemMessage (hwnd, DID_LISTBOX,      &
                            LB_ADDSTRING, 0 , LOC(buffer))
            end if
        end do

    case (RASTERCAPS)
        do i = 1 , NRasterCaps 
            if (IAND(val , RasterCap(i)%val) .NE. 0) then
                write(buffer,100) RasterCap(i)%String
                ret = SendDlgItemMessage (hwnd, DID_LISTBOX,      &
                               LB_ADDSTRING, 0 , LOC(buffer))
            end if
        end do


end select !/* end switch */

end 
