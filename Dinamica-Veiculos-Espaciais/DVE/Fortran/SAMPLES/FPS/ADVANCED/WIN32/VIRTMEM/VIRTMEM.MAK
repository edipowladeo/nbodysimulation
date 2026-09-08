# Microsoft Visual C++ Generated NMAKE File, Format Version 40000
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

!IF "$(CFG)" == ""
CFG=virtmem - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to virtmem - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "virtmem - Win32 Release" && "$(CFG)" !=\
 "virtmem - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "virtmem.mak" CFG="virtmem - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "virtmem - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "virtmem - Win32 Debug" (based on "Win32 (x86) Application")
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
RSC=rc.exe
MTL=mktyplib.exe
CPP=cl.exe
F90=fl32.exe

!IF  "$(CFG)" == "virtmem - Win32 Release"

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

ALL : "$(OUTDIR)\virtmem.exe"

CLEAN : 
	-@erase ".\Release\virtmem.exe"
	-@erase ".\Release\vmeminc.obj"
	-@erase ".\Release\virtmema.obj"
	-@erase ".\Release\vmeminc.mod"
	-@erase ".\Release\virtmem.res"
	-@erase ".\Release\virtmem.obj"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Ox /I "Release/" /c /nologo
# ADD F90 /Ox /I "Release/" /c /nologo
F90_PROJ=/Ox /I "Release/" /c /nologo /Fo"Release/" 
F90_OBJS=.\Release/
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS"\
 /Fp"$(INTDIR)/virtmem.pch" /YX /Fo"$(INTDIR)/" /c 
CPP_OBJS=.\Release/
CPP_SBRS=
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /win32
MTL_PROJ=/nologo /D "NDEBUG" /win32 
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
RSC_PROJ=/l 0x409 /fo"$(INTDIR)/virtmem.res" /d "NDEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/virtmem.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:windows /incremental:no\
 /pdb:"$(OUTDIR)/virtmem.pdb" /machine:I386 /out:"$(OUTDIR)/virtmem.exe" 
LINK32_OBJS= \
	"$(INTDIR)/vmeminc.obj" \
	"$(INTDIR)/virtmema.obj" \
	"$(INTDIR)/virtmem.obj" \
	"$(INTDIR)/virtmem.res"

"$(OUTDIR)\virtmem.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "virtmem - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir virtmem_
# PROP BASE Intermediate_Dir virtmem_
# PROP BASE Target_Dir
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir virtmem_
# PROP Intermediate_Dir virtmem_
# PROP Target_Dir
OUTDIR=.\virtmem_
INTDIR=.\virtmem_

ALL : "$(OUTDIR)\virtmem.exe"

CLEAN : 
	-@erase ".\virtmem_\virtmem.exe"
	-@erase ".\virtmem_\vmeminc.obj"
	-@erase ".\virtmem_\virtmema.obj"
	-@erase ".\virtmem_\vmeminc.mod"
	-@erase ".\virtmem_\virtmem.res"
	-@erase ".\virtmem_\virtmem.obj"
	-@erase ".\virtmem_\virtmem.ilk"
	-@erase ".\virtmem_\virtmem.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Zi /I "virtmem_/" /c /nologo
# ADD F90 /Zi /I "virtmem_/" /c /nologo
F90_PROJ=/Zi /I "virtmem_/" /c /nologo /Fo"virtmem_/" /Fd"virtmem_/virtmem.pdb"\
 
F90_OBJS=.\virtmem_/
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS"\
 /Fp"$(INTDIR)/virtmem.pch" /YX /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c 
CPP_OBJS=.\virtmem_/
CPP_SBRS=
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /win32
MTL_PROJ=/nologo /D "_DEBUG" /win32 
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
RSC_PROJ=/l 0x409 /fo"$(INTDIR)/virtmem.res" /d "_DEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/virtmem.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:windows /incremental:yes\
 /pdb:"$(OUTDIR)/virtmem.pdb" /debug /machine:I386 /out:"$(OUTDIR)/virtmem.exe" 
LINK32_OBJS= \
	"$(INTDIR)/vmeminc.obj" \
	"$(INTDIR)/virtmema.obj" \
	"$(INTDIR)/virtmem.obj" \
	"$(INTDIR)/virtmem.res"

"$(OUTDIR)\virtmem.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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

# Name "virtmem - Win32 Release"
# Name "virtmem - Win32 Debug"

!IF  "$(CFG)" == "virtmem - Win32 Release"

!ELSEIF  "$(CFG)" == "virtmem - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\vmeminc.f90
DEP_F90_VMEMI=\
	{$(INCLUDE)}"\msfwin.mod"\
	

!IF  "$(CFG)" == "virtmem - Win32 Release"

F90_MODOUT=\
	"vmeminc"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\vmeminc.obj" : $(SOURCE) $(DEP_F90_VMEMI) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\vmeminc.mod" : $(SOURCE) $(DEP_F90_VMEMI) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "virtmem - Win32 Debug"

F90_MODOUT=\
	"vmeminc"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\vmeminc.obj" : $(SOURCE) $(DEP_F90_VMEMI) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\vmeminc.mod" : $(SOURCE) $(DEP_F90_VMEMI) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\virtmema.f90

!IF  "$(CFG)" == "virtmem - Win32 Release"

NODEP_F90_VIRTM=\
	".\Release\vmeminc.mod"\
	

"$(INTDIR)\virtmema.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\vmeminc.mod"


!ELSEIF  "$(CFG)" == "virtmem - Win32 Debug"

NODEP_F90_VIRTM=\
	".\virtmem_\vmeminc.mod"\
	

"$(INTDIR)\virtmema.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\vmeminc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\virtmem.rc
DEP_RSC_VIRTME=\
	".\virtmem.h"\
	

"$(INTDIR)\virtmem.res" : $(SOURCE) $(DEP_RSC_VIRTME) "$(INTDIR)"
   $(RSC) $(RSC_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE=.\virtmem.h

!IF  "$(CFG)" == "virtmem - Win32 Release"

!ELSEIF  "$(CFG)" == "virtmem - Win32 Debug"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\virtmem.f90

!IF  "$(CFG)" == "virtmem - Win32 Release"

NODEP_F90_VIRTMEM=\
	".\Release\vmeminc.mod"\
	

"$(INTDIR)\virtmem.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\vmeminc.mod"


!ELSEIF  "$(CFG)" == "virtmem - Win32 Debug"

NODEP_F90_VIRTMEM=\
	".\virtmem_\vmeminc.mod"\
	

"$(INTDIR)\virtmem.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\vmeminc.mod"


!ENDIF 

# End Source File
# End Target
# End Project
################################################################################
