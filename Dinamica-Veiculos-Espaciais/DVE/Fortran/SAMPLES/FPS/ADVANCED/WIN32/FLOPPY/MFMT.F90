!/******************************************************************************\
!*       This is a part of the Microsoft Source Code Samples. 
!*       Copyright (C) 1993 Microsoft Corporation.
!*       All rights reserved. 
!*       This source code is only intended as a supplement to 
!*       Microsoft Development Tools and/or WinHelp documentation.
!*       See these sources for detailed information regarding the 
!*       Microsoft samples programs.
!\******************************************************************************/

!/*++
!
!Module Name:
!
!    mfmt.f90
!
!Abstract:
!
!    This program is designed to show how to access a physical floppy
!    disk using the Win32 API set.
!
!    This program has two major functions.
!
!        - It can be used to display the geometry of a disk
!
!            floppy -g a:
!
!        - It can be used to produce a disk image, or to write a disk
!          image to a floppy.
!
!            floppy -c a: bootdisk         - produce a disk image of a:
!
!            floppy -c bootdisk a:         - make a: identical to bootdisk image
!
!    This program is very very simple. Minimal error checking is done. It is
!    meant to provide an example of how to:
!
!        - Open a physical disk
!
!        - Read a disk's geometry
!
!        - Perform a low level format operation
!
!        - read and write physical sectors
!
!--*/

use msfwin
use mfmtinc

interface
integer*4 function GetDiskGeometry (hDisk, lpGeometry)
!MS$ATTRIBUTES VALUE :: hDisk
!MS$ATTRIBUTES VALUE :: lpGeometry
integer*4 hDisk 
integer*4 lpGeometry    
end function GetDiskGeometry

subroutine PrintGeometry (lpDriveName, lpGeometry)
!MS$ATTRIBUTES VALUE :: lpDriveName
!MS$ATTRIBUTES VALUE :: lpGeometry
integer*4   lpDriveName 
integer*4   lpGeometry 
end subroutine PrintGeometry

integer(4) function UnlockVolume (hDisk)
!MS$ATTRIBUTES VALUE :: hDisk
integer hDisk 
end function UnlockVolume

integer(4) function DismountVolume ( hDisk )
!MS$ATTRIBUTES VALUE :: hDisk
integer hDisk  
end function DismountVolume


integer(4) function GetSupportedGeometrys(hDisk)
!MS$ATTRIBUTES VALUE :: hDisk
integer*4   hDisk 
end function
end interface

character*(MAX_PATH)    Drive
integer(4)              hDrive, hDiskImage
type (T_DISK_GEOMETRY)  Geometry
integer                 i
character               c
character*25            p
character*4             DriveName
logical(4)              fUsage
logical(4)              fShowGeometry
logical(4)              fDiskImage 
logical(4)              SourceIsDrive
character*25            Source, Destination, DiskImage
integer*4               IoBuffer
integer*4               b
integer*4               BytesRead, BytesWritten
integer*4               FileSize
integer(4)              VirtBufSize
integer(4)              NumBufs
integer*4               GeometrySize
integer*4               argi, argc
integer*2               stat
integer*4               ret
integer*4               charcount
integer*4               lenSrc, lenDest
integer                 SupportedGeometryCount

data fUsage /.TRUE./, fShowGeometry /.FALSE./, fDiskImage /.FALSE./


   argc = nargs()  ! Get the number of command line arguments
   argi = 1

   if ( argc > 1 ) then
      fUsage = .FALSE.
      argc = argc -1 
      do while (argc > 0 ) 
         call getarg (argi, p, stat)
         p(stat+1:stat+1) = char(0)
         if (p(1:1) == '/'  .OR.  p(1:1) == '-') then
            charcount = 2
            do while (p(charcount:charcount) .NE. char(0))
               c = p(charcount:charcount)
               ret = charupperbuff(c,1 )
               select case (c)
                  case ('?')
                     fUsage = .TRUE.
                  case ('C')
                     fDiskImage = .TRUE.
                     argc = argc -1
                     argi = argi +1
                     call getarg (argi, Source, stat)
                     Source (stat+1:stat+1) = char(0)
                     argc = argc -1
                     argi = argi +1
                     call getarg (argi, Destination, stat)
                     Destination(stat+1:stat+1) = char(0)
                  case ('G')
                     argc = argc - 1
                     argi = argi + 1
                     call getarg(argi, DriveName, stat)
                     if ( (stat .NE. -1) .AND.                  &
                            ichar(DriveName(1:1)) .NE. 0 .AND. &                             
                           (IsCharAlpha(DriveName(1:1)) .NEQV. .FALSE.)) then
                           DriveName(stat+1:stat+1) = char(0)
                        fShowGeometry = .TRUE.
                     else
                        write (*,*) 'FLOPPY: Missing drive letter after -G'
                        write (*,*)
                        DriveName = '0'
                        fUsage = .TRUE.
                     end if

                  case DEFAULT
                     write (*, 30) c 
30                   FORMAT(' FLOPPY: Invalid switch - /', A)
                     fUsage = .TRUE.
               end select
               charcount = charcount + 1
            end do
         end if
         argc = argc -1
      end do
   end if

   if ( fUsage .NEQV. .FALSE.) then
      write (*,*) 'usage: FLOPPY switches'
      write (*,*) '            [-?] display this message'
      write (*,*) '            [-g drive] shows disk geometry'
      write (*,*) '            [-c source destination] produce diskimage'
      write (*,*)
      call ExitProcess(1)
   end if

   if ( fShowGeometry .NEQV. .FALSE. ) then
      write (Drive, 40) DriveName
40    FORMAT ('\\.\',A)

      NULLIFY(NULL_SECURITY_ATTRIBUTES)
      hDrive = CreateFile(      Drive, &
                IOR(GENERIC_READ , GENERIC_WRITE),  &
                0,                                  &
                NULL_security_attributes,                               &
                OPEN_EXISTING,                      &
                0,                                  &
                NULL                                &
               )
      if ( hDrive == INVALID_HANDLE_VALUE ) then
         write (*,50) DriveName, GetLastError()
50       format (' FLOPPY: Open ', A, ' failed ', I4 )
         write (*,*)
         call ExitProcess(1)
      end if

      if (LockVolume(hDrive) == 0) then
         write(*, 55) DriveName, GetLastError()
55       format (' FLOPPY:Locking volume ', A,' failed ' , I4 )
         call ExitProcess(1)
      end if

      if (GetDiskGeometry(hDrive,LOC(Geometry)) == 0 ) then
         write (*, 60)     DriveName, GetLastError()
60       format (' FLOPPY: GetDiskGeometry ', A, ' failed ', I4)
         write (*,*)
         call ExitProcess(1)
      end if

      call PrintGeometry(LOC(DriveName), LOC(Geometry))

      SupportedGeometryCount= GetSupportedGeometrys(hDrive)

      if ( SupportedGeometryCount == 0 ) then
         write(*,70) DriveName,GetLastError()
70       format (' FLOPPY: GetSupportedGeometrys ', A, ' failed ', I4)
         call ExitProcess(1)
      end if
      write (*,*) 
      write (*,80) DriveName
80    format(' Drive ', A,' supports the following disk geometries')
      write (*,*) 

      do i = 1, SupportedGeometryCount
         write (*,*)
         call PrintGeometry(NULL,LOC(SupportedGeometry(i)))
      end do

      write (*,*) 
      call ExitProcess(0)
   end if

   if ( fDiskImage .NEQV. .FALSE. ) then
      SourceIsDrive = .FALSE.
      lenSrc = lstrlen(Source)
      if ( Source(lenSrc:lenSrc) == ':' ) then
         SourceIsDrive = .TRUE.
         write ( Drive, 90 ) Source
90       format ('\\.\', A )
         DiskImage = Destination
      end if

      lenDest = lstrlen(Destination)

      if (Destination(lenDest:lenDest) == ':' ) then
         if ( SourceIsDrive .NEQV. .FALSE. ) then
            write(*,*) ('FLOPPY: Source and Destination cannot both be drives')
            write(*,*)
            call ExitProcess(1)
         end if
         SourceIsDrive = .FALSE.
         write (Drive,100) Destination
100      format ('\\.\', A)
         DiskImage = Source
   
      else
         if (SourceIsDrive .EQV. .FALSE.) then
            write(*,*) ('FLOPPY: Either Source or Destination must be a drive')
            write(*,*)
            call ExitProcess(1)
         end if
      end if

      !//
      !// Open and Lock the drive
      !//

      hDrive = CreateFile(                                          &
                  Drive,                                         &
                  IOR(GENERIC_READ , GENERIC_WRITE),                 &
                  0,                                                 &
                  NULL_security_attributes,                                              &
                  OPEN_EXISTING,                                     &
                  0,                                                 &
                  NULL                                               &
                  )
      if ( hDrive == INVALID_HANDLE_VALUE ) then
         write (*,110) DriveName, GetLastError()
110      format (' FLOPPY: Open ', A, ' failed ', I4 )
         write (*,*)
         call ExitProcess(1)
      end if

      if ( LockVolume(hDrive) == 0) then
         write(*, 115) DriveName, GetLastError()
115      format (' FLOPPY:LockVolume ', A,' failed ' , I4 )
         call ExitProcess(1)
      end if

      if (GetDiskGeometry(hDrive,LOC(Geometry)) == 0) then
         write (*,120) DriveName,GetLastError()
120      format (' FLOPPY: GetDiskGeometry ', A, ' failed ', I4)
         write (*,*)
         call ExitProcess(1)
      end if

      if (GetSupportedGeometrys(hDrive) == 0) then
         write (*,130) DriveName,GetLastError()
130      format (' FLOPPY: GetSupportedGeometrys ', A, ' failed ', I4)
         write (*,*)
         call ExitProcess(1)
      end if

      !//
      !// Open the disk image file
      !//
      if (SourceIsDrive .NEQV. .FALSE.) then
         hDiskImage = CreateFile(                                  &
                        DiskImage,                                 &
                        IOR(GENERIC_READ , GENERIC_WRITE),             &
                        0,                                             &
                        NULL_security_attributes,                                          &
                        CREATE_ALWAYS,                                 &
                        0,                                             &
                        NULL                                           &
                        )
      else
         hDiskImage = CreateFile(                                  &
                        DiskImage,                                &
                        IOR(GENERIC_READ , GENERIC_WRITE),             &
                        0,                                             &
                        NULL_security_attributes,                                          &
                        OPEN_EXISTING,                                 &
                        0,                                             &
                        NULL                                           &
                        )
      end if
     
      if ( hDiskImage == INVALID_HANDLE_VALUE ) then
         write (*,140) DiskImage,GetLastError()
140      format (' FLOPPY: Open ', A, ' failed ', I4)
         write (*,*)
         call ExitProcess(1)
      end if

      !//
      !// Now do the copy
      !//

      !//
      !// If we are copying from floppy to file, just do the copy
      !// Otherwise, we might have to format the floppy first
      !//

         if ( SourceIsDrive .NEQV. .FALSE. ) then

          !//
          !// Device reads must be sector aligned. VirtualAlloc will
          !// guarantee alignment
          !//

            NumBufs = Geometry%Cylinders%LowPart
            VirtBufSize = Geometry%TracksPerCylinder *  &
                        Geometry%SectorsPerTrack *    &
                        Geometry%BytesPerSector

            IoBuffer = VirtualAlloc(NULL, VirtBufSize, MEM_COMMIT, PAGE_READWRITE)

            if (IoBuffer == 0) then
                write (*,*) 'FLOPPY: Buffer Allocation Failed'
                write (*,*)
                call ExitProcess(1)
            end if
            do while (NumBufs .gt. 0)
                b = ReadFile(hDrive, IoBuffer, GeometrySize, LOC(BytesRead), NULL_overlapped)
                if ((b .AND. BytesRead) .NE. 0) then
                    b = WriteFile( hDiskImage, IoBuffer, BytesRead, LOC(BytesWritten), NULL_overlapped)
                    if ((b == 0) .OR. (BytesRead .NE. BytesWritten)) then
                        write (*, 150) GetLastError()
150                     format (' FLOPPY: Fatal Write Error ', I4)
                        write (*,*)
                        call ExitProcess(1)
                    end if
                else 
                    write (*, 160) GetLastError()
160                 format (' FLOPPY: Fatal Read Error ', I4)
                    write (*,*)
                    call ExitProcess(1)
                end if
            end do
         else 
            !//
            !// Check to see if the image will fit on the floppy. If it
            !// will, then LowLevelFormat the floppy and press on
            !//

            FileSize = GetFileSize(hDiskImage, NULL)

            b = FALSE
            do i = 0, SupportedGeometryCount-1 
               NumBufs = SupportedGeometry(i)%Cylinders%LowPart
               VirtBufSize =  SupportedGeometry(i)%TracksPerCylinder * &
                            SupportedGeometry(i)%SectorsPerTrack *   &
                              SupportedGeometry(i)%BytesPerSector
                                                  
               if ( VirtBufSize*NumBufs >= FileSize ) then
                  IoBuffer = VirtualAlloc(NULL, GeometrySize, MEM_COMMIT, PAGE_READWRITE)

                  if (IoBuffer .NE. 0 ) then
                     write (*,*) 'FLOPPY: Buffer Allocation Failed'
                     write (*,*)
                     call ExitProcess(1)
                  end if

         !//
         !// Format the floppy
         !//

                  ret = LowLevelFormat(hDrive, LOC(SupportedGeometry(i)))
                  do while (NumBufs > 0)
                     b = ReadFile( hDiskImage, IoBuffer, GeometrySize, &
                                      LOC(BytesRead), NULL_overlapped)
                     if ((b .NE. 0) .AND. (BytesRead .NE. 0)) then
                        b = WriteFile(hDrive, IoBuffer, BytesRead,    &
                                        LOC(BytesWritten), NULL_overlapped)
                        if ((b .NE. 0) .OR. (BytesRead .NE. BytesWritten )) then
                           write (*,170) GetLastError()
170                        format (' FLOPPY: Fatal Write Error ', I4 )
                           write (*,*)
                           call ExitProcess(1)
                        end if
                     else 
                        write (*,180) GetLastError()
180                     format (' FLOPPY: Fatal Read Error ', I4 )
                        write (*,*)
                        call  ExitProcess(1)
                     end if
                     b  = TRUE
                  end do
                  if (b == 0 ) then
                     write (*,190) FileSize,DriveName
190                  format ('FLOPPY: FileSize ', I4, ' is not supported on drive ', A)
                     write (*,*)
                     call  ExitProcess(1)
                  end if
               end if
  

         !//
         !// Dismounting forces the filesystem to re-evaluate the media id
         !// and geometry. This is the same as popping the floppy in and out
         !// of the disk drive
         !//

               ret = DismountVolume(hDrive)
               ret = UnlockVolume(hDrive)

               call ExitProcess(0)
            end do
         end if 
      end if 
end





