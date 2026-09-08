recursive subroutine MoveBox(ipx, ipy, ipdx, ipdy, ipvx, ipvy, iax, iay, pThreadBlockInfo)

!MS$ATTRIBUTES REFERENCE :: ipx
!MS$ATTRIBUTES REFERENCE :: ipy
!MS$ATTRIBUTES REFERENCE :: ipdx
!MS$ATTRIBUTES REFERENCE :: ipdy
!MS$ATTRIBUTES REFERENCE :: ipvx
!MS$ATTRIBUTES REFERENCE :: ipvy
!MS$ATTRIBUTES VALUE     :: iax
!MS$ATTRIBUTES VALUE     :: iay 
!MS$ATTRIBUTES REFERENCE :: pThreadBlockInfo
use thrdinc
integer*4   ipx, ipy, ipdx, ipdy, ipvx, ipvy, iax, iay, pThreadBlockInfo
type (THREADBLOCKINFO)     tbi
logical(4)  bret
integer*4  px, py, pdx, pdy, pvy, pvx, ax, ay

call CopyMemory (LOC(px) , ipx,  4)
call CopyMemory (LOC(py) , ipy,  4)
call CopyMemory (LOC(pdx), ipdx, 4)
call CopyMemory (LOC(pdy), ipdy, 4)
call CopyMemory (LOC(pvx), ipvx, 4)
call CopyMemory (LOC(pvy), ipvy, 4)
call CopyMemory (LOC(ax) , iax,  4)
call CopyMemory (LOC(ay) , iay,  4)

call CopyMemory (LOC(tbi),pThreadBlockInfo,SIZEOFTHREADBLOCKINFO)
bret = GetClientRect(tbi%hwndThreadWindow, tbi%rcClient)
pdx = pdx -1
if (pdx == 0) then
    px = px - ax
    pdx = pvx
else if (pdx == 3) then
    px = px + ax
    pdx = pvx
end if

pdy = pdy -1
if (pdy == 0) then
    py = py - ay
    pdy = pvy
else if (pdy == 3) then
    py = py + ay
    pdy = pvy
end if

if (px < tbi%rcClient%left) then

    px = tbi%rcClient%left

    if (pvx >= 4) then
        pvx = pvx - 3
    else
        pvx = pvx + 3
    end if

    pdx = pvx
end if

if (px > (tbi%rcClient%right - 20)) then
    px = tbi%rcClient%right - 20

    if (pvx >= 4) then
        pvx = pvx - 3
    else
        pvx = pvx + 3
    end if

    pdx = pvx
end if

if (py < tbi%rcClient%top) then
    py = tbi%rcClient%top

    if (pvy >= 4) then
        pvy = pvy - 3
    else
        pvy = pvy + 3
    end if

    pdy = pvy
end if

if (py > (tbi%rcClient%bottom - 20)) then
    py = tbi%rcClient%bottom - 20

    if (pvy >= 4) then
        pvy = pvy - 3
    else
        pvy = pvy + 3
    end if

    pdy = pvy
end if

call CopyMemory (ipx, LOC(px),4)
call CopyMemory (ipy,  LOC(py) , 4)
call CopyMemory (ipdx, LOC(pdx), 4)
call CopyMemory (ipdy, LOC(pdy), 4)
call CopyMemory (ipvx, LOC(pvx), 4)
call CopyMemory (ipvy, LOC(pvy), 4)
call CopyMemory (iax,  LOC(ax), 4)
call CopyMemory (iay,  LOC(ay) , 4)

call CopyMemory (pThreadBlockInfo,LOC(tbi),SIZEOFTHREADBLOCKINFO)
end

recursive integer function StartBounce (winparam)
!MS$ATTRIBUTES REFERENCE :: winparam
use thrdinc

interface 
recursive integer function StartDemo(cmd, pThreadBlockInfo)
!MS$ATTRIBUTES VALUE :: cmd
integer(4)  cmd
integer(4)  pThreadBlockInfo
end function StartDemo
end interface

interface
recursive subroutine BounceProc(pThreadBlockInfo)
!MS$ATTRIBUTES VALUE :: pThreadBlockInfo
integer*4 pThreadBlockInfo
end subroutine BounceProc
end interface


integer*4               winparam
integer*4               pThreadBlockInfo
type (THREADBLOCKINFO)  tbi

if (StartDemo(MM_BOUNCE, winparam) == 0) then
    StartBounce = 0
    return
end if

cmdDemo = MM_BOUNCE
    !/* Here everythings been initialized, ThreadBlockINfo, etc*/
    !/* Now loop and call BounceProc to draw and move boxes*/

    !/* NOTE NOTE, each thread MUST have its own message loop!*/

pThreadBlockInfo = winparam

call CopyMemory (LOC(tbi),pThreadBlockInfo,SIZEOFTHREADBLOCKINFO)

do while (.TRUE.) 
                        
    if (bKillMe .eqv. .FALSE.) then
        if (.not.(tbi%bKillThrd)) then
            call BounceProc(pThreadBlockInfo)
            call CopyMemory (LOC(tbi),pThreadBlockInfo,SIZEOFTHREADBLOCKINFO)
        endif
    else
        call ExitThread(0)        
    endif
end do

call ExitThread(0)
end

