@echo off
echo *
if not exist .\network.bat goto badpath
if not exist .\netpid.exe goto badpath
echo * This batch file will install Fortran PowerStation on a network server,
echo * so that it can be later installed on a network client.  
echo *
echo * Fortran PowerStation requires approximately 90 megabytes of free disk
echo * space for the standard edition, approximately 120 megabytes for
echo * the professional edition.  No check is made of free disk space in 
echo * this batch file, so before starting please be sure enough disk space
echo * is available on the server disk.
echo *
if "%1" == "" goto usage
if exist %1 goto empty
pause
echo *
echo * While copying, be sure to fill out and mail in your yellow
echo * product registration card...
echo *
echo * Making Directories (root is %1)...
mkdir %1
if errorlevel 1 goto error
mkdir %1\fpssetup
if errorlevel 1 goto error
mkdir %1\bin
if errorlevel 1 goto error
mkdir %1\include
if errorlevel 1 goto error
mkdir %1\lib
if errorlevel 1 goto error
mkdir %1\help
if errorlevel 1 goto error
mkdir %1\redist
if errorlevel 1 goto error
mkdir %1\projects
if errorlevel 1 goto error
mkdir %1\numrec
if errorlevel 1 goto error
echo * Copying Files...
xcopy ..\bin %1\bin /s/v/q
if errorlevel 1 goto error
xcopy ..\include %1\include /s/v/q
if errorlevel 1 goto error
xcopy ..\lib %1\lib /s/v/q
if errorlevel 1 goto error
xcopy ..\help %1\help /s/v/q
if errorlevel 1 goto error
xcopy ..\redist %1\redist /s/v/q
if errorlevel 1 goto error
xcopy ..\projects %1\projects /s/v/q
if errorlevel 1 goto error
xcopy ..\numrec %1\numrec /s/v/q
if errorlevel 1 goto error
copy ..\setup.exe %1 /v
if errorlevel 1 goto error
copy ..\setup.ini %1 /v
if errorlevel 1 goto error
copy ..\setup.tdf %1 /v
if errorlevel 1 goto error
copy ..\setup.lst %1 /v
if errorlevel 1 goto error
copy .\acmsetup.exe %1\fpssetup
if errorlevel 1 goto error
copy .\acmsetup.hlp %1\fpssetup
if errorlevel 1 goto error
copy .\complinc.dll %1\fpssetup
if errorlevel 1 goto error
copy .\f90setup.dll %1\fpssetup
if errorlevel 1 goto error
copy .\mssetup.dll %1\fpssetup
if errorlevel 1 goto error
copy .\msvcrt20.dll %1\fpssetup
if errorlevel 1 goto error
copy .\setup.inf %1\fpssetup
if errorlevel 1 goto error
copy .\network.stf %1\fpssetup\setup.stf
if errorlevel 1 goto error
.\netpid %1
if errorlevel 1 goto error
echo *
echo * You are now ready to install Fortran PowerStation from a network client.
echo * To install from a client, run %1\setup.exe.  
echo * To save disk space by using the files on the server directly,
echo * choose the "Workstation" installation.
echo *
echo * If you are running Shared Windows, you need to run setup from one
echo * of the client machines, with write access to the Windows directory.
echo * After this first install, the Windows directory can again be made
echo * read only.
echo *
goto done
:badpath
echo * ERROR: Please run network.bat from the FPSSETUP directory of your 
echo * Fortran PowerStation CD-ROM.
goto done
:error
echo * ERROR: An error occurred while copying.  You may be out of disk space.
goto done
:usage
echo * ERROR: usage: network.bat directory_to_install_into
goto done
:empty
echo * ERROR: The directory %1 exists.  
echo * Please give the name of a new directory for Fortran PowerStation.  
echo * A good choice is C:\MSAPPS\MSFPS40.
:done
