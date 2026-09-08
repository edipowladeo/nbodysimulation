module tlsin
integer, parameter, public :: NUMTHREADS            = 3   ! The number of threads to start 
integer, parameter, public :: TLS_MINIMUM_AVAILABLE     = 64

!Globals

integer     TlsIndex       ! Global TLS index 
integer     TlsCount       ! a counter for data in TLS storage 
character   chTlsCount(3)  ! string for counter values 

common /globdata/ TlsIndex,TlsCount

end module
