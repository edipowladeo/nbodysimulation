!**************************************************************************\
!*  bitmap.f90 -- support for reading in and drawing bitmaps.
!**************************************************************************/
!**************************************************************************\
!*
!*  function:  DrawBitmap()
!*
!*  input parameters:  HDC, HBITMAP
!*
!*  Draw the bitmap into the hdc.  Source rectangle computed to use (null)
!*   whole bitmap.  Destination location is 0,0.
!*
!*  global variables: none.
!*
!**************************************************************************/
subroutine DrawBitmap (hdc, hbm)
use msfwina

integer*4 hdc, hbm


integer*4 f
integer*4 hdcBits
type (T_BITMAP)  bm

   hdcBits = CreateCompatibleDC(hdc)
   i = GetObject (hbm, 24, LOC(bm))
   i = SelectObject(hdcBits,hbm)
   f = BitBlt(hdc,0,0,bm%bmWidth, bm%bmHeight,hdcBits,0,0,SRCCOPY)
   i = DeleteDC(hdcBits)
end 
!**************************************************************************\
!*
!*  function:  GetBitmap()
!*
!*  input parameters:
!*   hdc - hdc to make the bitmap compatible with.
!*   hInst - instance handle
!*
!*  Put up a common dialog box to open a new *.BMP file.
!*   Once this is complete, open the file, read in the information,
!*   and create a compatible bitmap.
!*
!*  returns:  handle to the bitmap iff successful.  NULL otherwise.
!*
!**************************************************************************/
integer*4 function GetBitmap (hdc, hInst, monochrome)
use msfwina

integer*4                   hdc, hInst
logical*4                   monochrome
integer*4                   hbm
type (T_BITMAPFILEHEADER)   pbmfh
type (T_BITMAPINFOHEADER)   pbmih
integer*4                   pBits
integer*4                   fh
integer*4                   bfOffBits
integer*4                   nbytes
type (T_OPENFILENAME)       of
character*(MAX_PATH)        buffer
character*(MAX_PATH)        filter
character*(MAX_PATH)        WindowsDir

buffer(1:1) = char(0)
iret = lstrcpy(filter,"Bitmaps (*.BMP)|*.BMP||"C)
call convertfilterstring(filter)


iret = GetWindowsDirectory(WindowsDir,MAX_PATH)

! set up the OPENFILE structure,
! then use the appropriate common dialog
!
   of%lStructSize       = 76 !sizeof (OPENFILENAME)
   of%hwndOwner         = NULL
   of%hInstance         = hInst
   of%lpstrFilter       = LOC(filter)
   of%lpstrCustomFilter = NULL
   of%nMaxCustFilter    = 0
   of%nFilterIndex      = 0
   of%lpstrFile         = LOC(buffer)
   of%nMaxFile          = MAX_PATH
   of%lpstrFileTitle    = NULL
   of%nMaxFileTitle     = 0
   of%lpstrInitialDir   = LOC(WindowsDir)
   of%lpstrTitle        = NULL
   of%Flags             = OFN_HIDEREADONLY
   of%nFileOffset       = 0
   of%nFileExtension    = 0
   of%lpstrDefExt       = NULL
   of%lCustData         = 0
   of%lpfnHook          = NULL
   of%lpTemplateName    = NULL
   if (GetOpenFileName (of) .eqv. .FALSE.) then              
      GetBitmap = NULL
      return 
   end if

! Try to open the file.  If successful, then allocate space for it,
! and read in all of the bytes.
!
   fh = lopen (buffer, OF_READ)
   if (fh == -1) then
      GetBitmap = NULL
      return 
   end if
   nbytes = GetFileSize (fh, NULL)

!* The contents of the file are read in here in three parts.  First
!*  the bitmap file header is read, then the bitmap header along with
!*  the color table, then finally the actual bit data.  I.e. from
!*  a total of nbytes...
!*    1.  sizeof (BITMAPFILEHEADER)
!*    2.  bfOffBits- sizeof (BITMAPFILEHEADER)
!*    3.  (nbytes - bfOffBits)
!*

!* read in the bitmap file header.  save the offset to bits.*/
   itemppbmfh = LocalAlloc (LPTR, 14)
   i = lread (fh, itemppbmfh, 14)
   call CopyMemory (LOC(pbmfh), itemppbmfh, 14)

   bfOffBits=pbmfh%bfOffBits

!* read in the bitmap info header and the color table right after it.
!* both BITMAPINFOHEADER and BITMAPINFO needed for CreateDIBitmap()
!*
   i = lread (fh, LOC(pbmih), bfOffBits - 14)

! finally read in the bit data. 
    pBits = LocalAlloc (LPTR, (nbytes - bfOffBits))
    if (pBits == NULL) then
        GetBitmap = 0
        return
    end if

   i = lread (fh, pBits, (nbytes - bfOffBits))


!* in the case of desiring a monochrome bitmap (input parameter),
!*  verify that is what we got.  If it is, then use CreateBitmap,
!*  else use a device independent bitmap.
!*
    if (monochrome .neqv. .FALSE.) then
        if (pbmih%biBitCount .ne. 1) then
            iret = MessageBox (NULL, "Mask must be monochrome bitmap."C, &
                    "Error"C, IOR(MB_APPLMODAL , IOR(MB_ICONSTOP , MB_OK)))
            hbm = NULL
        else
            hbm = CreateBitmap (pbmih%biWidth, pbmih%biHeight,    &
                                pbmih%biPlanes, pbmih%biBitCount, &
                                pBits)
        endif
    else  ! bitmap is NOT monochrome, use DIB. 
        hbm = CreateDIBitmap (hdc, LOC(pbmih), CBM_INIT,          &
                     pBits, LOC(pbmih), DIB_RGB_COLORS)
    end if


! hbm is set... free up memory, and return 
   i  = lclose (fh)
   i = LocalFree (LocalHandle(pBits))
   GetBitmap = hbm
   return
end
