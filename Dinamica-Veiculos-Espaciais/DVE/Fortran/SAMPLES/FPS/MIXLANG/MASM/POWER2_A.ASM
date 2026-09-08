;       POWER2_A.ASM     MASM Subprogram
;       Implements power2 function
;
;       INTERFACE TO INTEGER*4 FUNCTION power2 ( value, exponent )
;       INTEGER*4 value
;       INTEGER*1 exponent
;       END
;

        .386
        .MODEL  FLAT, STDCALL

POWER2  PROTO   STDCALL, value:PTR SDWORD, exponent:PTR SBYTE

        .CODE
;       power2 - computes value*2**exponent
;
;       arguments:      value - the multiplier
;                       exponent - the exponent
;       returns:        power2 - value*2**exponent
;

POWER2  PROC   STDCALL, value:PTR SDWORD, exponent:PTR SBYTE

        mov     ecx, value      ; Load address of multiplier
        mov     eax, [ecx]      ; Load multiplier
        mov     ecx, exponent   ; Load address of exponent
        mov     cl, [ecx]       ; Load exponent
        shl     eax, cl         ; Multiply by 2*exponent
        ret                     ; Leave return value in eax

POWER2  ENDP

        END

