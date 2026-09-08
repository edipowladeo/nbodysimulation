# Microsoft Visual C++ Generated NMAKE File, Format Version 40000
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) QuickWin Application" 0x0107

!IF "$(CFG)" == ""
CFG=qwpaint - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to qwpaint - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "qwpaint - Win32 Release" && "$(CFG)" !=\
 "qwpaint - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "qwpaint.mak" CFG="qwpaint - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "qwpaint - Win32 Release" (based on\
 "Win32 (x86) QuickWin Application")
!MESSAGE "qwpaint - Win32 Debug" (based on "Win32 (x86) QuickWin Application")
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
MTL=mktyplib.exe
F90=fl32.exe
RSC=rc.exe

!IF  "$(CFG)" == "qwpaint - Win32 Release"

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

ALL : "$(OUTDIR)\qwpaint.exe"

CLEAN : 
	-@erase ".\Release\qwpaint.exe"
	-@erase ".\Release\qwpaint.obj"
	-@erase ".\Release\QWPAINT.mod"
	-@erase ".\Release\paintmod.obj"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Ox /I "Release/" /c /nologo /MW
# ADD F90 /Ox /I "Release/" /c /nologo /MW
F90_PROJ=/Ox /I "Release/" /c /nologo /MW /Fo"Release/" 
F90_OBJS=.\Release/
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /win32
MTL_PROJ=/nologo /D "NDEBUG" /win32 
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/qwpaint.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386 /nodefaultlib:"console.lib"
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386 /nodefaultlib:"console.lib"
LINK32_FLAGS=kernel32.lib /nologo /subsystem:windows /incremental:no\
 /pdb:"$(OUTDIR)/qwpaint.pdb" /machine:I386 /nodefaultlib:"console.lib"\
 /out:"$(OUTDIR)/qwpaint.exe" 
LINK32_OBJS= \
	"$(INTDIR)/qwpaint.obj" \
	"$(INTDIR)/paintmod.obj"

"$(OUTDIR)\qwpaint.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "qwpaint - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir qwpaint_
# PROP BASE Intermediate_Dir qwpaint_
# PROP BASE Target_Dir
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir qwpaint_
# PROP Intermediate_Dir qwpaint_
# PROP Target_Dir
OUTDIR=.\qwpaint_
INTDIR=.\qwpaint_

ALL : "$(OUTDIR)\qwpaint.exe"

CLEAN : 
	-@erase ".\qwpaint_\qwpaint.exe"
	-@erase ".\qwpaint_\qwpaint.obj"
	-@erase ".\qwpaint_\QWPAINT.mod"
	-@erase ".\qwpaint_\paintmod.obj"
	-@erase ".\qwpaint_\qwpaint.ilk"
	-@erase ".\qwpaint_\qwpaint.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Zi /I "qwpaint_/" /c /nologo /MW
# ADD F90 /Zi /I "qwpaint_/" /c /nologo /MW
F90_PROJ=/Zi /I "qwpaint_/" /c /nologo /MW /Fo"qwpaint_/"\
 /Fd"qwpaint_/qwpaint.pdb" 
F90_OBJS=.\qwpaint_/
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /win32
MTL_PROJ=/nologo /D "_DEBUG" /win32 
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/qwpaint.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386 /nodefaultlib:"console.lib"
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386 /nodefaultlib:"console.lib"
LINK32_FLAGS=kernel32.lib /nologo /subsystem:windows /incremental:yes\
 /pdb:"$(OUTDIR)/qwpaint.pdb" /debug /machine:I386 /nodefaultlib:"console.lib"\
 /out:"$(OUTDIR)/qwpaint.exe" 
LINK32_OBJS= \
	"$(INTDIR)/qwpaint.obj" \
	"$(INTDIR)/paintmod.obj"

"$(OUTDIR)\qwpaint.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 

.for{$(F90_OBJS)}.obj:
   $(F90) $(F90_PROJ) $<  

.f{$(F90_OBJS)}.obj:
   $(F90) $(F90_PROJ) $<  

.f90{$(F90_OBJS)}.obj:
   $(F90) $(F90_PROJ) $<  

################################################################################
# Begin Target

# Name "qwpaint - Win32 Release"
# Name "qwpaint - Win32 Debug"

!IF  "$(CFG)" == "qwpaint - Win32 Release"

!ELSEIF  "$(CFG)" == "qwpaint - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\qwpaint.f90

!IF  "$(CFG)" == "qwpaint - Win32 Release"

DEP_F90_QWPAI=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	
NODEP_F90_QWPAI=\
	".\Release\QWPAINT.mod"\
	

"$(INTDIR)\qwpaint.obj" : $(SOURCE) $(DEP_F90_QWPAI) "$(INTDIR)"\
 "$(INTDIR)\QWPAINT.mod"


!ELSEIF  "$(CFG)" == "qwpaint - Win32 Debug"

DEP_F90_QWPAI=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	
NODEP_F90_QWPAI=\
	".\qwpaint_\QWPAINT.mod"\
	

"$(INTDIR)\qwpaint.obj" : $(SOURCE) $(DEP_F90_QWPAI) "$(INTDIR)"\
 "$(INTDIR)\QWPAINT.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\paintmod.f90
DEP_F90_PAINT=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	

!IF  "$(CFG)" == "qwpaint - Win32 Release"

F90_MODOUT=\
	"QWPAINT"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\paintmod.obj" : $(SOURCE) $(DEP_F90_PAINT) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\QWPAINT.mod" : $(SOURCE) $(DEP_F90_PAINT) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "qwpaint - Win32 Debug"

F90_MODOUT=\
	"QWPAINT"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\paintmod.obj" : $(SOURCE) $(DEP_F90_PAINT) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\QWPAINT.mod" : $(SOURCE) $(DEP_F90_PAINT) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
# End Target
# End Project
################################################################################
