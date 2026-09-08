!****************************************************************************\
!*
!* FUNCTION: DisplayHelp
!*
!****************************************************************************/

subroutine DisplayHelp()

write(*,*)
write(*,*) "To run type CHECK_SD and 0 or 1 parameters.  Syntax:"
write(*,*) "  CHECK_SD"
write(*,*) "      or"
write(*,*) "  CHECK_SD filename"
write(*,*) "           filename is the name of the file that is passed"
write(*,*) "             to GetFileSecurity() to fetch the SD to examine"
write(*,*) "Examples:"
write(*,*) "  CHECK_SD            Checks the SD on A: (this is the default)"
write(*,*) "  CHECK_SD \\\\.\\A:     Checks the SD on A:"
write(*,*) "  CHECK_SD d:\\a.fil   Checks the SD on d:\a.fil"
write(*,*) "  CHECK_SD A:         Checks the SD on the A: root, but that"
write(*,*) "                        is not where the DACL is that  controls"
write(*,*) "                        access to the floppy, so don't do this"

end

subroutine PERR(api) 
use msfwin
character*30 api
integer*4   ret
ret = GetLastError()
write(*,100) ret, api
100   FORMAT (' Error ',  I4, ' from ' A30)
end

subroutine PMSG(mesg) 
use msfwin
character*30 mesg
write(*,110) mesg
110   FORMAT (A30)
end

