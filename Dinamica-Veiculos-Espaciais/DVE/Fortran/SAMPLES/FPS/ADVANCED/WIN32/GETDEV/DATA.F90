
!data (DevCap(i)%val, i=1,NINDEX) / 0,2,4,6,8,10,12,14,16,18,20,22, &
!    24,26,28,30,32,34,36,38,40,42,44,88,90,104,106,108 /
DevCap(1)%val = 0
DevCap(2)%val = 2
DevCap(3)%val = 4
DevCap(4)%val = 6
DevCap(5)%val = 8
DevCap(6)%val = 10
DevCap(7)%val = 12
DevCap(8)%val = 14
DevCap(9)%val = 16
DevCap(10)%val = 18
DevCap(11)%val = 20
DevCap(12)%val = 22
DevCap(13)%val = 24
DevCap(14)%val = 26
DevCap(15)%val = 28
DevCap(16)%val = 30
DevCap(17)%val = 32
DevCap(18)%val = 34
DevCap(19)%val = 36
DevCap(20)%val = 38
DevCap(21)%val = 40
DevCap(22)%val = 42
DevCap(23)%val = 44
DevCap(24)%val = 88
DevCap(25)%val = 90
DevCap(26)%val = 104
DevCap(27)%val = 106
DevCap(28)%val = 108 

!data (DevCap(i)%String, i=1,NINDEX) / &
DevCap(1)%String =  "DRIVERVERSION "
DevCap(2)%String =  "TECHNOLOGY    "
DevCap(3)%String =  "HORZSIZE      "
DevCap(4)%String =  "VERTSIZE      "
DevCap(5)%String =  "HORZRES       "
DevCap(6)%String =  "VERTRES       "
DevCap(7)%String =  "BITSPIXEL     "
DevCap(8)%String =  "PLANES        "
DevCap(9)%String =  "NUMBRUSHES    "
DevCap(10)%String =  "NUMPENS       "
DevCap(11)%String =  "NUMMARKERS    "
DevCap(12)%String =  "NUMFONTS      "
DevCap(13)%String =  "NUMCOLORS     "
DevCap(14)%String =  "PDEVICESIZE   "
DevCap(15)%String =  "CURVECAPS     "
DevCap(16)%String =  "LINECAPS      "
DevCap(17)%String =  "POLYGONALCAPS "
DevCap(18)%String =  "TEXTCAPS      "
DevCap(19)%String =  "CLIPCAPS      "
DevCap(20)%String =  "RASTERCAPS    "
DevCap(21)%String =  "ASPECTX       "
DevCap(22)%String =  "ASPECTY       "
DevCap(23)%String =  "ASPECTXY      "
DevCap(24)%String =  "LOGPIXELSX    "
DevCap(25)%String =  "LOGPIXELSY    "
DevCap(26)%String =  "SIZEPALETTE   "
DevCap(27)%String =  "NUMRESERVED   "
DevCap(28)%String =  "COLORRES      "


!/* Device Technologies */
!data (Device(i)%val, i=1,NDevice) / 0,1,2,3,4,5,6 /
Device(1)%val = 0
Device(2)%val = 1
Device(3)%val = 2
Device(4)%val = 3
Device(5)%val = 4
Device(6)%val = 5
Device(7)%val = 6

!data (Device(i)%String, i=1,NDevice) / &
Device(1)%String =  "DT_PLOTTER   "
Device(2)%String =  "DT_RASDISPLAY"
Device(3)%String =  "DT_RASPRINTER"
Device(4)%String =  "DT_RASCAMERA "
Device(5)%String =  "DT_CHARSTREAM"
Device(6)%String =  "DT_METAFILE  "
Device(7)%String =  "DT_DISPFILE  "



!/* Curve Capabilities */
!data (CurveCap(i)%val, i=1,NCurveCaps) / 0,1,2,4,8,16,32,64,128 /
CurveCap(1)%val = 0
CurveCap(2)%val = 1
CurveCap(3)%val = 2
CurveCap(4)%val = 4
CurveCap(5)%val = 8
CurveCap(6)%val = 16
CurveCap(7)%val = 32
CurveCap(8)%val = 64
CurveCap(9)%val = 128

!data (CurveCap(i)%String, i=1,NCurveCaps) /       &
CurveCap(1)%String =   "CC_NONE      "
CurveCap(2)%String =   "CC_CIRCLES   "
CurveCap(3)%String =   "CC_PIE       "
CurveCap(4)%String =   "CC_CHORD     "
CurveCap(5)%String =   "CC_ELLIPSES  "
CurveCap(6)%String =   "CC_WIDE      "
CurveCap(7)%String =   "CC_STYLED    "
CurveCap(8)%String =   "CC_WIDESTYLED"
CurveCap(9)%String =   "CC_INTERIORS "

!/* Line Capabilities */
!data (LineCap(i)%val, i=1, NLineCaps) / 0,2,4,8,16,32,64,128 /

LineCap(1)%val = 0
LineCap(2)%val = 2
LineCap(3)%val = 4
LineCap(4)%val = 8
LineCap(5)%val = 16
LineCap(6)%val = 32
LineCap(7)%val = 64
LineCap(8)%val = 128

!data (LineCap(i)%String, i=1,NLineCaps) /       &
LineCap(1)%String =   "LC_NONE       "
LineCap(2)%String =   "LC_POLYLINE   "
LineCap(3)%String =   "LC_MARKER     "
LineCap(4)%String =   "LC_POLYMARKER "
LineCap(5)%String =   "LC_WIDE       "
LineCap(6)%String =   "LC_STYLED     "
LineCap(7)%String =   "LC_WIDESTYLED "
LineCap(8)%String =   "LC_INTERIORS  "

!/* Polygonal Capabilities */
!data (PolygonalCap(i)%val, i=1, NPolygonalCaps)  &
!       / 0,1,2,4,4,8,16,32,64,128 /

PolygonalCap(1)%val = 0
PolygonalCap(2)%val = 1
PolygonalCap(3)%val = 2
PolygonalCap(4)%val = 4
PolygonalCap(5)%val = 4
PolygonalCap(6)%val = 8
PolygonalCap(7)%val = 16
PolygonalCap(8)%val = 32
PolygonalCap(9)%val = 64
PolygonalCap(10)%val = 128

!data (PolygonalCap(i)%String, i=1, NPolygonalCaps) /       &
PolygonalCap(1)%String =   "PC_NONE       "
PolygonalCap(2)%String =   "PC_POLYGON    "
PolygonalCap(3)%String =   "PC_RECTANGLE  "
PolygonalCap(4)%String =   "PC_WINDPOLYGON"
PolygonalCap(5)%String =   "PC_TRAPEZOID  "  !// HACK   two 4's
PolygonalCap(6)%String =   "PC_SCANLINE   "
PolygonalCap(7)%String =   "PC_WIDE       "
PolygonalCap(8)%String =   "PC_STYLED     "
PolygonalCap(9)%String =   "PC_WIDESTYLED "
PolygonalCap(10)%String =   "PC_INTERIORS  "

!/* Clip Capabilities */
!data (ClipCap(i).val, i=1,NClipCaps) / 0,1 /
ClipCap(1)%val = 0
ClipCap(2)%val = 1

!data (ClipCap(i).String, i=1,NClipCaps) /       &
ClipCap(1)%String =   "CP_NONE     "C
ClipCap(2)%String =   "CP_RECTANGLE"C

!/* Text Capabilities */
!data (TextCap(i)%val, i=1,NTextCaps) /  &
TextCap(1)%val =   #0001
TextCap(2)%val =   #0002
TextCap(3)%val =   #0004
TextCap(4)%val =   #0008
TextCap(5)%val =   #0010
TextCap(6)%val =   #0020
TextCap(7)%val =   #0040
TextCap(8)%val =   #0080
TextCap(9)%val =   #0100
TextCap(10)%val =  #0200
TextCap(11)%val =  #0400
TextCap(12)%val =  #0800
TextCap(13)%val =  #1000
TextCap(14)%val =  #2000
TextCap(15)%val =  #4000
TextCap(16)%val =  #8000

!data (TextCap(i)%String, i=1,NTextCaps) /       &
TextCap(1)%String =  "TC_OP_CHARACTER"
TextCap(2)%String =  "TC_OP_STROKE   "
TextCap(3)%String =  "TC_CP_STROKE   "
TextCap(4)%String =  "TC_CR_90       "
TextCap(5)%String =  "TC_CR_ANY      "
TextCap(6)%String =  "TC_SF_X_YINDEP "
TextCap(7)%String =  "TC_SA_DOUBLE   "
TextCap(8)%String =  "TC_SA_INTEGER  "
TextCap(9)%String =  "TC_SA_CONTIN   "
TextCap(10)%String = "TC_EA_DOUBLE   "
TextCap(11)%String = "TC_IA_ABLE     "
TextCap(12)%String = "TC_UA_ABLE     "
TextCap(13)%String = "TC_SO_ABLE     "
TextCap(14)%String = "TC_RA_ABLE     "
TextCap(15)%String = "TC_VA_ABLE     "
TextCap(16)%String = "TC_RESERVED    "

!/* Raster Capabilities */
!data (RasterCap(i)%val, i=1, NRasterCaps) / 1,2,4,8,#0010,#0080, &
!     #0100, #0200, #0400, #0800, #1000, #2000 /

RasterCap(1)%val =   1
RasterCap(2)%val =   2
RasterCap(3)%val =   4
RasterCap(4)%val =   8
RasterCap(5)%val =   #0010
RasterCap(6)%val =   #0080
RasterCap(7)%val =   #0100
RasterCap(8)%val =   #0200
RasterCap(9)%val =   #0400
RasterCap(10)%val =  #0800
RasterCap(11)%val =  #1000
RasterCap(12)%val =  #2000 

!data (RasterCap(i)%String, i=1, NRasterCaps) /       &
RasterCap(1)%String =   "RC_BITBLT       "
RasterCap(2)%String =   "RC_BANDING      "
RasterCap(3)%String =   "RC_SCALING      "
RasterCap(4)%String =   "RC_BITMAP64     "
RasterCap(5)%String =   "RC_GDI20_OUTPUT "
RasterCap(6)%String =   "RC_DI_BITMAP    "
RasterCap(7)%String =   "RC_PALETTE      "
RasterCap(8)%String =   "RC_DIBTODEV     "
RasterCap(9)%String =   "RC_BIGFONT      "
RasterCap(10)%String =  "RC_STRETCHBLT   "
RasterCap(11)%String =  "RC_FLOODFILL    "
RasterCap(12)%String =  "RC_STRETCHDIB   "

