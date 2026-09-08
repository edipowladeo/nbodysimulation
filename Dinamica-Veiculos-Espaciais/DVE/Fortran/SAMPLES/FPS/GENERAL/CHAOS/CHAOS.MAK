# Microsoft Visual C++ Generated NMAKE File, Format Version 40000
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) QuickWin Application" 0x0107

!IF "$(CFG)" == ""
CFG=chaos - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to chaos - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "chaos - Win32 Release" && "$(CFG)" != "chaos - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "chaos.mak" CFG="chaos - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "chaos - Win32 Release" (based on "Win32 (x86) QuickWin Application")
!MESSAGE "chaos - Win32 Debug" (based on "Win32 (x86) QuickWin Application")
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
F90=fl32.exe

!IF  "$(CFG)" == "chaos - Win32 Release"

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

ALL : "$(OUTDIR)\chaos.exe"

CLEAN : 
	-@erase ".\Release\chaos.exe"
	-@erase ".\Release\wastepts.obj"
	-@erase ".\Release\wasteit.obj"
	-@erase ".\Release\CHAOSCOM.mod"
	-@erase ".\Release\viewpalt.obj"
	-@erase ".\Release\vidconf.obj"
	-@erase ".\Release\totinit.obj"
	-@erase ".\Release\PALET.mod"
	-@erase ".\Release\INPUTINFO.mod"
	-@erase ".\Release\stvidprm.obj"
	-@erase ".\Release\stpdrw.obj"
	-@erase ".\Release\shwpallt.obj"
	-@erase ".\Release\VIDCONF.mod"
	-@erase ".\Release\PLOTVAL.mod"
	-@erase ".\Release\setvideo.obj"
	-@erase ".\Release\setpixel.obj"
	-@erase ".\Release\setchcof.obj"
	-@erase ".\Release\selchsym.obj"
	-@erase ".\Release\scale.obj"
	-@erase ".\Release\savpall.obj"
	-@erase ".\Release\savpalfl.obj"
	-@erase ".\Release\savchfil.obj"
	-@erase ".\Release\savchaos.obj"
	-@erase ".\Release\rotate.obj"
	-@erase ".\Release\rgb.obj"
	-@erase ".\Release\readpal.obj"
	-@erase ".\Release\readchs.obj"
	-@erase ".\Release\qantcol.obj"
	-@erase ".\Release\plotval.obj"
	-@erase ".\Release\plottic.obj"
	-@erase ".\Release\FONTCOM.mod"
	-@erase ".\Release\plotpix.obj"
	-@erase ".\Release\plot.obj"
	-@erase ".\Release\pallet.obj"
	-@erase ".\Release\paletprm.obj"
	-@erase ".\Release\palet.obj"
	-@erase ".\Release\minmaxc.obj"
	-@erase ".\Release\minmax.obj"
	-@erase ".\Release\matherqq.obj"
	-@erase ".\Release\look.obj"
	-@erase ".\Release\GETWIN.mod"
	-@erase ".\Release\lnchdemo.obj"
	-@erase ".\Release\lchchsdr.obj"
	-@erase ".\Release\inptinfo.obj"
	-@erase ".\Release\inppalfl.obj"
	-@erase ".\Release\inpchfil.obj"
	-@erase ".\Release\initlxy.obj"
	-@erase ".\Release\image.obj"
	-@erase ".\Release\hlpinfo.obj"
	-@erase ".\Release\godemo.obj"
	-@erase ".\Release\gochsdrv.obj"
	-@erase ".\Release\getwin.obj"
	-@erase ".\Release\fontcom.obj"
	-@erase ".\Release\exitprog.obj"
	-@erase ".\Release\demolop.obj"
	-@erase ".\Release\cretpalt.obj"
	-@erase ".\Release\comdlger.obj"
	-@erase ".\Release\chaosinp.res"
	-@erase ".\Release\chaosdrv.obj"
	-@erase ".\Release\chaoscom.obj"
	-@erase ".\Release\chaos5.obj"
	-@erase ".\Release\chaos4.obj"
	-@erase ".\Release\chaos3.obj"
	-@erase ".\Release\chaos.obj"
	-@erase ".\Release\axis.obj"

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)/chaosinp.res" /d "NDEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/chaos.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386 /nodefaultlib:"console.lib"
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386 /nodefaultlib:"console.lib"
LINK32_FLAGS=kernel32.lib /nologo /subsystem:windows /incremental:no\
 /pdb:"$(OUTDIR)/chaos.pdb" /machine:I386 /nodefaultlib:"console.lib"\
 /out:"$(OUTDIR)/chaos.exe" 
LINK32_OBJS= \
	"$(INTDIR)/wastepts.obj" \
	"$(INTDIR)/wasteit.obj" \
	"$(INTDIR)/viewpalt.obj" \
	"$(INTDIR)/vidconf.obj" \
	"$(INTDIR)/totinit.obj" \
	"$(INTDIR)/stvidprm.obj" \
	"$(INTDIR)/stpdrw.obj" \
	"$(INTDIR)/shwpallt.obj" \
	"$(INTDIR)/setvideo.obj" \
	"$(INTDIR)/setpixel.obj" \
	"$(INTDIR)/setchcof.obj" \
	"$(INTDIR)/selchsym.obj" \
	"$(INTDIR)/scale.obj" \
	"$(INTDIR)/savpall.obj" \
	"$(INTDIR)/savpalfl.obj" \
	"$(INTDIR)/savchfil.obj" \
	"$(INTDIR)/savchaos.obj" \
	"$(INTDIR)/rotate.obj" \
	"$(INTDIR)/rgb.obj" \
	"$(INTDIR)/readpal.obj" \
	"$(INTDIR)/readchs.obj" \
	"$(INTDIR)/qantcol.obj" \
	"$(INTDIR)/plotval.obj" \
	"$(INTDIR)/plottic.obj" \
	"$(INTDIR)/plotpix.obj" \
	"$(INTDIR)/plot.obj" \
	"$(INTDIR)/pallet.obj" \
	"$(INTDIR)/paletprm.obj" \
	"$(INTDIR)/palet.obj" \
	"$(INTDIR)/minmaxc.obj" \
	"$(INTDIR)/minmax.obj" \
	"$(INTDIR)/matherqq.obj" \
	"$(INTDIR)/look.obj" \
	"$(INTDIR)/lnchdemo.obj" \
	"$(INTDIR)/lchchsdr.obj" \
	"$(INTDIR)/inptinfo.obj" \
	"$(INTDIR)/inppalfl.obj" \
	"$(INTDIR)/inpchfil.obj" \
	"$(INTDIR)/initlxy.obj" \
	"$(INTDIR)/image.obj" \
	"$(INTDIR)/hlpinfo.obj" \
	"$(INTDIR)/godemo.obj" \
	"$(INTDIR)/gochsdrv.obj" \
	"$(INTDIR)/getwin.obj" \
	"$(INTDIR)/fontcom.obj" \
	"$(INTDIR)/exitprog.obj" \
	"$(INTDIR)/demolop.obj" \
	"$(INTDIR)/cretpalt.obj" \
	"$(INTDIR)/comdlger.obj" \
	"$(INTDIR)/chaosdrv.obj" \
	"$(INTDIR)/chaoscom.obj" \
	"$(INTDIR)/chaos5.obj" \
	"$(INTDIR)/chaos4.obj" \
	"$(INTDIR)/chaos3.obj" \
	"$(INTDIR)/chaos.obj" \
	"$(INTDIR)/axis.obj" \
	"$(INTDIR)/chaosinp.res"

"$(OUTDIR)\chaos.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "chaos - Win32 Debug"

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

ALL : "$(OUTDIR)\chaos.exe"

CLEAN : 
	-@erase ".\Debug\chaos.exe"
	-@erase ".\Debug\wastepts.obj"
	-@erase ".\Debug\wasteit.obj"
	-@erase ".\Debug\CHAOSCOM.mod"
	-@erase ".\Debug\viewpalt.obj"
	-@erase ".\Debug\vidconf.obj"
	-@erase ".\Debug\totinit.obj"
	-@erase ".\Debug\PALET.mod"
	-@erase ".\Debug\INPUTINFO.mod"
	-@erase ".\Debug\stvidprm.obj"
	-@erase ".\Debug\stpdrw.obj"
	-@erase ".\Debug\shwpallt.obj"
	-@erase ".\Debug\VIDCONF.mod"
	-@erase ".\Debug\PLOTVAL.mod"
	-@erase ".\Debug\setvideo.obj"
	-@erase ".\Debug\setpixel.obj"
	-@erase ".\Debug\setchcof.obj"
	-@erase ".\Debug\selchsym.obj"
	-@erase ".\Debug\scale.obj"
	-@erase ".\Debug\savpall.obj"
	-@erase ".\Debug\savpalfl.obj"
	-@erase ".\Debug\savchfil.obj"
	-@erase ".\Debug\savchaos.obj"
	-@erase ".\Debug\rotate.obj"
	-@erase ".\Debug\rgb.obj"
	-@erase ".\Debug\readpal.obj"
	-@erase ".\Debug\readchs.obj"
	-@erase ".\Debug\qantcol.obj"
	-@erase ".\Debug\plotval.obj"
	-@erase ".\Debug\plottic.obj"
	-@erase ".\Debug\FONTCOM.mod"
	-@erase ".\Debug\plotpix.obj"
	-@erase ".\Debug\plot.obj"
	-@erase ".\Debug\pallet.obj"
	-@erase ".\Debug\paletprm.obj"
	-@erase ".\Debug\palet.obj"
	-@erase ".\Debug\minmaxc.obj"
	-@erase ".\Debug\minmax.obj"
	-@erase ".\Debug\matherqq.obj"
	-@erase ".\Debug\look.obj"
	-@erase ".\Debug\GETWIN.mod"
	-@erase ".\Debug\lnchdemo.obj"
	-@erase ".\Debug\lchchsdr.obj"
	-@erase ".\Debug\inptinfo.obj"
	-@erase ".\Debug\inppalfl.obj"
	-@erase ".\Debug\inpchfil.obj"
	-@erase ".\Debug\initlxy.obj"
	-@erase ".\Debug\image.obj"
	-@erase ".\Debug\hlpinfo.obj"
	-@erase ".\Debug\godemo.obj"
	-@erase ".\Debug\gochsdrv.obj"
	-@erase ".\Debug\getwin.obj"
	-@erase ".\Debug\fontcom.obj"
	-@erase ".\Debug\exitprog.obj"
	-@erase ".\Debug\demolop.obj"
	-@erase ".\Debug\cretpalt.obj"
	-@erase ".\Debug\comdlger.obj"
	-@erase ".\Debug\chaosinp.res"
	-@erase ".\Debug\chaosdrv.obj"
	-@erase ".\Debug\chaoscom.obj"
	-@erase ".\Debug\chaos5.obj"
	-@erase ".\Debug\chaos4.obj"
	-@erase ".\Debug\chaos3.obj"
	-@erase ".\Debug\chaos.obj"
	-@erase ".\Debug\axis.obj"
	-@erase ".\Debug\chaos.ilk"
	-@erase ".\Debug\chaos.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Zi /I "Debug/" /c /nologo /MW
# ADD F90 /Zi /I "Debug/" /c /nologo /MW
F90_PROJ=/Zi /I "Debug/" /c /nologo /MW /Fo"Debug/" /Fd"Debug/chaos.pdb" 
F90_OBJS=.\Debug/
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /win32
MTL_PROJ=/nologo /D "_DEBUG" /win32 
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
RSC_PROJ=/l 0x409 /fo"$(INTDIR)/chaosinp.res" /d "_DEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/chaos.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386 /nodefaultlib:"console.lib"
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386 /nodefaultlib:"console.lib"
LINK32_FLAGS=kernel32.lib /nologo /subsystem:windows /incremental:yes\
 /pdb:"$(OUTDIR)/chaos.pdb" /debug /machine:I386 /nodefaultlib:"console.lib"\
 /out:"$(OUTDIR)/chaos.exe" 
LINK32_OBJS= \
	"$(INTDIR)/wastepts.obj" \
	"$(INTDIR)/wasteit.obj" \
	"$(INTDIR)/viewpalt.obj" \
	"$(INTDIR)/vidconf.obj" \
	"$(INTDIR)/totinit.obj" \
	"$(INTDIR)/stvidprm.obj" \
	"$(INTDIR)/stpdrw.obj" \
	"$(INTDIR)/shwpallt.obj" \
	"$(INTDIR)/setvideo.obj" \
	"$(INTDIR)/setpixel.obj" \
	"$(INTDIR)/setchcof.obj" \
	"$(INTDIR)/selchsym.obj" \
	"$(INTDIR)/scale.obj" \
	"$(INTDIR)/savpall.obj" \
	"$(INTDIR)/savpalfl.obj" \
	"$(INTDIR)/savchfil.obj" \
	"$(INTDIR)/savchaos.obj" \
	"$(INTDIR)/rotate.obj" \
	"$(INTDIR)/rgb.obj" \
	"$(INTDIR)/readpal.obj" \
	"$(INTDIR)/readchs.obj" \
	"$(INTDIR)/qantcol.obj" \
	"$(INTDIR)/plotval.obj" \
	"$(INTDIR)/plottic.obj" \
	"$(INTDIR)/plotpix.obj" \
	"$(INTDIR)/plot.obj" \
	"$(INTDIR)/pallet.obj" \
	"$(INTDIR)/paletprm.obj" \
	"$(INTDIR)/palet.obj" \
	"$(INTDIR)/minmaxc.obj" \
	"$(INTDIR)/minmax.obj" \
	"$(INTDIR)/matherqq.obj" \
	"$(INTDIR)/look.obj" \
	"$(INTDIR)/lnchdemo.obj" \
	"$(INTDIR)/lchchsdr.obj" \
	"$(INTDIR)/inptinfo.obj" \
	"$(INTDIR)/inppalfl.obj" \
	"$(INTDIR)/inpchfil.obj" \
	"$(INTDIR)/initlxy.obj" \
	"$(INTDIR)/image.obj" \
	"$(INTDIR)/hlpinfo.obj" \
	"$(INTDIR)/godemo.obj" \
	"$(INTDIR)/gochsdrv.obj" \
	"$(INTDIR)/getwin.obj" \
	"$(INTDIR)/fontcom.obj" \
	"$(INTDIR)/exitprog.obj" \
	"$(INTDIR)/demolop.obj" \
	"$(INTDIR)/cretpalt.obj" \
	"$(INTDIR)/comdlger.obj" \
	"$(INTDIR)/chaosdrv.obj" \
	"$(INTDIR)/chaoscom.obj" \
	"$(INTDIR)/chaos5.obj" \
	"$(INTDIR)/chaos4.obj" \
	"$(INTDIR)/chaos3.obj" \
	"$(INTDIR)/chaos.obj" \
	"$(INTDIR)/axis.obj" \
	"$(INTDIR)/chaosinp.res"

"$(OUTDIR)\chaos.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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

# Name "chaos - Win32 Release"
# Name "chaos - Win32 Debug"

!IF  "$(CFG)" == "chaos - Win32 Release"

!ELSEIF  "$(CFG)" == "chaos - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\wastepts.f90
DEP_F90_WASTE=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	

"$(INTDIR)\wastepts.obj" : $(SOURCE) $(DEP_F90_WASTE) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\wasteit.f90

!IF  "$(CFG)" == "chaos - Win32 Release"

DEP_F90_WASTEI=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	{$(INCLUDE)}"\DIALOGM.mod"\
	".\RESOURCE.FD"\
	
NODEP_F90_WASTEI=\
	".\Release\CHAOSCOM.mod"\
	

"$(INTDIR)\wasteit.obj" : $(SOURCE) $(DEP_F90_WASTEI) "$(INTDIR)"\
 "$(INTDIR)\CHAOSCOM.mod"


!ELSEIF  "$(CFG)" == "chaos - Win32 Debug"

DEP_F90_WASTEI=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	{$(INCLUDE)}"\DIALOGM.mod"\
	".\RESOURCE.FD"\
	
NODEP_F90_WASTEI=\
	".\Debug\CHAOSCOM.mod"\
	

"$(INTDIR)\wasteit.obj" : $(SOURCE) $(DEP_F90_WASTEI) "$(INTDIR)"\
 "$(INTDIR)\CHAOSCOM.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\viewpalt.f90
DEP_F90_VIEWP=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	{$(INCLUDE)}"\DIALOGM.mod"\
	".\RESOURCE.FD"\
	

"$(INTDIR)\viewpalt.obj" : $(SOURCE) $(DEP_F90_VIEWP) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\vidconf.f90
DEP_F90_VIDCO=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	

!IF  "$(CFG)" == "chaos - Win32 Release"

F90_MODOUT=\
	"VIDCONF"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\vidconf.obj" : $(SOURCE) $(DEP_F90_VIDCO) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\VIDCONF.MOD" : $(SOURCE) $(DEP_F90_VIDCO) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "chaos - Win32 Debug"

F90_MODOUT=\
	"VIDCONF"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\vidconf.obj" : $(SOURCE) $(DEP_F90_VIDCO) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\VIDCONF.MOD" : $(SOURCE) $(DEP_F90_VIDCO) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\totinit.f90

!IF  "$(CFG)" == "chaos - Win32 Release"

DEP_F90_TOTIN=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	
NODEP_F90_TOTIN=\
	".\Release\CHAOSCOM.mod"\
	".\Release\INPUTINFO.mod"\
	".\Release\PALET.mod"\
	

"$(INTDIR)\totinit.obj" : $(SOURCE) $(DEP_F90_TOTIN) "$(INTDIR)"\
 "$(INTDIR)\PALET.mod" "$(INTDIR)\INPUTINFO.mod" "$(INTDIR)\CHAOSCOM.mod"


!ELSEIF  "$(CFG)" == "chaos - Win32 Debug"

DEP_F90_TOTIN=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	
NODEP_F90_TOTIN=\
	".\Debug\CHAOSCOM.mod"\
	".\Debug\INPUTINFO.mod"\
	".\Debug\PALET.mod"\
	

"$(INTDIR)\totinit.obj" : $(SOURCE) $(DEP_F90_TOTIN) "$(INTDIR)"\
 "$(INTDIR)\PALET.mod" "$(INTDIR)\INPUTINFO.mod" "$(INTDIR)\CHAOSCOM.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\stvidprm.f90

!IF  "$(CFG)" == "chaos - Win32 Release"

DEP_F90_STVID=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	{$(INCLUDE)}"\DIALOGM.mod"\
	".\RESOURCE.FD"\
	
NODEP_F90_STVID=\
	".\Release\CHAOSCOM.mod"\
	

"$(INTDIR)\stvidprm.obj" : $(SOURCE) $(DEP_F90_STVID) "$(INTDIR)"\
 "$(INTDIR)\CHAOSCOM.mod"


!ELSEIF  "$(CFG)" == "chaos - Win32 Debug"

DEP_F90_STVID=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	{$(INCLUDE)}"\DIALOGM.mod"\
	".\RESOURCE.FD"\
	
NODEP_F90_STVID=\
	".\Debug\CHAOSCOM.mod"\
	

"$(INTDIR)\stvidprm.obj" : $(SOURCE) $(DEP_F90_STVID) "$(INTDIR)"\
 "$(INTDIR)\CHAOSCOM.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\stpdrw.f90

!IF  "$(CFG)" == "chaos - Win32 Release"

DEP_F90_STPDR=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	
NODEP_F90_STPDR=\
	".\Release\CHAOSCOM.mod"\
	

"$(INTDIR)\stpdrw.obj" : $(SOURCE) $(DEP_F90_STPDR) "$(INTDIR)"\
 "$(INTDIR)\CHAOSCOM.mod"


!ELSEIF  "$(CFG)" == "chaos - Win32 Debug"

DEP_F90_STPDR=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	
NODEP_F90_STPDR=\
	".\Debug\CHAOSCOM.mod"\
	

"$(INTDIR)\stpdrw.obj" : $(SOURCE) $(DEP_F90_STPDR) "$(INTDIR)"\
 "$(INTDIR)\CHAOSCOM.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\shwpallt.f90

!IF  "$(CFG)" == "chaos - Win32 Release"

DEP_F90_SHWPA=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	
NODEP_F90_SHWPA=\
	".\Release\PALET.mod"\
	".\Release\PLOTVAL.mod"\
	".\Release\VIDCONF.mod"\
	

"$(INTDIR)\shwpallt.obj" : $(SOURCE) $(DEP_F90_SHWPA) "$(INTDIR)"\
 "$(INTDIR)\VIDCONF.MOD" "$(INTDIR)\PLOTVAL.mod" "$(INTDIR)\PALET.mod"


!ELSEIF  "$(CFG)" == "chaos - Win32 Debug"

DEP_F90_SHWPA=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	
NODEP_F90_SHWPA=\
	".\Debug\PALET.mod"\
	".\Debug\PLOTVAL.mod"\
	".\Debug\VIDCONF.mod"\
	

"$(INTDIR)\shwpallt.obj" : $(SOURCE) $(DEP_F90_SHWPA) "$(INTDIR)"\
 "$(INTDIR)\VIDCONF.MOD" "$(INTDIR)\PLOTVAL.mod" "$(INTDIR)\PALET.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\setvideo.f90

!IF  "$(CFG)" == "chaos - Win32 Release"

DEP_F90_SETVI=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	
NODEP_F90_SETVI=\
	".\Release\CHAOSCOM.mod"\
	

"$(INTDIR)\setvideo.obj" : $(SOURCE) $(DEP_F90_SETVI) "$(INTDIR)"\
 "$(INTDIR)\CHAOSCOM.mod"


!ELSEIF  "$(CFG)" == "chaos - Win32 Debug"

DEP_F90_SETVI=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	
NODEP_F90_SETVI=\
	".\Debug\CHAOSCOM.mod"\
	

"$(INTDIR)\setvideo.obj" : $(SOURCE) $(DEP_F90_SETVI) "$(INTDIR)"\
 "$(INTDIR)\CHAOSCOM.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\setpixel.f90
DEP_F90_SETPI=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	

"$(INTDIR)\setpixel.obj" : $(SOURCE) $(DEP_F90_SETPI) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\setchcof.f90

!IF  "$(CFG)" == "chaos - Win32 Release"

DEP_F90_SETCH=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	{$(INCLUDE)}"\DIALOGM.mod"\
	".\RESOURCE.FD"\
	
NODEP_F90_SETCH=\
	".\Release\CHAOSCOM.mod"\
	

"$(INTDIR)\setchcof.obj" : $(SOURCE) $(DEP_F90_SETCH) "$(INTDIR)"\
 "$(INTDIR)\CHAOSCOM.mod"


!ELSEIF  "$(CFG)" == "chaos - Win32 Debug"

DEP_F90_SETCH=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	{$(INCLUDE)}"\DIALOGM.mod"\
	".\RESOURCE.FD"\
	
NODEP_F90_SETCH=\
	".\Debug\CHAOSCOM.mod"\
	

"$(INTDIR)\setchcof.obj" : $(SOURCE) $(DEP_F90_SETCH) "$(INTDIR)"\
 "$(INTDIR)\CHAOSCOM.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\selchsym.f90

!IF  "$(CFG)" == "chaos - Win32 Release"

DEP_F90_SELCH=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	{$(INCLUDE)}"\DIALOGM.mod"\
	".\RESOURCE.FD"\
	
NODEP_F90_SELCH=\
	".\Release\CHAOSCOM.mod"\
	

"$(INTDIR)\selchsym.obj" : $(SOURCE) $(DEP_F90_SELCH) "$(INTDIR)"\
 "$(INTDIR)\CHAOSCOM.mod"


!ELSEIF  "$(CFG)" == "chaos - Win32 Debug"

DEP_F90_SELCH=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	{$(INCLUDE)}"\DIALOGM.mod"\
	".\RESOURCE.FD"\
	
NODEP_F90_SELCH=\
	".\Debug\CHAOSCOM.mod"\
	

"$(INTDIR)\selchsym.obj" : $(SOURCE) $(DEP_F90_SELCH) "$(INTDIR)"\
 "$(INTDIR)\CHAOSCOM.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\scale.f90

!IF  "$(CFG)" == "chaos - Win32 Release"

DEP_F90_SCALE=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	{$(INCLUDE)}"\DIALOGM.mod"\
	".\RESOURCE.FD"\
	
NODEP_F90_SCALE=\
	".\Release\CHAOSCOM.mod"\
	

"$(INTDIR)\scale.obj" : $(SOURCE) $(DEP_F90_SCALE) "$(INTDIR)"\
 "$(INTDIR)\CHAOSCOM.mod"


!ELSEIF  "$(CFG)" == "chaos - Win32 Debug"

DEP_F90_SCALE=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	{$(INCLUDE)}"\DIALOGM.mod"\
	".\RESOURCE.FD"\
	
NODEP_F90_SCALE=\
	".\Debug\CHAOSCOM.mod"\
	

"$(INTDIR)\scale.obj" : $(SOURCE) $(DEP_F90_SCALE) "$(INTDIR)"\
 "$(INTDIR)\CHAOSCOM.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\savpall.f90

!IF  "$(CFG)" == "chaos - Win32 Release"

DEP_F90_SAVPA=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	
NODEP_F90_SAVPA=\
	".\Release\INPUTINFO.mod"\
	".\Release\PALET.mod"\
	

"$(INTDIR)\savpall.obj" : $(SOURCE) $(DEP_F90_SAVPA) "$(INTDIR)"\
 "$(INTDIR)\PALET.mod" "$(INTDIR)\INPUTINFO.mod"


!ELSEIF  "$(CFG)" == "chaos - Win32 Debug"

DEP_F90_SAVPA=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	
NODEP_F90_SAVPA=\
	".\Debug\INPUTINFO.mod"\
	".\Debug\PALET.mod"\
	

"$(INTDIR)\savpall.obj" : $(SOURCE) $(DEP_F90_SAVPA) "$(INTDIR)"\
 "$(INTDIR)\PALET.mod" "$(INTDIR)\INPUTINFO.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\savpalfl.f90

!IF  "$(CFG)" == "chaos - Win32 Release"

DEP_F90_SAVPAL=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	{$(INCLUDE)}"\MSFWINTY.mod"\
	{$(INCLUDE)}"\MSFWIN.mod"\
	
NODEP_F90_SAVPAL=\
	".\Release\INPUTINFO.mod"\
	

"$(INTDIR)\savpalfl.obj" : $(SOURCE) $(DEP_F90_SAVPAL) "$(INTDIR)"\
 "$(INTDIR)\INPUTINFO.mod"


!ELSEIF  "$(CFG)" == "chaos - Win32 Debug"

DEP_F90_SAVPAL=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	{$(INCLUDE)}"\MSFWINTY.mod"\
	{$(INCLUDE)}"\MSFWIN.mod"\
	
NODEP_F90_SAVPAL=\
	".\Debug\INPUTINFO.mod"\
	

"$(INTDIR)\savpalfl.obj" : $(SOURCE) $(DEP_F90_SAVPAL) "$(INTDIR)"\
 "$(INTDIR)\INPUTINFO.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\savchfil.f90

!IF  "$(CFG)" == "chaos - Win32 Release"

DEP_F90_SAVCH=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	{$(INCLUDE)}"\MSFWINTY.mod"\
	{$(INCLUDE)}"\MSFWIN.mod"\
	
NODEP_F90_SAVCH=\
	".\Release\INPUTINFO.mod"\
	

"$(INTDIR)\savchfil.obj" : $(SOURCE) $(DEP_F90_SAVCH) "$(INTDIR)"\
 "$(INTDIR)\INPUTINFO.mod"


!ELSEIF  "$(CFG)" == "chaos - Win32 Debug"

DEP_F90_SAVCH=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	{$(INCLUDE)}"\MSFWINTY.mod"\
	{$(INCLUDE)}"\MSFWIN.mod"\
	
NODEP_F90_SAVCH=\
	".\Debug\INPUTINFO.mod"\
	

"$(INTDIR)\savchfil.obj" : $(SOURCE) $(DEP_F90_SAVCH) "$(INTDIR)"\
 "$(INTDIR)\INPUTINFO.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\savchaos.f90

!IF  "$(CFG)" == "chaos - Win32 Release"

DEP_F90_SAVCHA=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	
NODEP_F90_SAVCHA=\
	".\Release\CHAOSCOM.mod"\
	".\Release\INPUTINFO.mod"\
	

"$(INTDIR)\savchaos.obj" : $(SOURCE) $(DEP_F90_SAVCHA) "$(INTDIR)"\
 "$(INTDIR)\INPUTINFO.mod" "$(INTDIR)\CHAOSCOM.mod"


!ELSEIF  "$(CFG)" == "chaos - Win32 Debug"

DEP_F90_SAVCHA=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	
NODEP_F90_SAVCHA=\
	".\Debug\CHAOSCOM.mod"\
	".\Debug\INPUTINFO.mod"\
	

"$(INTDIR)\savchaos.obj" : $(SOURCE) $(DEP_F90_SAVCHA) "$(INTDIR)"\
 "$(INTDIR)\INPUTINFO.mod" "$(INTDIR)\CHAOSCOM.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\rotate.f90

!IF  "$(CFG)" == "chaos - Win32 Release"

DEP_F90_ROTAT=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	{$(INCLUDE)}"\DIALOGM.mod"\
	".\RESOURCE.FD"\
	
NODEP_F90_ROTAT=\
	".\Release\CHAOSCOM.mod"\
	

"$(INTDIR)\rotate.obj" : $(SOURCE) $(DEP_F90_ROTAT) "$(INTDIR)"\
 "$(INTDIR)\CHAOSCOM.mod"


!ELSEIF  "$(CFG)" == "chaos - Win32 Debug"

DEP_F90_ROTAT=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	{$(INCLUDE)}"\DIALOGM.mod"\
	".\RESOURCE.FD"\
	
NODEP_F90_ROTAT=\
	".\Debug\CHAOSCOM.mod"\
	

"$(INTDIR)\rotate.obj" : $(SOURCE) $(DEP_F90_ROTAT) "$(INTDIR)"\
 "$(INTDIR)\CHAOSCOM.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\rgb.f90
DEP_F90_RGB_F=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	

"$(INTDIR)\rgb.obj" : $(SOURCE) $(DEP_F90_RGB_F) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\readpal.f90

!IF  "$(CFG)" == "chaos - Win32 Release"

DEP_F90_READP=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	
NODEP_F90_READP=\
	".\Release\INPUTINFO.mod"\
	".\Release\PALET.mod"\
	

"$(INTDIR)\readpal.obj" : $(SOURCE) $(DEP_F90_READP) "$(INTDIR)"\
 "$(INTDIR)\PALET.mod" "$(INTDIR)\INPUTINFO.mod"


!ELSEIF  "$(CFG)" == "chaos - Win32 Debug"

DEP_F90_READP=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	
NODEP_F90_READP=\
	".\Debug\INPUTINFO.mod"\
	".\Debug\PALET.mod"\
	

"$(INTDIR)\readpal.obj" : $(SOURCE) $(DEP_F90_READP) "$(INTDIR)"\
 "$(INTDIR)\PALET.mod" "$(INTDIR)\INPUTINFO.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\readchs.f90

!IF  "$(CFG)" == "chaos - Win32 Release"

DEP_F90_READC=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	
NODEP_F90_READC=\
	".\Release\CHAOSCOM.mod"\
	".\Release\INPUTINFO.mod"\
	

"$(INTDIR)\readchs.obj" : $(SOURCE) $(DEP_F90_READC) "$(INTDIR)"\
 "$(INTDIR)\INPUTINFO.mod" "$(INTDIR)\CHAOSCOM.mod"


!ELSEIF  "$(CFG)" == "chaos - Win32 Debug"

DEP_F90_READC=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	
NODEP_F90_READC=\
	".\Debug\CHAOSCOM.mod"\
	".\Debug\INPUTINFO.mod"\
	

"$(INTDIR)\readchs.obj" : $(SOURCE) $(DEP_F90_READC) "$(INTDIR)"\
 "$(INTDIR)\INPUTINFO.mod" "$(INTDIR)\CHAOSCOM.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\qantcol.f90

!IF  "$(CFG)" == "chaos - Win32 Release"

DEP_F90_QANTC=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	{$(INCLUDE)}"\DIALOGM.mod"\
	".\RESOURCE.FD"\
	
NODEP_F90_QANTC=\
	".\Release\CHAOSCOM.mod"\
	

"$(INTDIR)\qantcol.obj" : $(SOURCE) $(DEP_F90_QANTC) "$(INTDIR)"\
 "$(INTDIR)\CHAOSCOM.mod"


!ELSEIF  "$(CFG)" == "chaos - Win32 Debug"

DEP_F90_QANTC=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	{$(INCLUDE)}"\DIALOGM.mod"\
	".\RESOURCE.FD"\
	
NODEP_F90_QANTC=\
	".\Debug\CHAOSCOM.mod"\
	

"$(INTDIR)\qantcol.obj" : $(SOURCE) $(DEP_F90_QANTC) "$(INTDIR)"\
 "$(INTDIR)\CHAOSCOM.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\plotval.f90

!IF  "$(CFG)" == "chaos - Win32 Release"

F90_MODOUT=\
	"PLOTVAL"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\plotval.obj" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\PLOTVAL.mod" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "chaos - Win32 Debug"

F90_MODOUT=\
	"PLOTVAL"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\plotval.obj" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\PLOTVAL.mod" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\plottic.f90

!IF  "$(CFG)" == "chaos - Win32 Release"

DEP_F90_PLOTT=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	
NODEP_F90_PLOTT=\
	".\Release\PLOTVAL.mod"\
	".\Release\FONTCOM.mod"\
	".\Release\VIDCONF.mod"\
	

"$(INTDIR)\plottic.obj" : $(SOURCE) $(DEP_F90_PLOTT) "$(INTDIR)"\
 "$(INTDIR)\PLOTVAL.mod" "$(INTDIR)\VIDCONF.MOD" "$(INTDIR)\FONTCOM.mod"


!ELSEIF  "$(CFG)" == "chaos - Win32 Debug"

DEP_F90_PLOTT=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	
NODEP_F90_PLOTT=\
	".\Debug\PLOTVAL.mod"\
	".\Debug\FONTCOM.mod"\
	".\Debug\VIDCONF.mod"\
	

"$(INTDIR)\plottic.obj" : $(SOURCE) $(DEP_F90_PLOTT) "$(INTDIR)"\
 "$(INTDIR)\PLOTVAL.mod" "$(INTDIR)\VIDCONF.MOD" "$(INTDIR)\FONTCOM.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\plotpix.f90

!IF  "$(CFG)" == "chaos - Win32 Release"

DEP_F90_PLOTP=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	
NODEP_F90_PLOTP=\
	".\Release\PLOTVAL.mod"\
	".\Release\VIDCONF.mod"\
	

"$(INTDIR)\plotpix.obj" : $(SOURCE) $(DEP_F90_PLOTP) "$(INTDIR)"\
 "$(INTDIR)\PLOTVAL.mod" "$(INTDIR)\VIDCONF.MOD"


!ELSEIF  "$(CFG)" == "chaos - Win32 Debug"

DEP_F90_PLOTP=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	
NODEP_F90_PLOTP=\
	".\Debug\PLOTVAL.mod"\
	".\Debug\VIDCONF.mod"\
	

"$(INTDIR)\plotpix.obj" : $(SOURCE) $(DEP_F90_PLOTP) "$(INTDIR)"\
 "$(INTDIR)\PLOTVAL.mod" "$(INTDIR)\VIDCONF.MOD"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\plot.f90

!IF  "$(CFG)" == "chaos - Win32 Release"

DEP_F90_PLOT_=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	
NODEP_F90_PLOT_=\
	".\Release\PLOTVAL.mod"\
	".\Release\VIDCONF.mod"\
	

"$(INTDIR)\plot.obj" : $(SOURCE) $(DEP_F90_PLOT_) "$(INTDIR)"\
 "$(INTDIR)\PLOTVAL.mod" "$(INTDIR)\VIDCONF.MOD"


!ELSEIF  "$(CFG)" == "chaos - Win32 Debug"

DEP_F90_PLOT_=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	
NODEP_F90_PLOT_=\
	".\Debug\PLOTVAL.mod"\
	".\Debug\VIDCONF.mod"\
	

"$(INTDIR)\plot.obj" : $(SOURCE) $(DEP_F90_PLOT_) "$(INTDIR)"\
 "$(INTDIR)\PLOTVAL.mod" "$(INTDIR)\VIDCONF.MOD"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\pallet.f90

!IF  "$(CFG)" == "chaos - Win32 Release"

DEP_F90_PALLE=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	
NODEP_F90_PALLE=\
	".\Release\PALET.mod"\
	

"$(INTDIR)\pallet.obj" : $(SOURCE) $(DEP_F90_PALLE) "$(INTDIR)"\
 "$(INTDIR)\PALET.mod"


!ELSEIF  "$(CFG)" == "chaos - Win32 Debug"

DEP_F90_PALLE=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	
NODEP_F90_PALLE=\
	".\Debug\PALET.mod"\
	

"$(INTDIR)\pallet.obj" : $(SOURCE) $(DEP_F90_PALLE) "$(INTDIR)"\
 "$(INTDIR)\PALET.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\paletprm.f90

!IF  "$(CFG)" == "chaos - Win32 Release"

DEP_F90_PALET=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	{$(INCLUDE)}"\DIALOGM.mod"\
	".\RESOURCE.FD"\
	
NODEP_F90_PALET=\
	".\Release\PALET.mod"\
	

"$(INTDIR)\paletprm.obj" : $(SOURCE) $(DEP_F90_PALET) "$(INTDIR)"\
 "$(INTDIR)\PALET.mod"


!ELSEIF  "$(CFG)" == "chaos - Win32 Debug"

DEP_F90_PALET=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	{$(INCLUDE)}"\DIALOGM.mod"\
	".\RESOURCE.FD"\
	
NODEP_F90_PALET=\
	".\Debug\PALET.mod"\
	

"$(INTDIR)\paletprm.obj" : $(SOURCE) $(DEP_F90_PALET) "$(INTDIR)"\
 "$(INTDIR)\PALET.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\palet.f90

!IF  "$(CFG)" == "chaos - Win32 Release"

F90_MODOUT=\
	"PALET"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\palet.obj" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\PALET.mod" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "chaos - Win32 Debug"

F90_MODOUT=\
	"PALET"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\palet.obj" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\PALET.mod" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\minmaxc.f90

"$(INTDIR)\minmaxc.obj" : $(SOURCE) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\minmax.f90

!IF  "$(CFG)" == "chaos - Win32 Release"

DEP_F90_MINMA=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	{$(INCLUDE)}"\DIALOGM.mod"\
	".\RESOURCE.FD"\
	
NODEP_F90_MINMA=\
	".\Release\CHAOSCOM.mod"\
	

"$(INTDIR)\minmax.obj" : $(SOURCE) $(DEP_F90_MINMA) "$(INTDIR)"\
 "$(INTDIR)\CHAOSCOM.mod"


!ELSEIF  "$(CFG)" == "chaos - Win32 Debug"

DEP_F90_MINMA=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	{$(INCLUDE)}"\DIALOGM.mod"\
	".\RESOURCE.FD"\
	
NODEP_F90_MINMA=\
	".\Debug\CHAOSCOM.mod"\
	

"$(INTDIR)\minmax.obj" : $(SOURCE) $(DEP_F90_MINMA) "$(INTDIR)"\
 "$(INTDIR)\CHAOSCOM.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\matherqq.f90
DEP_F90_MATHE=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	

"$(INTDIR)\matherqq.obj" : $(SOURCE) $(DEP_F90_MATHE) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\look.f90

!IF  "$(CFG)" == "chaos - Win32 Release"

DEP_F90_LOOK_=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	{$(INCLUDE)}"\DIALOGM.mod"\
	".\RESOURCE.FD"\
	
NODEP_F90_LOOK_=\
	".\Release\GETWIN.mod"\
	".\Release\CHAOSCOM.mod"\
	

"$(INTDIR)\look.obj" : $(SOURCE) $(DEP_F90_LOOK_) "$(INTDIR)"\
 "$(INTDIR)\GETWIN.mod" "$(INTDIR)\CHAOSCOM.mod"


!ELSEIF  "$(CFG)" == "chaos - Win32 Debug"

DEP_F90_LOOK_=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	{$(INCLUDE)}"\DIALOGM.mod"\
	".\RESOURCE.FD"\
	
NODEP_F90_LOOK_=\
	".\Debug\GETWIN.mod"\
	".\Debug\CHAOSCOM.mod"\
	

"$(INTDIR)\look.obj" : $(SOURCE) $(DEP_F90_LOOK_) "$(INTDIR)"\
 "$(INTDIR)\GETWIN.mod" "$(INTDIR)\CHAOSCOM.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\lnchdemo.f90

!IF  "$(CFG)" == "chaos - Win32 Release"

DEP_F90_LNCHD=\
	{$(INCLUDE)}"\MT.mod"\
	{$(INCLUDE)}"\MSFLIB.mod"\
	
NODEP_F90_LNCHD=\
	".\Release\CHAOSCOM.mod"\
	

"$(INTDIR)\lnchdemo.obj" : $(SOURCE) $(DEP_F90_LNCHD) "$(INTDIR)"\
 "$(INTDIR)\CHAOSCOM.mod"


!ELSEIF  "$(CFG)" == "chaos - Win32 Debug"

DEP_F90_LNCHD=\
	{$(INCLUDE)}"\MT.mod"\
	{$(INCLUDE)}"\MSFLIB.mod"\
	
NODEP_F90_LNCHD=\
	".\Debug\CHAOSCOM.mod"\
	

"$(INTDIR)\lnchdemo.obj" : $(SOURCE) $(DEP_F90_LNCHD) "$(INTDIR)"\
 "$(INTDIR)\CHAOSCOM.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\lchchsdr.f90

!IF  "$(CFG)" == "chaos - Win32 Release"

DEP_F90_LCHCH=\
	{$(INCLUDE)}"\MT.mod"\
	{$(INCLUDE)}"\MSFLIB.mod"\
	
NODEP_F90_LCHCH=\
	".\Release\CHAOSCOM.mod"\
	

"$(INTDIR)\lchchsdr.obj" : $(SOURCE) $(DEP_F90_LCHCH) "$(INTDIR)"\
 "$(INTDIR)\CHAOSCOM.mod"


!ELSEIF  "$(CFG)" == "chaos - Win32 Debug"

DEP_F90_LCHCH=\
	{$(INCLUDE)}"\MT.mod"\
	{$(INCLUDE)}"\MSFLIB.mod"\
	
NODEP_F90_LCHCH=\
	".\Debug\CHAOSCOM.mod"\
	

"$(INTDIR)\lchchsdr.obj" : $(SOURCE) $(DEP_F90_LCHCH) "$(INTDIR)"\
 "$(INTDIR)\CHAOSCOM.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\inptinfo.f90

!IF  "$(CFG)" == "chaos - Win32 Release"

F90_MODOUT=\
	"INPUTINFO"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\inptinfo.obj" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\INPUTINFO.mod" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "chaos - Win32 Debug"

F90_MODOUT=\
	"INPUTINFO"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\inptinfo.obj" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\INPUTINFO.mod" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\inppalfl.f90

!IF  "$(CFG)" == "chaos - Win32 Release"

DEP_F90_INPPA=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	{$(INCLUDE)}"\MSFWINTY.mod"\
	{$(INCLUDE)}"\MSFWIN.mod"\
	
NODEP_F90_INPPA=\
	".\Release\INPUTINFO.mod"\
	

"$(INTDIR)\inppalfl.obj" : $(SOURCE) $(DEP_F90_INPPA) "$(INTDIR)"\
 "$(INTDIR)\INPUTINFO.mod"


!ELSEIF  "$(CFG)" == "chaos - Win32 Debug"

DEP_F90_INPPA=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	{$(INCLUDE)}"\MSFWINTY.mod"\
	{$(INCLUDE)}"\MSFWIN.mod"\
	
NODEP_F90_INPPA=\
	".\Debug\INPUTINFO.mod"\
	

"$(INTDIR)\inppalfl.obj" : $(SOURCE) $(DEP_F90_INPPA) "$(INTDIR)"\
 "$(INTDIR)\INPUTINFO.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\inpchfil.f90

!IF  "$(CFG)" == "chaos - Win32 Release"

DEP_F90_INPCH=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	{$(INCLUDE)}"\MSFWINTY.mod"\
	{$(INCLUDE)}"\MSFWIN.mod"\
	
NODEP_F90_INPCH=\
	".\Release\INPUTINFO.mod"\
	

"$(INTDIR)\inpchfil.obj" : $(SOURCE) $(DEP_F90_INPCH) "$(INTDIR)"\
 "$(INTDIR)\INPUTINFO.mod"


!ELSEIF  "$(CFG)" == "chaos - Win32 Debug"

DEP_F90_INPCH=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	{$(INCLUDE)}"\MSFWINTY.mod"\
	{$(INCLUDE)}"\MSFWIN.mod"\
	
NODEP_F90_INPCH=\
	".\Debug\INPUTINFO.mod"\
	

"$(INTDIR)\inpchfil.obj" : $(SOURCE) $(DEP_F90_INPCH) "$(INTDIR)"\
 "$(INTDIR)\INPUTINFO.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\initlxy.f90

!IF  "$(CFG)" == "chaos - Win32 Release"

DEP_F90_INITL=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	{$(INCLUDE)}"\DIALOGM.mod"\
	".\RESOURCE.FD"\
	
NODEP_F90_INITL=\
	".\Release\CHAOSCOM.mod"\
	

"$(INTDIR)\initlxy.obj" : $(SOURCE) $(DEP_F90_INITL) "$(INTDIR)"\
 "$(INTDIR)\CHAOSCOM.mod"


!ELSEIF  "$(CFG)" == "chaos - Win32 Debug"

DEP_F90_INITL=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	{$(INCLUDE)}"\DIALOGM.mod"\
	".\RESOURCE.FD"\
	
NODEP_F90_INITL=\
	".\Debug\CHAOSCOM.mod"\
	

"$(INTDIR)\initlxy.obj" : $(SOURCE) $(DEP_F90_INITL) "$(INTDIR)"\
 "$(INTDIR)\CHAOSCOM.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\image.f90

!IF  "$(CFG)" == "chaos - Win32 Release"

DEP_F90_IMAGE=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	{$(INCLUDE)}"\DIALOGM.mod"\
	".\RESOURCE.FD"\
	
NODEP_F90_IMAGE=\
	".\Release\CHAOSCOM.mod"\
	

"$(INTDIR)\image.obj" : $(SOURCE) $(DEP_F90_IMAGE) "$(INTDIR)"\
 "$(INTDIR)\CHAOSCOM.mod"


!ELSEIF  "$(CFG)" == "chaos - Win32 Debug"

DEP_F90_IMAGE=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	{$(INCLUDE)}"\DIALOGM.mod"\
	".\RESOURCE.FD"\
	
NODEP_F90_IMAGE=\
	".\Debug\CHAOSCOM.mod"\
	

"$(INTDIR)\image.obj" : $(SOURCE) $(DEP_F90_IMAGE) "$(INTDIR)"\
 "$(INTDIR)\CHAOSCOM.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\hlpinfo.f90
DEP_F90_HLPIN=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	{$(INCLUDE)}"\DIALOGM.mod"\
	".\RESOURCE.FD"\
	

"$(INTDIR)\hlpinfo.obj" : $(SOURCE) $(DEP_F90_HLPIN) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\godemo.f90
DEP_F90_GODEM=\
	{$(INCLUDE)}"\MT.mod"\
	

"$(INTDIR)\godemo.obj" : $(SOURCE) $(DEP_F90_GODEM) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\gochsdrv.f90
DEP_F90_GOCHS=\
	{$(INCLUDE)}"\MT.mod"\
	

"$(INTDIR)\gochsdrv.obj" : $(SOURCE) $(DEP_F90_GOCHS) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\getwin.f90

!IF  "$(CFG)" == "chaos - Win32 Release"

F90_MODOUT=\
	"GETWIN"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\getwin.obj" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\GETWIN.mod" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "chaos - Win32 Debug"

F90_MODOUT=\
	"GETWIN"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\getwin.obj" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\GETWIN.mod" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\fontcom.f90
DEP_F90_FONTC=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	

!IF  "$(CFG)" == "chaos - Win32 Release"

F90_MODOUT=\
	"FONTCOM"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\fontcom.obj" : $(SOURCE) $(DEP_F90_FONTC) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\FONTCOM.mod" : $(SOURCE) $(DEP_F90_FONTC) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "chaos - Win32 Debug"

F90_MODOUT=\
	"FONTCOM"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\fontcom.obj" : $(SOURCE) $(DEP_F90_FONTC) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\FONTCOM.mod" : $(SOURCE) $(DEP_F90_FONTC) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\exitprog.f90

!IF  "$(CFG)" == "chaos - Win32 Release"

DEP_F90_EXITP=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	
NODEP_F90_EXITP=\
	".\Release\CHAOSCOM.mod"\
	

"$(INTDIR)\exitprog.obj" : $(SOURCE) $(DEP_F90_EXITP) "$(INTDIR)"\
 "$(INTDIR)\CHAOSCOM.mod"


!ELSEIF  "$(CFG)" == "chaos - Win32 Debug"

DEP_F90_EXITP=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	
NODEP_F90_EXITP=\
	".\Debug\CHAOSCOM.mod"\
	

"$(INTDIR)\exitprog.obj" : $(SOURCE) $(DEP_F90_EXITP) "$(INTDIR)"\
 "$(INTDIR)\CHAOSCOM.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\demolop.f90

!IF  "$(CFG)" == "chaos - Win32 Release"

DEP_F90_DEMOL=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	
NODEP_F90_DEMOL=\
	".\Release\GETWIN.mod"\
	".\Release\CHAOSCOM.mod"\
	".\Release\INPUTINFO.mod"\
	

"$(INTDIR)\demolop.obj" : $(SOURCE) $(DEP_F90_DEMOL) "$(INTDIR)"\
 "$(INTDIR)\GETWIN.mod" "$(INTDIR)\INPUTINFO.mod" "$(INTDIR)\CHAOSCOM.mod"


!ELSEIF  "$(CFG)" == "chaos - Win32 Debug"

DEP_F90_DEMOL=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	
NODEP_F90_DEMOL=\
	".\Debug\GETWIN.mod"\
	".\Debug\CHAOSCOM.mod"\
	".\Debug\INPUTINFO.mod"\
	

"$(INTDIR)\demolop.obj" : $(SOURCE) $(DEP_F90_DEMOL) "$(INTDIR)"\
 "$(INTDIR)\GETWIN.mod" "$(INTDIR)\INPUTINFO.mod" "$(INTDIR)\CHAOSCOM.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\cretpalt.f90

!IF  "$(CFG)" == "chaos - Win32 Release"

DEP_F90_CRETP=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	
NODEP_F90_CRETP=\
	".\Release\PALET.mod"\
	

"$(INTDIR)\cretpalt.obj" : $(SOURCE) $(DEP_F90_CRETP) "$(INTDIR)"\
 "$(INTDIR)\PALET.mod"


!ELSEIF  "$(CFG)" == "chaos - Win32 Debug"

DEP_F90_CRETP=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	
NODEP_F90_CRETP=\
	".\Debug\PALET.mod"\
	

"$(INTDIR)\cretpalt.obj" : $(SOURCE) $(DEP_F90_CRETP) "$(INTDIR)"\
 "$(INTDIR)\PALET.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\comdlger.f90
DEP_F90_COMDL=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	{$(INCLUDE)}"\MSFWINTY.mod"\
	{$(INCLUDE)}"\MSFWIN.mod"\
	

"$(INTDIR)\comdlger.obj" : $(SOURCE) $(DEP_F90_COMDL) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\chaosinp.rc
DEP_RSC_CHAOS=\
	".\icon1.ico"\
	{$(INCLUDE)}"\afxres.h"\
	{$(INCLUDE)}"\winres.h"\
	

"$(INTDIR)\chaosinp.res" : $(SOURCE) $(DEP_RSC_CHAOS) "$(INTDIR)"
   $(RSC) $(RSC_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE=.\chaosdrv.f90

!IF  "$(CFG)" == "chaos - Win32 Release"

DEP_F90_CHAOSD=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	{$(INCLUDE)}"\MSFWIN.mod"\
	
NODEP_F90_CHAOSD=\
	".\Release\CHAOSCOM.mod"\
	".\Release\PALET.mod"\
	

"$(INTDIR)\chaosdrv.obj" : $(SOURCE) $(DEP_F90_CHAOSD) "$(INTDIR)"\
 "$(INTDIR)\PALET.mod" "$(INTDIR)\CHAOSCOM.mod"


!ELSEIF  "$(CFG)" == "chaos - Win32 Debug"

DEP_F90_CHAOSD=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	{$(INCLUDE)}"\MSFWIN.mod"\
	
NODEP_F90_CHAOSD=\
	".\Debug\CHAOSCOM.mod"\
	".\Debug\PALET.mod"\
	

"$(INTDIR)\chaosdrv.obj" : $(SOURCE) $(DEP_F90_CHAOSD) "$(INTDIR)"\
 "$(INTDIR)\PALET.mod" "$(INTDIR)\CHAOSCOM.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\chaoscom.f90

!IF  "$(CFG)" == "chaos - Win32 Release"

F90_MODOUT=\
	"CHAOSCOM"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\chaoscom.obj" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\CHAOSCOM.mod" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "chaos - Win32 Debug"

F90_MODOUT=\
	"CHAOSCOM"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\chaoscom.obj" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\CHAOSCOM.mod" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\chaos5.f90

"$(INTDIR)\chaos5.obj" : $(SOURCE) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\chaos4.f90

"$(INTDIR)\chaos4.obj" : $(SOURCE) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\chaos3.f90

"$(INTDIR)\chaos3.obj" : $(SOURCE) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\chaos.f90

!IF  "$(CFG)" == "chaos - Win32 Release"

DEP_F90_CHAOS_=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	{$(INCLUDE)}"\DIALOGM.mod"\
	{$(INCLUDE)}"\MT.mod"\
	
NODEP_F90_CHAOS_=\
	".\Release\CHAOSCOM.mod"\
	".\Release\INPUTINFO.mod"\
	

"$(INTDIR)\chaos.obj" : $(SOURCE) $(DEP_F90_CHAOS_) "$(INTDIR)"\
 "$(INTDIR)\CHAOSCOM.mod" "$(INTDIR)\INPUTINFO.mod"


!ELSEIF  "$(CFG)" == "chaos - Win32 Debug"

DEP_F90_CHAOS_=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	{$(INCLUDE)}"\DIALOGM.mod"\
	{$(INCLUDE)}"\MT.mod"\
	
NODEP_F90_CHAOS_=\
	".\Debug\CHAOSCOM.mod"\
	".\Debug\INPUTINFO.mod"\
	

"$(INTDIR)\chaos.obj" : $(SOURCE) $(DEP_F90_CHAOS_) "$(INTDIR)"\
 "$(INTDIR)\CHAOSCOM.mod" "$(INTDIR)\INPUTINFO.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\axis.f90

!IF  "$(CFG)" == "chaos - Win32 Release"

DEP_F90_AXIS_=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	
NODEP_F90_AXIS_=\
	".\Release\PLOTVAL.mod"\
	".\Release\VIDCONF.mod"\
	

"$(INTDIR)\axis.obj" : $(SOURCE) $(DEP_F90_AXIS_) "$(INTDIR)"\
 "$(INTDIR)\PLOTVAL.mod" "$(INTDIR)\VIDCONF.MOD"


!ELSEIF  "$(CFG)" == "chaos - Win32 Debug"

DEP_F90_AXIS_=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	
NODEP_F90_AXIS_=\
	".\Debug\PLOTVAL.mod"\
	".\Debug\VIDCONF.mod"\
	

"$(INTDIR)\axis.obj" : $(SOURCE) $(DEP_F90_AXIS_) "$(INTDIR)"\
 "$(INTDIR)\PLOTVAL.mod" "$(INTDIR)\VIDCONF.MOD"


!ENDIF 

# End Source File
# End Target
# End Project
################################################################################
