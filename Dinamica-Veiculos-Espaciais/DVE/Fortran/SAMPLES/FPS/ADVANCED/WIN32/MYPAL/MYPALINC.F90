module mypalinc
use msfwina

integer*2, parameter, public :: PALETTESIZE     = 256    ! Number of entries in the system palette     

type RGPT        ! Values for setting Min Max info
    integer*4 iInfo(10)
end type

integer*4       hPal                ! Handle to the application's logical palette 
integer*4       nSizeX              ! Width of the application window             
integer*4       nSizeY              ! Height of the application window            
integer*4       pLogPal (259)       ! Pointer to program's logical palette        
integer*4       nXBorder            ! Width of window border                      
integer*4       nXTitle             ! Width of title bar                          
integer*4       nYTitle             ! Height of title bar                         
logical(4)      bCaptureOn          ! Indicates if mouse capture is on            
integer*2       iIndex              ! Last index selected in palette              
character*90    szTitlebuf          ! Buffer for pixel and palette info. text     
integer*4       hDCGlobal           ! The Screen DC                               
integer*4       iNumColors          ! Number of colors supported by device        
integer*4       iRasterCaps         ! Raster capabilities                         
type(T_RECT)    rClientRect         ! Client rectangle coordinates                
integer*4       dwPal(PALETTESIZE)  ! Stores palette entries for later lookup     
integer*4       iGlobalXOffset
integer*4       iGlobalYOffset
integer*4       iYMiddle

end module mypalinc

