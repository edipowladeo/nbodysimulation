integer*4 function GetRandomVector()
real   ret
!/*
! * Returns a number between 1 and 6.
! */
call random(ret)
GetRandomVector = MOD(INT4(ret*6), 6) + 1
return
end


recursive subroutine BounceProc(pThreadBlockInfo)
!MS$ATTRIBUTES VALUE :: pThreadBlockInfo
use thrdinc
interface

subroutine DrawBox(x, y, hbr, pThreadBlockInfo)
!MS$ATTRIBUTES VALUE :: x
!MS$ATTRIBUTES VALUE :: y
!MS$ATTRIBUTES VALUE :: hbr
!MS$ATTRIBUTES VALUE :: pThreadBlockInfo
integer*4 x
integer*4 y
integer*4 hbr
integer*4 pThreadBlockInfo
end subroutine

recursive subroutine MoveBox(px, py, pdx, pdy, pvx, pvy, ax, ay, pThreadBlockInfo)

!MS$ATTRIBUTES REFERENCE :: px
!MS$ATTRIBUTES REFERENCE :: py
!MS$ATTRIBUTES REFERENCE :: pdx
!MS$ATTRIBUTES REFERENCE :: pdy
!MS$ATTRIBUTES REFERENCE :: pvx
!MS$ATTRIBUTES REFERENCE :: pvy
!MS$ATTRIBUTES VALUE     :: ax
!MS$ATTRIBUTES VALUE     :: ay 
!MS$ATTRIBUTES REFERENCE :: pThreadBlockInfo

integer*4 px
integer*4 py
integer*4 pdx
integer*4 pdy
integer*4 pvx
integer*4 pvy
integer*4 ax
integer*4 ay
integer*4 pThreadBlockInfo
end subroutine
end interface

 

integer*4                   pThreadBlockInfo
type (THREADBLOCKINFO)      tbi
integer*4                   i


!#ifdef LATER
!// not erasing looks cool
!/*
!* Erase...
!*/
!*      do i = 1, COBJS
!*          call DrawBox(gab(i)%apt(0)%x, gab(i)%apt(0)%y, ghbrWhite)
!*      end do
!#endif


!/*
!* Move, and bounce on wall
!*/
call CopyMemory (LOC(tbi),pThreadBlockInfo,SIZEOFTHREADBLOCKINFO)
do i = 1, COBJS
    call MoveBox(LOC(tbi%gab(i)%apt(1)%x), LOC ( tbi%gab(i)%apt(1)%y),&
             LOC ( tbi%gab(i)%dx), LOC (tbi%gab(i)%dy),               &
             LOC (tbi%gab(i)%vx), LOC (tbi%gab(i)%vy),                &
             LOC (tbi%gab(i)%ax), LOC(tbi%gab(i)%ay), pThreadBlockInfo)

end do
call CopyMemory (pThreadBlockInfo,LOC(tbi),SIZEOFTHREADBLOCKINFO)

!/*
!* Draw new...
!*/
do i = 1, COBJS
  if (tbi%gab(i)%iColor  > CCOLORS) then
    tbi%gab(i)%iColor  = 0
  else
    tbi%gab(i)%iColor  = tbi%gab(i)%iColor + 1                  
  end if

    call DrawBox(tbi%gab(i)%apt(1)%x, tbi%gab(i)%apt(1)%y, gahbrColor(tbi%gab(i)%iColor ), &
             pThreadBlockInfo)

call CopyMemory (pThreadBlockInfo,LOC(tbi),SIZEOFTHREADBLOCKINFO)

end do
end
  

