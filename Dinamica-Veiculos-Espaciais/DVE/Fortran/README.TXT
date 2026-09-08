
Microsoft Fortran PowerStation Readme 
=====================================

Readme Location
---------------
Last minute information on Fortran PowerStation is included in books online,
which can be viewed from Microsoft Developer Studio.  You must install
Microsoft Developer Studio to view this information.


Installation Problems
---------------------
There is no updated information about installing Fortran PowerStation.
If you are having problems installing, follow these steps:

1. Open the Microsoft Technical Support help file (PSS.HLP).  This file
   is located in the HELP directory if you are using a CD-ROM, or in the
   root directory of floppy disk 1 if you are using floppy disks.  To open
   the file, use File Manager (Windows NT) or Windows Explorer (Windows 95)
   and double click PSS.HLP in the appropriate location.  The help file 
   should then appear.

2. Review Fortran PowerStation Frequently Asked Questions.  The problem
   you are having may be explained by one of the question and answers.

3. If you are still having problems, contact Microsoft Technical Support
   using one of the methods discussed in the help file.


DMF: Using Disks with Distribution Media Format (Floppy Version Only)
---------------------------------------------------------------------
If you have a copy of Fortran PowerStation on 3.5" floppy disks, then
with the exception of the Setup disk (Disk 1), your Fortran
PowerStation disks use a new format called DMF (Distribution Media
Format). DMF increases the capacity of a 3.5-inch floppy disk, which
reduces the number of disks needed to install your application and
speeds up installation.

Because DMF is a new format, many existing utilities such as Norton
Disk Doctor, Microsoft ScanDisk, MS-DOS DiskCopy, and Microsoft
Windows Copy Disk do not recognize DMF. You should NOT use disk
utilities to examine a DMF formatted disk, as these utilities can
corrupt the DMF disk. You cannot copy DMF formatted disks using MS-DOS
DiskCopy or Microsoft Windows Copy Disk.  If you want to copy files
from the Setup disks, see "Extracting Files from DMF Disks," later in
this file.

Windows 95 and Windows NT 3.5 (or later) support DMF.

Extracting Files from DMF Disks:

If you need to copy the Fortran PowerStation disks for permanent
storage, you may use the copy switch (/C) with the EXTRACT.EXE utility
on Disk 1 to copy the Fortran PowerStation installation files to the
target location.

For example, after creating a directory called C:\DISKS on your hard
disk drive for the Fortran PowerStation files, copy all the files on
Disk 1 to that directory. (Since Disk 1 does not use DMF, you can use
the standard MS-DOS Copy command, COPY A:\*.* C:\DISKS.) Switch to
drive A and type the following command to copy the rest of the disks
to the directory C:\DISKS:

FOR %I IN (*.*) DO C:\DISKS\EXTRACT /C A:\%I C:\DISKS\%I

A cabinet (.CAB) file includes many files stored as a single file. If
you need only a single file that is contained in one of the cabinet
files, you may search for it using the /D switch with
EXTRACT.EXE. Once you find the file, you can use EXTRACT.EXE again to
copy the file to the desired location. You can also type EXTRACT /? to
get help on the EXTRACT command options. Here are some examples of how
to use the EXTRACT command to find files.

To list all files in a cabinet file:
EXTRACT /D A:\<cabinet filename>

To list all EXE files in a cabinet file:
EXTRACT /D A:\<cabinet filename> *.EXE

Here are some examples of how to use EXTRACT to copy a single file out
of a cabinet file.

To extract ANY.EXE to the current directory:
EXTRACT A:\<cabinet filename> ANY.EXE

To extract ANY.EXE to C:\FPS:
EXTRACT A:\<cabinet filename> /L C:\FPS ANY.EXE

