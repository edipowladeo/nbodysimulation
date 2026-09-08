# Microsoft Developer Studio Generated NMAKE File, Format Version 40001
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Console Application" 0x0103

!IF "$(CFG)" == ""
CFG=bounce - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to bounce - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "bounce - Win32 Release" && "$(CFG)" != "bounce - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "bounce.mak" CFG="bounce - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "bounce - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "bounce - Win32 Debug" (based on "Win32 (x86) Console Application")
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
# PROP Target_Last_Scanned "bounce - Win32 Debug"
F90=fl32.exe
RSC=rc.exe

!IF  "$(CFG)" == "bounce - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Target_Dir ""
OUTDIR=.\Release
INTDIR=.\Release

ALL : "$(OUTDIR)\bounce.exe"

CLEAN : 
	-@erase ".\Release\bounce.exe"
	-@erase ".\Release\bouncein.obj"
	-@erase ".\Release\bounce.obj"
	-@erase ".\Release\bouncein.mod"
	-@erase ".\Release\b4.obj"
	-@erase ".\Release\b3.obj"
	-@erase ".\Release\b2.obj"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Ox /I "Release/" /c /nologo
# ADD F90 /Ox /4Ya /I "Release/" /c /nologo
F90_PROJ=/Ox /4Ya /I "Release/" /c /nologo /Fo"Release/" 
F90_OBJS=.\Release/
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/bounce.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:console /machine:I386
LINK32_FLAGS=kernel32.lib /nologo /subsystem:console /incremental:no\
 /pdb:"$(OUTDIR)/bounce.pdb" /machine:I386 /out:"$(OUTDIR)/bounce.exe" 
LINK32_OBJS= \
	"$(INTDIR)/bouncein.obj" \
	"$(INTDIR)/bounce.obj" \
	"$(INTDIR)/b4.obj" \
	"$(INTDIR)/b3.obj" \
	"$(INTDIR)/b2.obj"

"$(OUTDIR)\bounce.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "bounce - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug"
# PROP Intermediate_Dir "Debug"
# PROP Target_Dir ""
OUTDIR=.\Debug
INTDIR=.\Debug

ALL : "$(OUTDIR)\bounce.exe"

CLEAN : 
	-@erase ".\Debug\bounce.exe"
	-@erase ".\Debug\bouncein.obj"
	-@erase ".\Debug\bounce.obj"
	-@erase ".\Debug\bouncein.mod"
	-@erase ".\Debug\b4.obj"
	-@erase ".\Debug\b3.obj"
	-@erase ".\Debug\b2.obj"
	-@erase ".\Debug\bounce.ilk"
	-@erase ".\Debug\bounce.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Zi /I "Debug/" /c /nologo
# ADD F90 /4Ya /Zi /I "Debug/" /c /nologo
F90_PROJ=/4Ya /Zi /I "Debug/" /c /nologo /Fo"Debug/" /Fd"Debug/bounce.pdb" 
F90_OBJS=.\Debug/
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/bounce.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:console /debug /machine:I386
LINK32_FLAGS=kernel32.lib /nologo /subsystem:console /incremental:yes\
 /pdb:"$(OUTDIR)/bounce.pdb" /debug /machine:I386 /out:"$(OUTDIR)/bounce.exe" 
LINK32_OBJS= \
	"$(INTDIR)/bouncein.obj" \
	"$(INTDIR)/bounce.obj" \
	"$(INTDIR)/b4.obj" \
	"$(INTDIR)/b3.obj" \
	"$(INTDIR)/b2.obj"

"$(OUTDIR)\bounce.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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

# Name "bounce - Win32 Release"
# Name "bounce - Win32 Debug"

!IF  "$(CFG)" == "bounce - Win32 Release"

!ELSEIF  "$(CFG)" == "bounce - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\bouncein.f90

!IF  "$(CFG)" == "bounce - Win32 Release"

F90_MODOUT=\
	"bouncein"


"$(INTDIR)\bouncein.obj" : $(SOURCE) "$(INTDIR)"
   $(F90) $(F90_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "bounce - Win32 Debug"

F90_MODOUT=\
	"bouncein"


"$(INTDIR)\bouncein.obj" : $(SOURCE) "$(INTDIR)"
   $(F90) $(F90_PROJ) $(SOURCE)


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\bounce.f90

!IF  "$(CFG)" == "bounce - Win32 Release"

DEP_F90_BOUNC=\
	".\bounce.fi"\
	
NODEP_F90_BOUNC=\
	".\Release\bouncein.mod"\
	

"$(INTDIR)\bounce.obj" : $(SOURCE) $(DEP_F90_BOUNC) "$(INTDIR)"\
 "$(INTDIR)\bouncein.mod"


!ELSEIF  "$(CFG)" == "bounce - Win32 Debug"

DEP_F90_BOUNC=\
	".\bounce.fi"\
	
NODEP_F90_BOUNC=\
	".\Debug\bouncein.mod"\
	

"$(INTDIR)\bounce.obj" : $(SOURCE) $(DEP_F90_BOUNC) "$(INTDIR)"\
 "$(INTDIR)\bouncein.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\b4.f90

!IF  "$(CFG)" == "bounce - Win32 Release"

NODEP_F90_B4_F9=\
	".\Release\bouncein.mod"\
	

"$(INTDIR)\b4.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\bouncein.mod"


!ELSEIF  "$(CFG)" == "bounce - Win32 Debug"

NODEP_F90_B4_F9=\
	".\Debug\bouncein.mod"\
	

"$(INTDIR)\b4.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\bouncein.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\b3.f90

!IF  "$(CFG)" == "bounce - Win32 Release"

NODEP_F90_B3_F9=\
	".\Release\bouncein.mod"\
	

"$(INTDIR)\b3.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\bouncein.mod"


!ELSEIF  "$(CFG)" == "bounce - Win32 Debug"

NODEP_F90_B3_F9=\
	".\Debug\bouncein.mod"\
	

"$(INTDIR)\b3.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\bouncein.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\b2.f90

!IF  "$(CFG)" == "bounce - Win32 Release"

NODEP_F90_B2_F9=\
	".\Release\bouncein.mod"\
	

"$(INTDIR)\b2.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\bouncein.mod"


!ELSEIF  "$(CFG)" == "bounce - Win32 Debug"

NODEP_F90_B2_F9=\
	".\Debug\bouncein.mod"\
	

"$(INTDIR)\b2.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\bouncein.mod"


!ENDIF 

# End Source File
# End Target
# End Project
################################################################################
