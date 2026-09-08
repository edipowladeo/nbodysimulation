;       RETURN_A.ASM     MASM Subprogram
;       Implements FORTRAN RETURN{r,c} functions
;
;       INTERFACE TO REAL*4 FUNCTION returnr( )
;       END
;
;       INTERFACE TO COMPLEX*8 FUNCTION returnc( )
;       END

        .386
        .MODEL  FLAT, STDCALL
COMPLEX8 STRUCT  4
 real    REAL4   ?
 imag    REAL4   ?
COMPLEX8 ENDS

RETURNR  PROTO   STDCALL

RETURNC  PROTO   STDCALL, retval:PTR COMPLEX8

        .DATA

r       REAL4   5.
cr      REAL4   1.
ci      REAL4   2.
        .CODE

RETURNR  PROC    STDCALL

        fld     r       ; Load the real*4 value to return

        ret             ; Return with value on FPU stack

RETURNR  ENDP

RETURNC  PROC   STDCALL, retval:PTR COMPLEX8

        mov     edx, retval   ; Load address of return structure
        fld     cr            ; Load the real part

        fst     (COMPLEX8 PTR [edx]).real  ; Store in real part
        fld     ci            ; Load the imaginary part
        fst     (COMPLEX8 PTR [edx]).imag  ; Store in imag part
        mov     eax, edx      ; Move address of return structure to eax

        ret                   ; Return with address of structure in eax

RETURNC  ENDP

        END

