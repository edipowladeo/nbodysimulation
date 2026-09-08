
subroutine DrawBox(x, y, hbr, pThreadBlockInfo)
!MS$ATTRIBUTES VALUE :: x
!MS$ATTRIBUTES VALUE :: y
!MS$ATTRIBUTES VALUE :: hbr
!MS$ATTRIBUTES VALUE :: pThreadBlockInfo

use thrdinc
integer*4   x, y, hbr, pThreadBlockInfo
type (THREADBLOCKINFO)    tbi

integer*4   hbrOld

call CopyMemory (LOC(tbi),pThreadBlockInfo,SIZEOFTHREADBLOCKINFO)

tbi%hdcThreadWindow = GetDC(tbi%hwndThreadWindow)

if (tbi%hdcThreadWindow .NE. 0)  then
   hbrOld = SelectObject(tbi%hdcThreadWindow, hbr)
   ret = BitBlt(tbi%hdcThreadWindow, x, y, 20, 20, NULL, 0, 0,PATCOPY)
   ret = SelectObject(tbi%hdcThreadWindow, hbrOld)
   ret = ReleaseDC(tbi%hwndThreadWindow, tbi%hdcThreadWindow)
else
    !ret = MessageBox(ghwndMain,"Failed in GetDC!"C,"Error"C, MB_OK)
end if

call CopyMemory (pThreadBlockInfo,LOC(tbi),SIZEOFTHREADBLOCKINFO)

end
