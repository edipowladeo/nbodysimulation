
all:	fspline.exe fspl_dll.exe

# Linked directly to spline.for...
fspline.exe:	fspline.for spline.for 
	fl32 fspline.for spline.for /DLINKDIRECT

# Using DLL instead...
fspl_dll.exe:	fspline.for spline.lib
	fl32 /Fefspl_dll.exe fspline.for spline.lib
	
clean:
	del fspline.obj

