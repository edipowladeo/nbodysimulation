# Microsoft Visual C++ Generated NMAKE File, Format Version 40000
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) QuickWin Application" 0x0107

!IF "$(CFG)" == ""
CFG=qwpiano - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to qwpiano - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "qwpiano - Win32 Release" && "$(CFG)" !=\
 "qwpiano - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "qwpiano.mak" CFG="qwpiano - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "qwpiano - Win32 Release" (based on\
 "Win32 (x86) QuickWin Application")
!MESSAGE "qwpiano - Win32 Debug" (based on "Win32 (x86) QuickWin Application")
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
F90=fl32.exe
MTL=mktyplib.exe
RSC=rc.exe

!IF  "$(CFG)" == "qwpiano - Win32 Release"

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

ALL : "$(OUTDIR)\qwpiano.exe"

CLEAN : 
	-@erase ".\Release\qwpiano.exe"
	-@erase ".\Release\qwpiano.obj"
	-@erase ".\Release\PIANOMOD.mod"
	-@erase ".\Release\ptempo.obj"
	-@erase ".\Release\pmem.obj"
	-@erase ".\Release\pianomod.obj"
	-@erase ".\Release\pdraw.obj"

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)/qwpiano.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386 /nodefaultlib:"console.lib"
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386 /nodefaultlib:"console.lib"
LINK32_FLAGS=kernel32.lib /nologo /subsystem:windows /incremental:no\
 /pdb:"$(OUTDIR)/qwpiano.pdb" /machine:I386 /nodefaultlib:"console.lib"\
 /out:"$(OUTDIR)/qwpiano.exe" 
LINK32_OBJS= \
	"$(INTDIR)/qwpiano.obj" \
	"$(INTDIR)/ptempo.obj" \
	"$(INTDIR)/pmem.obj" \
	"$(INTDIR)/pianomod.obj" \
	"$(INTDIR)/pdraw.obj"

"$(OUTDIR)\qwpiano.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "qwpiano - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir qwpiano_
# PROP BASE Intermediate_Dir qwpiano_
# PROP BASE Target_Dir
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir qwpiano_
# PROP Intermediate_Dir qwpiano_
# PROP Target_Dir
OUTDIR=.\qwpiano_
INTDIR=.\qwpiano_

ALL : "$(OUTDIR)\qwpiano.exe"

CLEAN : 
	-@erase ".\qwpiano_\qwpiano.exe"
	-@erase ".\qwpiano_\qwpiano.obj"
	-@erase ".\qwpiano_\PIANOMOD.mod"
	-@erase ".\qwpiano_\ptempo.obj"
	-@erase ".\qwpiano_\pmem.obj"
	-@erase ".\qwpiano_\pianomod.obj"
	-@erase ".\qwpiano_\pdraw.obj"
	-@erase ".\qwpiano_\qwpiano.ilk"
	-@erase ".\qwpiano_\qwpiano.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Zi /I "qwpiano_/" /c /nologo /MW
# ADD F90 /Zi /I "qwpiano_/" /c /nologo /MW
F90_PROJ=/Zi /I "qwpiano_/" /c /nologo /MW /Fo"qwpiano_/"\
 /Fd"qwpiano_/qwpiano.pdb" 
F90_OBJS=.\qwpiano_/
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /win32
MTL_PROJ=/nologo /D "_DEBUG" /win32 
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/qwpiano.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386 /nodefaultlib:"console.lib"
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386 /nodefaultlib:"console.lib"
LINK32_FLAGS=kernel32.lib /nologo /subsystem:windows /incremental:yes\
 /pdb:"$(OUTDIR)/qwpiano.pdb" /debug /machine:I386 /nodefaultlib:"console.lib"\
 /out:"$(OUTDIR)/qwpiano.exe" 
LINK32_OBJS= \
	"$(INTDIR)/qwpiano.obj" \
	"$(INTDIR)/ptempo.obj" \
	"$(INTDIR)/pmem.obj" \
	"$(INTDIR)/pianomod.obj" \
	"$(INTDIR)/pdraw.obj"

"$(OUTDIR)\qwpiano.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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

# Name "qwpiano - Win32 Release"
# Name "qwpiano - Win32 Debug"

!IF  "$(CFG)" == "qwpiano - Win32 Release"

!ELSEIF  "$(CFG)" == "qwpiano - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\qwpiano.f90

!IF  "$(CFG)" == "qwpiano - Win32 Release"

DEP_F90_QWPIA=\
	{$(INCLUDE)}"\MSFLIB.MOD"\
	{$(INCLUDE)}"\MT.MOD"\
	
NODEP_F90_QWPIA=\
	".\Release\PIANOMOD.mod"\
	

"$(INTDIR)\qwpiano.obj" : $(SOURCE) $(DEP_F90_QWPIA) "$(INTDIR)"\
 "$(INTDIR)\PIANOMOD.mod"


!ELSEIF  "$(CFG)" == "qwpiano - Win32 Debug"

DEP_F90_QWPIA=\
	{$(INCLUDE)}"\MSFLIB.MOD"\
	{$(INCLUDE)}"\MT.MOD"\
	
NODEP_F90_QWPIA=\
	".\qwpiano_\PIANOMOD.mod"\
	

"$(INTDIR)\qwpiano.obj" : $(SOURCE) $(DEP_F90_QWPIA) "$(INTDIR)"\
 "$(INTDIR)\PIANOMOD.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\ptempo.f90

!IF  "$(CFG)" == "qwpiano - Win32 Release"

DEP_F90_PTEMP=\
	{$(INCLUDE)}"\MSFLIB.MOD"\
	
NODEP_F90_PTEMP=\
	".\Release\PIANOMOD.mod"\
	

"$(INTDIR)\ptempo.obj" : $(SOURCE) $(DEP_F90_PTEMP) "$(INTDIR)"\
 "$(INTDIR)\PIANOMOD.mod"


!ELSEIF  "$(CFG)" == "qwpiano - Win32 Debug"

DEP_F90_PTEMP=\
	{$(INCLUDE)}"\MSFLIB.MOD"\
	
NODEP_F90_PTEMP=\
	".\qwpiano_\PIANOMOD.mod"\
	

"$(INTDIR)\ptempo.obj" : $(SOURCE) $(DEP_F90_PTEMP) "$(INTDIR)"\
 "$(INTDIR)\PIANOMOD.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\pmem.f90

!IF  "$(CFG)" == "qwpiano - Win32 Release"

DEP_F90_PMEM_=\
	{$(INCLUDE)}"\MSFLIB.MOD"\
	
NODEP_F90_PMEM_=\
	".\Release\PIANOMOD.mod"\
	

"$(INTDIR)\pmem.obj" : $(SOURCE) $(DEP_F90_PMEM_) "$(INTDIR)"\
 "$(INTDIR)\PIANOMOD.mod"


!ELSEIF  "$(CFG)" == "qwpiano - Win32 Debug"

DEP_F90_PMEM_=\
	{$(INCLUDE)}"\MSFLIB.MOD"\
	
NODEP_F90_PMEM_=\
	".\qwpiano_\PIANOMOD.mod"\
	

"$(INTDIR)\pmem.obj" : $(SOURCE) $(DEP_F90_PMEM_) "$(INTDIR)"\
 "$(INTDIR)\PIANOMOD.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\pianomod.f90

!IF  "$(CFG)" == "qwpiano - Win32 Release"

F90_MODOUT=\
	"PIANOMOD"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\pianomod.obj" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\PIANOMOD.mod" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "qwpiano - Win32 Debug"

F90_MODOUT=\
	"PIANOMOD"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\pianomod.obj" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\PIANOMOD.mod" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\pdraw.f90

!IF  "$(CFG)" == "qwpiano - Win32 Release"

DEP_F90_PDRAW=\
	{$(INCLUDE)}"\MSFLIB.MOD"\
	
NODEP_F90_PDRAW=\
	".\Release\PIANOMOD.mod"\
	

"$(INTDIR)\pdraw.obj" : $(SOURCE) $(DEP_F90_PDRAW) "$(INTDIR)"\
 "$(INTDIR)\PIANOMOD.mod"


!ELSEIF  "$(CFG)" == "qwpiano - Win32 Debug"

DEP_F90_PDRAW=\
	{$(INCLUDE)}"\MSFLIB.MOD"\
	
NODEP_F90_PDRAW=\
	".\qwpiano_\PIANOMOD.mod"\
	

"$(INTDIR)\pdraw.obj" : $(SOURCE) $(DEP_F90_PDRAW) "$(INTDIR)"\
 "$(INTDIR)\PIANOMOD.mod"


!ENDIF 

# End Source File
# End Target
# End Project
################################################################################
