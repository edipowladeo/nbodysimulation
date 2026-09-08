# Microsoft Visual C++ Generated NMAKE File, Format Version 40000
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Console Application" 0x0103

!IF "$(CFG)" == ""
CFG=olympic - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to olympic - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "olympic - Win32 Release" && "$(CFG)" !=\
 "olympic - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "olympic.mak" CFG="olympic - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "olympic - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "olympic - Win32 Debug" (based on "Win32 (x86) Console Application")
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

!IF  "$(CFG)" == "olympic - Win32 Release"

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

ALL : "$(OUTDIR)\olympic.exe"

CLEAN : 
	-@erase ".\Release\olympic.exe"
	-@erase ".\Release\tolympic.obj"
	-@erase ".\Release\olympinc.mod"
	-@erase ".\Release\tolympe.obj"
	-@erase ".\Release\tolympd.obj"
	-@erase ".\Release\tolympc.obj"
	-@erase ".\Release\tolympb.obj"
	-@erase ".\Release\tolympa.obj"
	-@erase ".\Release\olympinc.obj"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Ox /I "Release/" /c /nologo
# ADD F90 /Ox /I "Release/" /c /nologo
F90_PROJ=/Ox /I "Release/" /c /nologo /Fo"Release/" 
F90_OBJS=.\Release/
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /YX /c
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE"\
 /Fp"$(INTDIR)/olympic.pch" /YX /Fo"$(INTDIR)/" /c 
CPP_OBJS=.\Release/
CPP_SBRS=
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/olympic.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:console /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:console /incremental:no\
 /pdb:"$(OUTDIR)/olympic.pdb" /machine:I386 /out:"$(OUTDIR)/olympic.exe" 
LINK32_OBJS= \
	"$(INTDIR)/tolympic.obj" \
	"$(INTDIR)/tolympe.obj" \
	"$(INTDIR)/tolympd.obj" \
	"$(INTDIR)/tolympc.obj" \
	"$(INTDIR)/tolympb.obj" \
	"$(INTDIR)/tolympa.obj" \
	"$(INTDIR)/olympinc.obj"

"$(OUTDIR)\olympic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "olympic - Win32 Debug"

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

ALL : "$(OUTDIR)\olympic.exe"

CLEAN : 
	-@erase ".\Debug\olympic.exe"
	-@erase ".\Debug\tolympic.obj"
	-@erase ".\Debug\olympinc.mod"
	-@erase ".\Debug\tolympe.obj"
	-@erase ".\Debug\tolympd.obj"
	-@erase ".\Debug\tolympc.obj"
	-@erase ".\Debug\tolympb.obj"
	-@erase ".\Debug\tolympa.obj"
	-@erase ".\Debug\olympinc.obj"
	-@erase ".\Debug\olympic.ilk"
	-@erase ".\Debug\olympic.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Zi /I "Debug/" /c /nologo
# ADD F90 /Zi /I "Debug/" /c /nologo
F90_PROJ=/Zi /I "Debug/" /c /nologo /Fo"Debug/" /Fd"Debug/olympic.pdb" 
F90_OBJS=.\Debug/
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /YX /c
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE"\
 /Fp"$(INTDIR)/olympic.pch" /YX /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c 
CPP_OBJS=.\Debug/
CPP_SBRS=
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/olympic.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:console /debug /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:console /incremental:yes\
 /pdb:"$(OUTDIR)/olympic.pdb" /debug /machine:I386 /out:"$(OUTDIR)/olympic.exe" 
LINK32_OBJS= \
	"$(INTDIR)/tolympic.obj" \
	"$(INTDIR)/tolympe.obj" \
	"$(INTDIR)/tolympd.obj" \
	"$(INTDIR)/tolympc.obj" \
	"$(INTDIR)/tolympb.obj" \
	"$(INTDIR)/tolympa.obj" \
	"$(INTDIR)/olympinc.obj"

"$(OUTDIR)\olympic.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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

# Name "olympic - Win32 Release"
# Name "olympic - Win32 Debug"

!IF  "$(CFG)" == "olympic - Win32 Release"

!ELSEIF  "$(CFG)" == "olympic - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\tolympic.f90

!IF  "$(CFG)" == "olympic - Win32 Release"

DEP_F90_TOLYM=\
	{$(INCLUDE)}"\opengl.mod"\
	
NODEP_F90_TOLYM=\
	".\Release\olympinc.mod"\
	

"$(INTDIR)\tolympic.obj" : $(SOURCE) $(DEP_F90_TOLYM) "$(INTDIR)"\
 "$(INTDIR)\olympinc.mod"


!ELSEIF  "$(CFG)" == "olympic - Win32 Debug"

DEP_F90_TOLYM=\
	{$(INCLUDE)}"\opengl.mod"\
	
NODEP_F90_TOLYM=\
	".\Debug\olympinc.mod"\
	

"$(INTDIR)\tolympic.obj" : $(SOURCE) $(DEP_F90_TOLYM) "$(INTDIR)"\
 "$(INTDIR)\olympinc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\tolympe.f90

!IF  "$(CFG)" == "olympic - Win32 Release"

DEP_F90_TOLYMP=\
	{$(INCLUDE)}"\opengl.mod"\
	
NODEP_F90_TOLYMP=\
	".\Release\olympinc.mod"\
	

"$(INTDIR)\tolympe.obj" : $(SOURCE) $(DEP_F90_TOLYMP) "$(INTDIR)"\
 "$(INTDIR)\olympinc.mod"


!ELSEIF  "$(CFG)" == "olympic - Win32 Debug"

DEP_F90_TOLYMP=\
	{$(INCLUDE)}"\opengl.mod"\
	
NODEP_F90_TOLYMP=\
	".\Debug\olympinc.mod"\
	

"$(INTDIR)\tolympe.obj" : $(SOURCE) $(DEP_F90_TOLYMP) "$(INTDIR)"\
 "$(INTDIR)\olympinc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\tolympd.f90
DEP_F90_TOLYMPD=\
	{$(INCLUDE)}"\opengl.mod"\
	

"$(INTDIR)\tolympd.obj" : $(SOURCE) $(DEP_F90_TOLYMPD) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\tolympc.f90

!IF  "$(CFG)" == "olympic - Win32 Release"

DEP_F90_TOLYMPC=\
	{$(INCLUDE)}"\opengl.mod"\
	
NODEP_F90_TOLYMPC=\
	".\Release\olympinc.mod"\
	

"$(INTDIR)\tolympc.obj" : $(SOURCE) $(DEP_F90_TOLYMPC) "$(INTDIR)"\
 "$(INTDIR)\olympinc.mod"


!ELSEIF  "$(CFG)" == "olympic - Win32 Debug"

DEP_F90_TOLYMPC=\
	{$(INCLUDE)}"\opengl.mod"\
	
NODEP_F90_TOLYMPC=\
	".\Debug\olympinc.mod"\
	

"$(INTDIR)\tolympc.obj" : $(SOURCE) $(DEP_F90_TOLYMPC) "$(INTDIR)"\
 "$(INTDIR)\olympinc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\tolympb.f90

!IF  "$(CFG)" == "olympic - Win32 Release"

DEP_F90_TOLYMPB=\
	{$(INCLUDE)}"\opengl.mod"\
	
NODEP_F90_TOLYMPB=\
	".\Release\olympinc.mod"\
	

"$(INTDIR)\tolympb.obj" : $(SOURCE) $(DEP_F90_TOLYMPB) "$(INTDIR)"\
 "$(INTDIR)\olympinc.mod"


!ELSEIF  "$(CFG)" == "olympic - Win32 Debug"

DEP_F90_TOLYMPB=\
	{$(INCLUDE)}"\opengl.mod"\
	
NODEP_F90_TOLYMPB=\
	".\Debug\olympinc.mod"\
	

"$(INTDIR)\tolympb.obj" : $(SOURCE) $(DEP_F90_TOLYMPB) "$(INTDIR)"\
 "$(INTDIR)\olympinc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\tolympa.f90
DEP_F90_TOLYMPA=\
	{$(INCLUDE)}"\opengl.mod"\
	

"$(INTDIR)\tolympa.obj" : $(SOURCE) $(DEP_F90_TOLYMPA) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\olympinc.f90

!IF  "$(CFG)" == "olympic - Win32 Release"

F90_MODOUT=\
	"olympinc"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\olympinc.obj" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\olympinc.mod" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "olympic - Win32 Debug"

F90_MODOUT=\
	"olympinc"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\olympinc.obj" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\olympinc.mod" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
# End Target
# End Project
################################################################################
