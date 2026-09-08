# Microsoft Visual C++ Generated NMAKE File, Format Version 40000
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Console Application" 0x0103

!IF "$(CFG)" == ""
CFG=floppy - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to floppy - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "floppy - Win32 Release" && "$(CFG)" != "floppy - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "floppy.mak" CFG="floppy - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "floppy - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "floppy - Win32 Debug" (based on "Win32 (x86) Console Application")
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

!IF  "$(CFG)" == "floppy - Win32 Release"

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

ALL : "$(OUTDIR)\floppy.exe"

CLEAN : 
	-@erase ".\Release\floppy.exe"
	-@erase ".\Release\mfmt.obj"
	-@erase ".\Release\mfmtinc.mod"
	-@erase ".\Release\mfmtinc.obj"
	-@erase ".\Release\mfmtd.obj"
	-@erase ".\Release\mfmtc.obj"
	-@erase ".\Release\mfmtb.obj"
	-@erase ".\Release\mfmta.obj"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Ox /I "Release/" /c /nologo
# ADD F90 /Ox /I "Release/" /c /nologo
F90_PROJ=/Ox /I "Release/" /c /nologo /Fo"Release/" 
F90_OBJS=.\Release/
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /YX /c
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE"\
 /Fp"$(INTDIR)/floppy.pch" /YX /Fo"$(INTDIR)/" /c 
CPP_OBJS=.\Release/
CPP_SBRS=
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/floppy.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:console /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:console /incremental:no\
 /pdb:"$(OUTDIR)/floppy.pdb" /machine:I386 /out:"$(OUTDIR)/floppy.exe" 
LINK32_OBJS= \
	"$(INTDIR)/mfmt.obj" \
	"$(INTDIR)/mfmtinc.obj" \
	"$(INTDIR)/mfmtd.obj" \
	"$(INTDIR)/mfmtc.obj" \
	"$(INTDIR)/mfmtb.obj" \
	"$(INTDIR)/mfmta.obj"

"$(OUTDIR)\floppy.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "floppy - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir floppy__
# PROP BASE Intermediate_Dir floppy__
# PROP BASE Target_Dir
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir floppy__
# PROP Intermediate_Dir floppy__
# PROP Target_Dir
OUTDIR=.\floppy__
INTDIR=.\floppy__

ALL : "$(OUTDIR)\floppy.exe"

CLEAN : 
	-@erase ".\floppy__\floppy.exe"
	-@erase ".\floppy__\mfmt.obj"
	-@erase ".\floppy__\mfmtinc.mod"
	-@erase ".\floppy__\mfmtinc.obj"
	-@erase ".\floppy__\mfmtd.obj"
	-@erase ".\floppy__\mfmtc.obj"
	-@erase ".\floppy__\mfmtb.obj"
	-@erase ".\floppy__\mfmta.obj"
	-@erase ".\floppy__\floppy.ilk"
	-@erase ".\floppy__\floppy.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Zi /I "floppy__/" /c /nologo
# ADD F90 /Zi /I "floppy__/" /c /nologo
F90_PROJ=/Zi /I "floppy__/" /c /nologo /Fo"floppy__/" /Fd"floppy__/floppy.pdb" 
F90_OBJS=.\floppy__/
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /YX /c
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE"\
 /Fp"$(INTDIR)/floppy.pch" /YX /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c 
CPP_OBJS=.\floppy__/
CPP_SBRS=
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/floppy.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:console /debug /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:console /incremental:yes\
 /pdb:"$(OUTDIR)/floppy.pdb" /debug /machine:I386 /out:"$(OUTDIR)/floppy.exe" 
LINK32_OBJS= \
	"$(INTDIR)/mfmt.obj" \
	"$(INTDIR)/mfmtinc.obj" \
	"$(INTDIR)/mfmtd.obj" \
	"$(INTDIR)/mfmtc.obj" \
	"$(INTDIR)/mfmtb.obj" \
	"$(INTDIR)/mfmta.obj"

"$(OUTDIR)\floppy.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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

# Name "floppy - Win32 Release"
# Name "floppy - Win32 Debug"

!IF  "$(CFG)" == "floppy - Win32 Release"

!ELSEIF  "$(CFG)" == "floppy - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\mfmt.f90

!IF  "$(CFG)" == "floppy - Win32 Release"

DEP_F90_MFMT_=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_MFMT_=\
	".\Release\mfmtinc.mod"\
	

"$(INTDIR)\mfmt.obj" : $(SOURCE) $(DEP_F90_MFMT_) "$(INTDIR)"\
 "$(INTDIR)\mfmtinc.mod"


!ELSEIF  "$(CFG)" == "floppy - Win32 Debug"

DEP_F90_MFMT_=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_MFMT_=\
	".\floppy__\mfmtinc.mod"\
	

"$(INTDIR)\mfmt.obj" : $(SOURCE) $(DEP_F90_MFMT_) "$(INTDIR)"\
 "$(INTDIR)\mfmtinc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\mfmtinc.f90
DEP_F90_MFMTI=\
	{$(INCLUDE)}"\msfwin.mod"\
	

!IF  "$(CFG)" == "floppy - Win32 Release"

F90_MODOUT=\
	"mfmtinc"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\mfmtinc.obj" : $(SOURCE) $(DEP_F90_MFMTI) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\mfmtinc.mod" : $(SOURCE) $(DEP_F90_MFMTI) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "floppy - Win32 Debug"

F90_MODOUT=\
	"mfmtinc"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\mfmtinc.obj" : $(SOURCE) $(DEP_F90_MFMTI) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\mfmtinc.mod" : $(SOURCE) $(DEP_F90_MFMTI) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\mfmtd.f90
DEP_F90_MFMTD=\
	{$(INCLUDE)}"\msfwin.mod"\
	

"$(INTDIR)\mfmtd.obj" : $(SOURCE) $(DEP_F90_MFMTD) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\mfmtc.f90
DEP_F90_MFMTC=\
	{$(INCLUDE)}"\msfwin.mod"\
	

"$(INTDIR)\mfmtc.obj" : $(SOURCE) $(DEP_F90_MFMTC) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\mfmtb.f90

!IF  "$(CFG)" == "floppy - Win32 Release"

DEP_F90_MFMTB=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_MFMTB=\
	".\Release\mfmtinc.mod"\
	

"$(INTDIR)\mfmtb.obj" : $(SOURCE) $(DEP_F90_MFMTB) "$(INTDIR)"\
 "$(INTDIR)\mfmtinc.mod"


!ELSEIF  "$(CFG)" == "floppy - Win32 Debug"

DEP_F90_MFMTB=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_MFMTB=\
	".\floppy__\mfmtinc.mod"\
	

"$(INTDIR)\mfmtb.obj" : $(SOURCE) $(DEP_F90_MFMTB) "$(INTDIR)"\
 "$(INTDIR)\mfmtinc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\mfmta.f90

!IF  "$(CFG)" == "floppy - Win32 Release"

DEP_F90_MFMTA=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_MFMTA=\
	".\Release\mfmtinc.mod"\
	

"$(INTDIR)\mfmta.obj" : $(SOURCE) $(DEP_F90_MFMTA) "$(INTDIR)"\
 "$(INTDIR)\mfmtinc.mod"


!ELSEIF  "$(CFG)" == "floppy - Win32 Debug"

DEP_F90_MFMTA=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_MFMTA=\
	".\floppy__\mfmtinc.mod"\
	

"$(INTDIR)\mfmta.obj" : $(SOURCE) $(DEP_F90_MFMTA) "$(INTDIR)"\
 "$(INTDIR)\mfmtinc.mod"


!ENDIF 

# End Source File
# End Target
# End Project
################################################################################
