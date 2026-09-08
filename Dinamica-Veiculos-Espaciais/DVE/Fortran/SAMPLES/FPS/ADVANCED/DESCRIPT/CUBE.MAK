# Microsoft Visual C++ Generated NMAKE File, Format Version 40000
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) QuickWin Application" 0x0107

!IF "$(CFG)" == ""
CFG=cube - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to cube - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "cube - Win32 Release" && "$(CFG)" != "cube - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "cube.mak" CFG="cube - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "cube - Win32 Release" (based on "Win32 (x86) QuickWin Application")
!MESSAGE "cube - Win32 Debug" (based on "Win32 (x86) QuickWin Application")
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

!IF  "$(CFG)" == "cube - Win32 Release"

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

ALL : "$(OUTDIR)\cube.exe" "$(OUTDIR)\BitmapTypes.mod"

CLEAN : 
	-@erase ".\Release\cube.exe"
	-@erase ".\Release\DESCRIPT.OBJ"
	-@erase ".\Release\cube.obj"
	-@erase ".\Release\bitmapdraw.mod"
	-@erase ".\Release\Descript.mod"
	-@erase ".\Release\bitmap.obj"
	-@erase ".\Release\BitmapTypes.mod"

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)/cube.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386 /nodefaultlib:"console.lib"
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386 /nodefaultlib:"console.lib"
LINK32_FLAGS=kernel32.lib /nologo /subsystem:windows /incremental:no\
 /pdb:"$(OUTDIR)/cube.pdb" /machine:I386 /nodefaultlib:"console.lib"\
 /out:"$(OUTDIR)/cube.exe" 
LINK32_OBJS= \
	"$(INTDIR)/DESCRIPT.OBJ" \
	"$(INTDIR)/cube.obj" \
	"$(INTDIR)/bitmap.obj"

"$(OUTDIR)\cube.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "cube - Win32 Debug"

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

ALL : "$(OUTDIR)\cube.exe" "$(OUTDIR)\BitmapTypes.mod"

CLEAN : 
	-@erase ".\Debug\cube.exe"
	-@erase ".\Debug\DESCRIPT.OBJ"
	-@erase ".\Debug\cube.obj"
	-@erase ".\Debug\bitmapdraw.mod"
	-@erase ".\Debug\Descript.mod"
	-@erase ".\Debug\bitmap.obj"
	-@erase ".\Debug\cube.ilk"
	-@erase ".\Debug\cube.pdb"
	-@erase ".\Debug\BitmapTypes.mod"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Zi /I "Debug/" /c /nologo /MW
# ADD F90 /Zi /I "Debug/" /c /nologo /MW
F90_PROJ=/Zi /I "Debug/" /c /nologo /MW /Fo"Debug/"\
 /Fd"Debug/cube.pdb" 
F90_OBJS=.\Debug/
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /win32
MTL_PROJ=/nologo /D "_DEBUG" /win32 
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/cube.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386 /nodefaultlib:"console.lib"
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386 /nodefaultlib:"console.lib"
LINK32_FLAGS=kernel32.lib /nologo /subsystem:windows /incremental:yes\
 /pdb:"$(OUTDIR)/cube.pdb" /debug /machine:I386 /nodefaultlib:"console.lib"\
 /out:"$(OUTDIR)/cube.exe" 
LINK32_OBJS= \
	"$(INTDIR)/DESCRIPT.OBJ" \
	"$(INTDIR)/cube.obj" \
	"$(INTDIR)/bitmap.obj"

"$(OUTDIR)\cube.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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

# Name "cube - Win32 Release"
# Name "cube - Win32 Debug"

!IF  "$(CFG)" == "cube - Win32 Release"

!ELSEIF  "$(CFG)" == "cube - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\DESCRIPT.F90

!IF  "$(CFG)" == "cube - Win32 Release"

F90_MODOUT=\
	"descript"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\DESCRIPT.OBJ" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\descript.mod" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "cube - Win32 Debug"

F90_MODOUT=\
	"descript"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\DESCRIPT.OBJ" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\descript.mod" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\cube.f90

!IF  "$(CFG)" == "cube - Win32 Release"

DEP_F90_CUBE_=\
	{$(INCLUDE)}"\msflib.mod"\
	
NODEP_F90_CUBE_=\
	".\Release\bitmapdraw.mod"\
	

"$(INTDIR)\cube.obj" : $(SOURCE) $(DEP_F90_CUBE_) "$(INTDIR)"\
 "$(INTDIR)\bitmapdraw.mod"


!ELSEIF  "$(CFG)" == "cube - Win32 Debug"

DEP_F90_CUBE_=\
	{$(INCLUDE)}"\msflib.mod"\
	
NODEP_F90_CUBE_=\
	".\Debug\bitmapdraw.mod"\
	

"$(INTDIR)\cube.obj" : $(SOURCE) $(DEP_F90_CUBE_) "$(INTDIR)"\
 "$(INTDIR)\bitmapdraw.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\bitmap.f90

!IF  "$(CFG)" == "cube - Win32 Release"

NODEP_F90_BITMA=\
	".\Release\Descript.mod"\
	
F90_MODOUT=\
	"BitmapTypes" \
	"BitmapDraw"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\bitmap.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\descript.mod"
   $(BuildCmds)

"$(INTDIR)\BitmapTypes.mod" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\descript.mod"
   $(BuildCmds)

"$(INTDIR)\bitmapdraw.mod" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\descript.mod"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "cube - Win32 Debug"

NODEP_F90_BITMA=\
	".\Debug\Descript.mod"\
	
F90_MODOUT=\
	"BitmapTypes" \
	"BitmapDraw"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\bitmap.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\descript.mod"
   $(BuildCmds)

"$(INTDIR)\BitmapTypes.mod" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\descript.mod"
   $(BuildCmds)

"$(INTDIR)\bitmapdraw.mod" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\descript.mod"
   $(BuildCmds)

!ENDIF 

# End Source File
# End Target
# End Project
################################################################################
