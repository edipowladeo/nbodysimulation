# Microsoft Visual C++ Generated NMAKE File, Format Version 40000
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Console Application" 0x0103

!IF "$(CFG)" == ""
CFG=check_sd - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to check_sd - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "check_sd - Win32 Release" && "$(CFG)" !=\
 "check_sd - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "check_sd.mak" CFG="check_sd - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "check_sd - Win32 Release" (based on\
 "Win32 (x86) Console Application")
!MESSAGE "check_sd - Win32 Debug" (based on "Win32 (x86) Console Application")
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
RSC=rc.exe
F90=fl32.exe

!IF  "$(CFG)" == "check_sd - Win32 Release"

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

ALL : "$(OUTDIR)\check_sd.exe"

CLEAN : 
	-@erase ".\Release\check_sd.exe"
	-@erase ".\Release\CHKSDINC.OBJ"
	-@erase ".\Release\CHEK_SDE.OBJ"
	-@erase ".\Release\CHEK_SDD.OBJ"
	-@erase ".\Release\chksdinc.mod"
	-@erase ".\Release\CHEK_SDC.OBJ"
	-@erase ".\Release\CHEK_SDB.OBJ"
	-@erase ".\Release\CHEK_SDA.OBJ"
	-@erase ".\Release\CHECK_SD.OBJ"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Ox /I "Release/" /c /nologo
# ADD F90 /Ox /I "Release/" /c /nologo
F90_PROJ=/Ox /I "Release/" /c /nologo /Fo"Release/" 
F90_OBJS=.\Release/
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /YX /c
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE"\
 /Fp"$(INTDIR)/check_sd.pch" /YX /Fo"$(INTDIR)/" /c 
CPP_OBJS=.\Release/
CPP_SBRS=
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/check_sd.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:console /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:console /incremental:no\
 /pdb:"$(OUTDIR)/check_sd.pdb" /machine:I386 /out:"$(OUTDIR)/check_sd.exe" 
LINK32_OBJS= \
	"$(INTDIR)/CHKSDINC.OBJ" \
	"$(INTDIR)/CHEK_SDE.OBJ" \
	"$(INTDIR)/CHEK_SDD.OBJ" \
	"$(INTDIR)/CHEK_SDC.OBJ" \
	"$(INTDIR)/CHEK_SDB.OBJ" \
	"$(INTDIR)/CHEK_SDA.OBJ" \
	"$(INTDIR)/CHECK_SD.OBJ"

"$(OUTDIR)\check_sd.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "check_sd - Win32 Debug"

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

ALL : "$(OUTDIR)\check_sd.exe"

CLEAN : 
	-@erase ".\Debug\check_sd.exe"
	-@erase ".\Debug\CHKSDINC.OBJ"
	-@erase ".\Debug\CHEK_SDE.OBJ"
	-@erase ".\Debug\CHEK_SDD.OBJ"
	-@erase ".\Debug\chksdinc.mod"
	-@erase ".\Debug\CHEK_SDC.OBJ"
	-@erase ".\Debug\CHEK_SDB.OBJ"
	-@erase ".\Debug\CHEK_SDA.OBJ"
	-@erase ".\Debug\CHECK_SD.OBJ"
	-@erase ".\Debug\check_sd.ilk"
	-@erase ".\Debug\check_sd.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Zi /I "Debug/" /c /nologo
# ADD F90 /Zi /I "Debug/" /c /nologo
F90_PROJ=/Zi /I "Debug/" /c /nologo /Fo"Debug/" /Fd"Debug/check_sd.pdb" 
F90_OBJS=.\Debug/
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /YX /c
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE"\
 /Fp"$(INTDIR)/check_sd.pch" /YX /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c 
CPP_OBJS=.\Debug/
CPP_SBRS=
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/check_sd.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:console /debug /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:console /incremental:yes\
 /pdb:"$(OUTDIR)/check_sd.pdb" /debug /machine:I386\
 /out:"$(OUTDIR)/check_sd.exe" 
LINK32_OBJS= \
	"$(INTDIR)/CHKSDINC.OBJ" \
	"$(INTDIR)/CHEK_SDE.OBJ" \
	"$(INTDIR)/CHEK_SDD.OBJ" \
	"$(INTDIR)/CHEK_SDC.OBJ" \
	"$(INTDIR)/CHEK_SDB.OBJ" \
	"$(INTDIR)/CHEK_SDA.OBJ" \
	"$(INTDIR)/CHECK_SD.OBJ"

"$(OUTDIR)\check_sd.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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

# Name "check_sd - Win32 Release"
# Name "check_sd - Win32 Debug"

!IF  "$(CFG)" == "check_sd - Win32 Release"

!ELSEIF  "$(CFG)" == "check_sd - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\CHKSDINC.F90
DEP_F90_CHKSD=\
	{$(INCLUDE)}"\msfwin.mod"\
	

!IF  "$(CFG)" == "check_sd - Win32 Release"

F90_MODOUT=\
	"chksdinc"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\CHKSDINC.OBJ" : $(SOURCE) $(DEP_F90_CHKSD) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\chksdinc.mod" : $(SOURCE) $(DEP_F90_CHKSD) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "check_sd - Win32 Debug"

F90_MODOUT=\
	"chksdinc"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\CHKSDINC.OBJ" : $(SOURCE) $(DEP_F90_CHKSD) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\chksdinc.mod" : $(SOURCE) $(DEP_F90_CHKSD) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\CHEK_SDE.F90
DEP_F90_CHEK_=\
	{$(INCLUDE)}"\msfwin.mod"\
	

"$(INTDIR)\CHEK_SDE.OBJ" : $(SOURCE) $(DEP_F90_CHEK_) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\CHEK_SDD.F90

!IF  "$(CFG)" == "check_sd - Win32 Release"

DEP_F90_CHEK_S=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_CHEK_S=\
	".\Release\chksdinc.mod"\
	

"$(INTDIR)\CHEK_SDD.OBJ" : $(SOURCE) $(DEP_F90_CHEK_S) "$(INTDIR)"\
 "$(INTDIR)\chksdinc.mod"


!ELSEIF  "$(CFG)" == "check_sd - Win32 Debug"

DEP_F90_CHEK_S=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_CHEK_S=\
	".\Debug\chksdinc.mod"\
	

"$(INTDIR)\CHEK_SDD.OBJ" : $(SOURCE) $(DEP_F90_CHEK_S) "$(INTDIR)"\
 "$(INTDIR)\chksdinc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\CHEK_SDC.F90

!IF  "$(CFG)" == "check_sd - Win32 Release"

DEP_F90_CHEK_SD=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_CHEK_SD=\
	".\Release\chksdinc.mod"\
	

"$(INTDIR)\CHEK_SDC.OBJ" : $(SOURCE) $(DEP_F90_CHEK_SD) "$(INTDIR)"\
 "$(INTDIR)\chksdinc.mod"


!ELSEIF  "$(CFG)" == "check_sd - Win32 Debug"

DEP_F90_CHEK_SD=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_CHEK_SD=\
	".\Debug\chksdinc.mod"\
	

"$(INTDIR)\CHEK_SDC.OBJ" : $(SOURCE) $(DEP_F90_CHEK_SD) "$(INTDIR)"\
 "$(INTDIR)\chksdinc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\CHEK_SDB.F90

!IF  "$(CFG)" == "check_sd - Win32 Release"

DEP_F90_CHEK_SDB=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_CHEK_SDB=\
	".\Release\chksdinc.mod"\
	

"$(INTDIR)\CHEK_SDB.OBJ" : $(SOURCE) $(DEP_F90_CHEK_SDB) "$(INTDIR)"\
 "$(INTDIR)\chksdinc.mod"


!ELSEIF  "$(CFG)" == "check_sd - Win32 Debug"

DEP_F90_CHEK_SDB=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_CHEK_SDB=\
	".\Debug\chksdinc.mod"\
	

"$(INTDIR)\CHEK_SDB.OBJ" : $(SOURCE) $(DEP_F90_CHEK_SDB) "$(INTDIR)"\
 "$(INTDIR)\chksdinc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\CHEK_SDA.F90

!IF  "$(CFG)" == "check_sd - Win32 Release"

NODEP_F90_CHEK_SDA=\
	".\Release\chksdinc.mod"\
	

"$(INTDIR)\CHEK_SDA.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\chksdinc.mod"


!ELSEIF  "$(CFG)" == "check_sd - Win32 Debug"

NODEP_F90_CHEK_SDA=\
	".\Debug\chksdinc.mod"\
	

"$(INTDIR)\CHEK_SDA.OBJ" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\chksdinc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\CHECK_SD.F90

!IF  "$(CFG)" == "check_sd - Win32 Release"

DEP_F90_CHECK=\
	{$(INCLUDE)}"\msfwin.mod"\
	".\check_sd.fi"\
	
NODEP_F90_CHECK=\
	".\Release\chksdinc.mod"\
	".\Release\data.f90"\
	

"$(INTDIR)\CHECK_SD.OBJ" : $(SOURCE) $(DEP_F90_CHECK) "$(INTDIR)"\
 "$(INTDIR)\chksdinc.mod"


!ELSEIF  "$(CFG)" == "check_sd - Win32 Debug"

DEP_F90_CHECK=\
	{$(INCLUDE)}"\msfwin.mod"\
	".\check_sd.fi"\
	
NODEP_F90_CHECK=\
	".\Debug\chksdinc.mod"\
	".\Debug\data.f90"\
	

"$(INTDIR)\CHECK_SD.OBJ" : $(SOURCE) $(DEP_F90_CHECK) "$(INTDIR)"\
 "$(INTDIR)\chksdinc.mod"


!ENDIF 

# End Source File
# End Target
# End Project
################################################################################
