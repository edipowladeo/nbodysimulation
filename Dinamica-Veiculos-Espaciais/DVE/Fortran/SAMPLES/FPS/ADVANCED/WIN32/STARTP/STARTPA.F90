subroutine help ()
!MS$ATTRIBUTES STDCALL,ALIAS : '_help@0' :: help

use msfwin
write(*,*)("Starts a specified program, batch, or command file.")
write(*,*)("STARTP [/Ttitle] [/Dpath] [/l] [/h] [/r] [/min] [/max] [/w]")
write(*,*)("       [/c] [/n] [program] [parameters]")
write(*,*)("    title       Title to display in window title bar. Quote the")
write(*,*)("                entire paramter to use (null) the title,")
write(*,*)("                i.e. startp ""/Ttest job""")
write(*,*)("    path        Starting DirName")
write(*,*)("    l           Set default to low priority")
write(*,*)    ("    h           Set default to high priority")
write(*,*)("    r           Set default to realtime priority")
write(*,*)("    min         Start window minimized")
write(*,*)("    max         Start window maximized")
write(*,*)("    w           Wait for started process to end before returning")
write(*,*)("                control to the command processor.This option starts")
write(*,*)("                the process synchronously")
write(*,*)("    c           Use current console instead of creating a new console")
write(*,*)("    n           Start detached with no console")
write(*,*)("    program     A batch file or program to run as either GUI")
write(*,*)("                application or a console application")
write(*,*)("    parameters  These are the parameters passed to the program")
write(*,*)("Note that the priority parameters may have no effect if the program")
write(*,*)("changes its own priority.")
call ExitProcess(1)
end
