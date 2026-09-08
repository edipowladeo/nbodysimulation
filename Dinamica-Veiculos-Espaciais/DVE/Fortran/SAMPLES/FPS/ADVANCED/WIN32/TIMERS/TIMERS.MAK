# Microsoft Visual C++ Generated NMAKE File, Format Version 40000
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Console Application" 0x0103

!IF "$(CFG)" == ""
CFG=timers - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to timers - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "timers - Win32 Release" && "$(CFG)" != "timers - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "timers.mak" CFG="timers - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "timers - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "timers - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 
################################################################################
# Begin Project
CPP=cl.exe
F90=fl32.exe
RSC=rc.exe

!IF  "$(CFG)" == "timers - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir Release
# PROP BASE Intermediate_Dir Release
# PROP BASE Target_Dir
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir Release
# PROP Intermediate_Dir Release
# PROP Target_Dir
OUTDIR=.\Release
INTDIR=.\Release

ALL : "$(OUTDIR)\timers.exe"

CLEAN : 
	-@erase ".\Release\timers.exe"
	-@erase ".\Release\timers3.obj"
	-@erase ".\Release\timers2.obj"
	-@erase ".\Release\timerinc.mod"
	-@erase ".\Release\timers1.obj"
	-@erase ".\Release\timers.obj"
	-@erase ".\Release\timerinc.obj"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Ox /I "Release/" /c /nologo
# ADD F90 /Ox /I "Release/" /c /nologo
F90_PROJ=/Ox /I "Release/" /c /nologo /Fo"Release/" 
F90_OBJS=.\Release/
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /YX /c
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE"\
 /Fp"$(INTDIR)/timers.pch" /YX /Fo"$(INTDIR)/" /c 
CPP_OBJS=.\Release/
CPP_SBRS=
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/timers.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:console /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:console /incremental:no\
 /pdb:"$(OUTDIR)/timers.pdb" /machine:I386 /out:"$(OUTDIR)/timers.exe" 
LINK32_OBJS= \
	"$(INTDIR)/timers3.obj" \
	"$(INTDIR)/timers2.obj" \
	"$(INTDIR)/timers1.obj" \
	"$(INTDIR)/timers.obj" \
	"$(INTDIR)/timerinc.obj"

"$(OUTDIR)\timers.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "timers - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir Debug
# PROP BASE Intermediate_Dir Debug
# PROP BASE Target_Dir
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir Debug
# PROP Intermediate_Dir Debug
# PROP Target_Dir
OUTDIR=.\Debug
INTDIR=.\Debug

ALL : "$(OUTDIR)\timers.exe"

CLEAN : 
	-@erase ".\Debug\timers.exe"
	-@erase ".\Debug\timers3.obj"
	-@erase ".\Debug\timers2.obj"
	-@erase ".\Debug\timerinc.mod"
	-@erase ".\Debug\timers1.obj"
	-@erase ".\Debug\timers.obj"
	-@erase ".\Debug\timerinc.obj"
	-@erase ".\Debug\timers.ilk"
	-@erase ".\Debug\timers.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Zi /I "Debug/" /c /nologo
# ADD F90 /Zi /I "Debug/" /c /nologo
F90_PROJ=/Zi /I "Debug/" /c /nologo /Fo"Debug/" /Fd"Debug/timers.pdb" 
F90_OBJS=.\Debug/
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /YX /c
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE"\
 /Fp"$(INTDIR)/timers.pch" /YX /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c 
CPP_OBJS=.\Debug/
CPP_SBRS=
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/timers.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:console /debug /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:console /incremental:yes\
 /pdb:"$(OUTDIR)/timers.pdb" /debug /machine:I386 /out:"$(OUTDIR)/timers.exe" 
LINK32_OBJS= \
	"$(INTDIR)/timers3.obj" \
	"$(INTDIR)/timers2.obj" \
	"$(INTDIR)/timers1.obj" \
	"$(INTDIR)/timers.obj" \
	"$(INTDIR)/timerinc.obj"

"$(OUTDIR)\timers.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 

.c{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.c{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

.for{$(F90_OBJS)}.obj:
   $(F90) $(F90_PROJ) $<  

.f{$(F90_OBJS)}.obj:
   $(F90) $(F90_PROJ) $<  

.f90{$(F90_OBJS)}.obj:
   $(F90) $(F90_PROJ) $<  

################################################################################
# Begin Target

# Name "timers - Win32 Release"
# Name "timers - Win32 Debug"

!IF  "$(CFG)" == "timers - Win32 Release"

!ELSEIF  "$(CFG)" == "timers - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\timers3.f90

"$(INTDIR)\timers3.obj" : $(SOURCE) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\timers2.f90

!IF  "$(CFG)" == "timers - Win32 Release"

NODEP_F90_TIMER=\
	".\Release\timerinc.mod"\
	

"$(INTDIR)\timers2.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\timerinc.mod"


!ELSEIF  "$(CFG)" == "timers - Win32 Debug"

NODEP_F90_TIMER=\
	".\Debug\timerinc.mod"\
	

"$(INTDIR)\timers2.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\timerinc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\timers1.f90

!IF  "$(CFG)" == "timers - Win32 Release"

NODEP_F90_TIMERS=\
	".\Release\timerinc.mod"\
	

"$(INTDIR)\timers1.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\timerinc.mod"


!ELSEIF  "$(CFG)" == "timers - Win32 Debug"

NODEP_F90_TIMERS=\
	".\Debug\timerinc.mod"\
	

"$(INTDIR)\timers1.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\timerinc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\timers.h

!IF  "$(CFG)" == "timers - Win32 Release"

!ELSEIF  "$(CFG)" == "timers - Win32 Debug"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\timers.f90

!IF  "$(CFG)" == "timers - Win32 Release"

NODEP_F90_TIMERS_=\
	".\Release\timerinc.mod"\
	

"$(INTDIR)\timers.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\timerinc.mod"


!ELSEIF  "$(CFG)" == "timers - Win32 Debug"

NODEP_F90_TIMERS_=\
	".\Debug\timerinc.mod"\
	

"$(INTDIR)\timers.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\timerinc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\timerinc.f90
DEP_F90_TIMERI=\
	{$(INCLUDE)}"\msfwin.mod"\
	

!IF  "$(CFG)" == "timers - Win32 Release"

F90_MODOUT=\
	"timerinc"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\timerinc.obj" : $(SOURCE) $(DEP_F90_TIMERI) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\timerinc.mod" : $(SOURCE) $(DEP_F90_TIMERI) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "timers - Win32 Debug"

F90_MODOUT=\
	"timerinc"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\timerinc.obj" : $(SOURCE) $(DEP_F90_TIMERI) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\timerinc.mod" : $(SOURCE) $(DEP_F90_TIMERI) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
# End Target
# End Project
################################################################################
