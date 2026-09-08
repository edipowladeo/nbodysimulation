!*************************************************************************
!StartDemo
!*************************************************************************
recursive integer function StartDemo(cmd, pThreadBlockInfo)
!MS$ATTRIBUTES VALUE :: cmd
use thrdinc

interface
subroutine InitializeBoxes (fVectorsOnly, pThreadBlockInfo)
!MS$ATTRIBUTES VALUE :: fVectorsOnly
!MS$ATTRIBUTES VALUE :: pThreadBlockInfo
integer(4)  fVectorsOnly
integer(4)  pThreadBlockInfo
end subroutine InitializeBoxes 
end interface

integer*4   cmd, pThreadBlockInfo

type (THREADBLOCKINFO)     tbi

! Initializing the rcClient for the bouncing box
! Better be initializing here for once CreateThread is called, this
! thread got the time slice parent thread is preempted.

cmd = cmd
call CopyMemory (LOC(tbi),pThreadBlockInfo,SIZEOFTHREADBLOCKINFO)

if (GetClientRect(tbi%hwndThreadWindow,                           &
                    tbi%rcClient) .EQV. .FALSE.) then
    ret = MessageBox(ghwndMain,"Failed in GetClientRect!"C,"Error"C, MB_OK)
end if
tbi%bKillThrd = .FALSE.
call CopyMemory (pThreadBlockInfo,LOC(tbi),SIZEOFTHREADBLOCKINFO)

call InitializeBoxes(FALSE, pThreadBlockInfo)

StartDemo = TRUE
return
end


subroutine InitializeBoxes(fVectorsOnly, pThreadBlockInfo)
!MS$ATTRIBUTES VALUE :: fVectorsOnly
!MS$ATTRIBUTES VALUE :: pThreadBlockInfo
use thrdinc
integer*4   fVectorsOnly, pThreadBlockInfo
integer*4   GetRandomVector [EXTERN]
type (THREADBLOCKINFO)     tbi
    
integer*4    j, i

!/*
! * Initialize bounce arrays...
! */
call CopyMemory (LOC(tbi),pThreadBlockInfo,SIZEOFTHREADBLOCKINFO)
do i = 1, COBJS
    if (fVectorsOnly == 0) then
        do j = 1, CPOINTS
            tbi%gab(i)%apt(j)%x = 0
            tbi%gab(i)%apt(j)%y = 0
        end do
        tbi%gab(i)%iColor = 0
    end if

    if (GetRandomVector() <= 3) then
        if (GetRandomVector() >= 4) then
            tbi%gab(i)%vx = 4
        else
            tbi%gab(i)%vx = 1
        end if

        tbi%gab(i)%vy = GetRandomVector()
    else
        if (GetRandomVector() >= 4) then
            tbi%gab(i)%vy = 4
        else
            tbi%gab(i)%vy = 1
        end if

        tbi%gab(i)%vx = GetRandomVector()
    end if

    tbi%gab(i)%dx = tbi%gab(i)%vx
    tbi%gab(i)%dy = tbi%gab(i)%vy

    tbi%gab(i)%ax = GetRandomVector() + 3
    tbi%gab(i)%ay = GetRandomVector() + 3

    ipx  = tbi%gab(i)%apt(1)%x
    ipy  = tbi%gab(i)%apt(1)%y
    ipdx = tbi%gab(i)%dx
    ipdy = tbi%gab(i)%dy
    ipvx = tbi%gab(i)%vx
    ipvy = tbi%gab(i)%vy
    iax  = tbi%gab(i)%ax
    iay  = tbi%gab(i)%ay

end do
call CopyMemory (pThreadBlockInfo,LOC(tbi),SIZEOFTHREADBLOCKINFO)
end

