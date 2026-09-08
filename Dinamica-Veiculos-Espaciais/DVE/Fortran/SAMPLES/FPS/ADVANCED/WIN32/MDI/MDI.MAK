# Microsoft Visual C++ Generated NMAKE File, Format Version 40000
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

!IF "$(CFG)" == ""
CFG=mdi - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to mdi - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "mdi - Win32 Release" && "$(CFG)" != "mdi - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "mdi.mak" CFG="mdi - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "mdi - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "mdi - Win32 Debug" (based on "Win32 (x86) Application")
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
MTL=mktyplib.exe

!IF  "$(CFG)" == "mdi - Win32 Release"

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

ALL : "$(OUTDIR)\mdi.exe"

CLEAN : 
	-@erase ".\Release\mdi.exe"
	-@erase ".\Release\mdiinc.obj"
	-@erase ".\Release\mdic.obj"
	-@erase ".\Release\mdiinc.mod"
	-@erase ".\Release\mdib.obj"
	-@erase ".\Release\mdia.obj"
	-@erase ".\Release\mdi.res"
	-@erase ".\Release\mdi.obj"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Ox /I "Release/" /c /nologo
# ADD F90 /Ox /I "Release/" /c /nologo
F90_PROJ=/Ox /I "Release/" /c /nologo /Fo"Release/" 
F90_OBJS=.\Release/
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS"\
 /Fp"$(INTDIR)/mdi.pch" /YX /Fo"$(INTDIR)/" /c 
CPP_OBJS=.\Release/
CPP_SBRS=
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /win32
MTL_PROJ=/nologo /D "NDEBUG" /win32 
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
RSC_PROJ=/l 0x409 /fo"$(INTDIR)/mdi.res" /d "NDEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/mdi.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:windows /incremental:no\
 /pdb:"$(OUTDIR)/mdi.pdb" /machine:I386 /out:"$(OUTDIR)/mdi.exe" 
LINK32_OBJS= \
	"$(INTDIR)/mdiinc.obj" \
	"$(INTDIR)/mdic.obj" \
	"$(INTDIR)/mdib.obj" \
	"$(INTDIR)/mdia.obj" \
	"$(INTDIR)/mdi.obj" \
	"$(INTDIR)/mdi.res"

"$(OUTDIR)\mdi.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "mdi - Win32 Debug"

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

ALL : "$(OUTDIR)\mdi.exe"

CLEAN : 
	-@erase ".\Debug\mdi.exe"
	-@erase ".\Debug\mdiinc.obj"
	-@erase ".\Debug\mdic.obj"
	-@erase ".\Debug\mdiinc.mod"
	-@erase ".\Debug\mdib.obj"
	-@erase ".\Debug\mdia.obj"
	-@erase ".\Debug\mdi.res"
	-@erase ".\Debug\mdi.obj"
	-@erase ".\Debug\mdi.ilk"
	-@erase ".\Debug\mdi.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Zi /I "Debug/" /c /nologo
# ADD F90 /Zi /I "Debug/" /c /nologo
F90_PROJ=/Zi /I "Debug/" /c /nologo /Fo"Debug/" /Fd"Debug/mdi.pdb" 
F90_OBJS=.\Debug/
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS"\
 /Fp"$(INTDIR)/mdi.pch" /YX /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c 
CPP_OBJS=.\Debug/
CPP_SBRS=
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /win32
MTL_PROJ=/nologo /D "_DEBUG" /win32 
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
RSC_PROJ=/l 0x409 /fo"$(INTDIR)/mdi.res" /d "_DEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/mdi.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:windows /incremental:yes\
 /pdb:"$(OUTDIR)/mdi.pdb" /debug /machine:I386 /out:"$(OUTDIR)/mdi.exe" 
LINK32_OBJS= \
	"$(INTDIR)/mdiinc.obj" \
	"$(INTDIR)/mdic.obj" \
	"$(INTDIR)/mdib.obj" \
	"$(INTDIR)/mdia.obj" \
	"$(INTDIR)/mdi.obj" \
	"$(INTDIR)/mdi.res"

"$(OUTDIR)\mdi.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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

# Name "mdi - Win32 Release"
# Name "mdi - Win32 Debug"

!IF  "$(CFG)" == "mdi - Win32 Release"

!ELSEIF  "$(CFG)" == "mdi - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\mditypes.h

!IF  "$(CFG)" == "mdi - Win32 Release"

!ELSEIF  "$(CFG)" == "mdi - Win32 Debug"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\mdiinc.f90
DEP_F90_MDIIN=\
	{$(INCLUDE)}"\msfwin.mod"\
	

!IF  "$(CFG)" == "mdi - Win32 Release"

F90_MODOUT=\
	"mdiinc"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\mdiinc.obj" : $(SOURCE) $(DEP_F90_MDIIN) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\mdiinc.mod" : $(SOURCE) $(DEP_F90_MDIIN) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "mdi - Win32 Debug"

F90_MODOUT=\
	"mdiinc"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\mdiinc.obj" : $(SOURCE) $(DEP_F90_MDIIN) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\mdiinc.mod" : $(SOURCE) $(DEP_F90_MDIIN) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\mdic.f90

!IF  "$(CFG)" == "mdi - Win32 Release"

NODEP_F90_MDIC_=\
	".\Release\mdiinc.mod"\
	

"$(INTDIR)\mdic.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\mdiinc.mod"


!ELSEIF  "$(CFG)" == "mdi - Win32 Debug"

NODEP_F90_MDIC_=\
	".\Debug\mdiinc.mod"\
	

"$(INTDIR)\mdic.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\mdiinc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\mdib.f90

!IF  "$(CFG)" == "mdi - Win32 Release"

NODEP_F90_MDIB_=\
	".\Release\mdiinc.mod"\
	

"$(INTDIR)\mdib.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\mdiinc.mod"


!ELSEIF  "$(CFG)" == "mdi - Win32 Debug"

NODEP_F90_MDIB_=\
	".\Debug\mdiinc.mod"\
	

"$(INTDIR)\mdib.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\mdiinc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\mdia.f90

!IF  "$(CFG)" == "mdi - Win32 Release"

DEP_F90_MDIA_=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_MDIA_=\
	".\Release\mdiinc.mod"\
	

"$(INTDIR)\mdia.obj" : $(SOURCE) $(DEP_F90_MDIA_) "$(INTDIR)"\
 "$(INTDIR)\mdiinc.mod"


!ELSEIF  "$(CFG)" == "mdi - Win32 Debug"

DEP_F90_MDIA_=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_MDIA_=\
	".\Debug\mdiinc.mod"\
	

"$(INTDIR)\mdia.obj" : $(SOURCE) $(DEP_F90_MDIA_) "$(INTDIR)"\
 "$(INTDIR)\mdiinc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\mdi.rc
DEP_RSC_MDI_R=\
	".\mdi.h"\
	

"$(INTDIR)\mdi.res" : $(SOURCE) $(DEP_RSC_MDI_R) "$(INTDIR)"
   $(RSC) $(RSC_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE=.\mdi.h

!IF  "$(CFG)" == "mdi - Win32 Release"

!ELSEIF  "$(CFG)" == "mdi - Win32 Debug"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\mdi.f90

!IF  "$(CFG)" == "mdi - Win32 Release"

NODEP_F90_MDI_F=\
	".\Release\mdiinc.mod"\
	

"$(INTDIR)\mdi.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\mdiinc.mod"


!ELSEIF  "$(CFG)" == "mdi - Win32 Debug"

NODEP_F90_MDI_F=\
	".\Debug\mdiinc.mod"\
	

"$(INTDIR)\mdi.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\mdiinc.mod"


!ENDIF 

# End Source File
# End Target
# End Project
################################################################################
