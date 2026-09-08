# Microsoft Visual C++ Generated NMAKE File, Format Version 40000
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Static Library" 0x0104

!IF "$(CFG)" == ""
CFG=scigraph - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to scigraph - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "scigraph - Win32 Release" && "$(CFG)" !=\
 "scigraph - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "scigraph.mak" CFG="scigraph - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "scigraph - Win32 Release" (based on "Win32 (x86) Static Library")
!MESSAGE "scigraph - Win32 Debug" (based on "Win32 (x86) Static Library")
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

!IF  "$(CFG)" == "scigraph - Win32 Release"

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

ALL : "$(OUTDIR)\scigraph.lib" "$(OUTDIR)\SCIGRAPH.MOD"

CLEAN : 
	-@erase ".\Release\scigraph.lib"
	-@erase ".\Release\sgplot.obj"
	-@erase ".\Release\SGDRAW.mod"
	-@erase ".\Release\SGLOWLVL.mod"
	-@erase ".\Release\SGDATA.mod"
	-@erase ".\Release\sglowlvl.obj"
	-@erase ".\Release\sgdraw.obj"
	-@erase ".\Release\sgdata.obj"
	-@erase ".\Release\sgadmin.obj"
	-@erase ".\Release\scigraph.obj"
	-@erase ".\Release\SGADMIN.mod"
	-@erase ".\Release\SGPLOT.mod"
	-@erase ".\Release\SCIGRAPH.MOD"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Ox /I "Release/" /c /nologo
# ADD F90 /Ox /I "Release/" /c /nologo /MT
F90_PROJ=/Ox /I "Release/" /c /nologo /MT /Fo"Release/" 
F90_OBJS=.\Release/
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/scigraph.bsc" 
BSC32_SBRS=
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo
LIB32_FLAGS=/nologo /out:"$(OUTDIR)/scigraph.lib" 
LIB32_OBJS= \
	"$(INTDIR)/sgplot.obj" \
	"$(INTDIR)/sglowlvl.obj" \
	"$(INTDIR)/sgdraw.obj" \
	"$(INTDIR)/sgdata.obj" \
	"$(INTDIR)/sgadmin.obj" \
	"$(INTDIR)/scigraph.obj"

"$(OUTDIR)\scigraph.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ELSEIF  "$(CFG)" == "scigraph - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir debug
# PROP BASE Intermediate_Dir debug
# PROP BASE Target_Dir
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir debug
# PROP Intermediate_Dir debug
# PROP Target_Dir
OUTDIR=.\debug
INTDIR=.\debug

ALL : "$(OUTDIR)\scigraph.lib" "$(OUTDIR)\SCIGRAPH.MOD"

CLEAN : 
	-@erase ".\debug\scigraph.lib"
	-@erase ".\debug\sgplot.obj"
	-@erase ".\debug\SGDRAW.mod"
	-@erase ".\debug\SGLOWLVL.mod"
	-@erase ".\debug\SGDATA.mod"
	-@erase ".\debug\sglowlvl.obj"
	-@erase ".\debug\sgdraw.obj"
	-@erase ".\debug\sgdata.obj"
	-@erase ".\debug\sgadmin.obj"
	-@erase ".\debug\scigraph.obj"
	-@erase ".\debug\SGADMIN.mod"
	-@erase ".\debug\SGPLOT.mod"
	-@erase ".\debug\SCIGRAPH.MOD"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Z7 /I "debug/" /c /nologo
# ADD F90 /Z7 /I "debug/" /c /nologo /MT
F90_PROJ=/Z7 /I "debug/" /c /nologo /MT /Fo"debug/" 
F90_OBJS=.\debug/
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/scigraph.bsc" 
BSC32_SBRS=
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo
# ADD LIB32 /nologo
LIB32_FLAGS=/nologo /out:"$(OUTDIR)/scigraph.lib" 
LIB32_OBJS= \
	"$(INTDIR)/sgplot.obj" \
	"$(INTDIR)/sglowlvl.obj" \
	"$(INTDIR)/sgdraw.obj" \
	"$(INTDIR)/sgdata.obj" \
	"$(INTDIR)/sgadmin.obj" \
	"$(INTDIR)/scigraph.obj"

"$(OUTDIR)\scigraph.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
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

# Name "scigraph - Win32 Release"
# Name "scigraph - Win32 Debug"

!IF  "$(CFG)" == "scigraph - Win32 Release"

!ELSEIF  "$(CFG)" == "scigraph - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\sgplot.f90

!IF  "$(CFG)" == "scigraph - Win32 Release"

NODEP_F90_SGPLO=\
	".\Release\SGDRAW.mod"\
	
F90_MODOUT=\
	"SGPLOT"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\sgplot.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\SGDRAW.mod"
   $(BuildCmds)

"$(INTDIR)\SGPLOT.MOD" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\SGDRAW.mod"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "scigraph - Win32 Debug"

NODEP_F90_SGPLO=\
	".\debug\SGDRAW.mod"\
	
F90_MODOUT=\
	"SGPLOT"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\sgplot.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\SGDRAW.mod"
   $(BuildCmds)

"$(INTDIR)\SGPLOT.MOD" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\SGDRAW.mod"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\sglowlvl.f90

!IF  "$(CFG)" == "scigraph - Win32 Release"

DEP_F90_SGLOW=\
	{$(INCLUDE)}"\MSFLIB.MOD"\
	
NODEP_F90_SGLOW=\
	".\Release\SGDATA.mod"\
	
F90_MODOUT=\
	"SGLOWLVL"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\sglowlvl.obj" : $(SOURCE) $(DEP_F90_SGLOW) "$(INTDIR)"\
 "$(INTDIR)\SGDATA.mod"
   $(BuildCmds)

"$(INTDIR)\SGLOWLVL.MOD" : $(SOURCE) $(DEP_F90_SGLOW) "$(INTDIR)"\
 "$(INTDIR)\SGDATA.mod"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "scigraph - Win32 Debug"

DEP_F90_SGLOW=\
	{$(INCLUDE)}"\MSFLIB.MOD"\
	
NODEP_F90_SGLOW=\
	".\debug\SGDATA.mod"\
	
F90_MODOUT=\
	"SGLOWLVL"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\sglowlvl.obj" : $(SOURCE) $(DEP_F90_SGLOW) "$(INTDIR)"\
 "$(INTDIR)\SGDATA.mod"
   $(BuildCmds)

"$(INTDIR)\SGLOWLVL.MOD" : $(SOURCE) $(DEP_F90_SGLOW) "$(INTDIR)"\
 "$(INTDIR)\SGDATA.mod"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\sgdraw.f90

!IF  "$(CFG)" == "scigraph - Win32 Release"

NODEP_F90_SGDRA=\
	".\Release\SGLOWLVL.mod"\
	
F90_MODOUT=\
	"SGDRAW"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\sgdraw.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\SGLOWLVL.MOD"
   $(BuildCmds)

"$(INTDIR)\SGDRAW.mod" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\SGLOWLVL.MOD"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "scigraph - Win32 Debug"

NODEP_F90_SGDRA=\
	".\debug\SGLOWLVL.mod"\
	
F90_MODOUT=\
	"SGDRAW"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\sgdraw.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\SGLOWLVL.MOD"
   $(BuildCmds)

"$(INTDIR)\SGDRAW.mod" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\SGLOWLVL.MOD"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\sgdata.f90

!IF  "$(CFG)" == "scigraph - Win32 Release"

F90_MODOUT=\
	"SGDATA"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\sgdata.obj" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\SGDATA.mod" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "scigraph - Win32 Debug"

F90_MODOUT=\
	"SGDATA"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\sgdata.obj" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\SGDATA.mod" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\sgadmin.f90

!IF  "$(CFG)" == "scigraph - Win32 Release"

NODEP_F90_SGADM=\
	".\Release\SGDRAW.mod"\
	
F90_MODOUT=\
	"SGADMIN"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\sgadmin.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\SGDRAW.mod"
   $(BuildCmds)

"$(INTDIR)\SGADMIN.MOD" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\SGDRAW.mod"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "scigraph - Win32 Debug"

NODEP_F90_SGADM=\
	".\debug\SGDRAW.mod"\
	
F90_MODOUT=\
	"SGADMIN"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\sgadmin.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\SGDRAW.mod"
   $(BuildCmds)

"$(INTDIR)\SGADMIN.MOD" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\SGDRAW.mod"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\scigraph.f90

!IF  "$(CFG)" == "scigraph - Win32 Release"

NODEP_F90_SCIGR=\
	".\Release\SGADMIN.mod"\
	".\Release\SGPLOT.mod"\
	
F90_MODOUT=\
	"SCIGRAPH"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\scigraph.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\SGADMIN.MOD"\
 "$(INTDIR)\SGPLOT.MOD"
   $(BuildCmds)

"$(INTDIR)\SCIGRAPH.MOD" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\SGADMIN.MOD"\
 "$(INTDIR)\SGPLOT.MOD"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "scigraph - Win32 Debug"

NODEP_F90_SCIGR=\
	".\debug\SGADMIN.mod"\
	".\debug\SGPLOT.mod"\
	
F90_MODOUT=\
	"SCIGRAPH"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\scigraph.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\SGADMIN.MOD"\
 "$(INTDIR)\SGPLOT.MOD"
   $(BuildCmds)

"$(INTDIR)\SCIGRAPH.MOD" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\SGADMIN.MOD"\
 "$(INTDIR)\SGPLOT.MOD"
   $(BuildCmds)

!ENDIF 

# End Source File
# End Target
# End Project
################################################################################
