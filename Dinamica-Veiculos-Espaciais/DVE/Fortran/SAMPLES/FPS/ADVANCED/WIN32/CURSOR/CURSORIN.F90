module cursorin
use msfwina

integer , parameter, public :: IDM_ABOUT= 100 


integer, parameter, public :: NITER = 20
integer, parameter, public :: SIZEL = 8190

!Globals 

integer flags(SIZEL)

integer         hInst
character*255   str                   !/* general-purpose string buffer */
integer         hSaveCursor           !/* handle to current cursor      */
integer         hHourGlass            !/* handle to hourglass cursor    */
integer         bTrack                !/* TRUE if left button clicked   */
integer         OrgX , OrgY           !/* original cursor position      */
integer         PrevX , PrevY         !/* current cursor position       */
integer         X , Y                 !/* last cursor position          */
type(T_RECT)    Rect1                 !/* selection rectangle           */

type(T_POINTS)   ptCursor             !/* x and y coordinates of cursor */
integer repeat                        !/* repeat count of keystroke     */

end module
