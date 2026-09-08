
all:	fspline.exe fspl_dll.exe

fspline.exe:	fspline.f90 spline.for
	fl32 /MW fspline.f90 spline.for /DLINKDIRECT

fspl_dll.exe:	fspline.f90 spline.lib
	fl32 /Fefspl_dll.exe /MW fspline.f90 spline.lib

clean:
	del fspline.obj
	del fspline.mod
