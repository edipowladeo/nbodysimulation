
all: dialogm.lib dialogm.mod dialogt.mod

FFLAGS =
#FFLAGS = /Zi /DDEBUG

dlglow.obj : dlglow.cpp
	cl /c /Z7 /Zl /DWIN32 /D_NTWIN /D_CONSOLE dlglow.cpp

DLGLOW = dlglow.obj

dialogm.obj dialogm.mod dialogt.mod : dialogm.f90
	fl32 $(FFLAGS) -Zl -c dialogm.f90

dialogm.lib : dialogm.obj $(DLGLOW)
	lib -out:dialogm.lib dialogm.obj $(DLGLOW)

