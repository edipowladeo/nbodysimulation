;       POWR2C_A.ASM     MASM Subprogram
;       Implements C Power2c function
;
;       INTERFACE TO INTEGER*4 FUNCTION
;      +             power2c [C,ALIAS:'_Power2c'] ( value, exponent )
;       INTEGER*4 value
;       INTEGER*1 exponent
;       END
;

        .386
        .MODEL  FLAT, C

Power2c PROTO   C, value:SDWORD, exponent:SBYTE

        .CODE

;       Power2c - computes value*2**exponent
;
;       arguments:      value    - the multiplier
;                       exponent - the exponent
;       returns:        Power2c  - value*2**exponent
;

Power2c PROC    C, value:SDWORD, exponent:SBYTE

        mov     eax, value      ; Load multiplier
        mov     cl, exponent    ; Load exponent
        shl     eax, cl         ; Multiply by 2**exponent
        ret                     ; Leave return value in eax

Power2c ENDP

        END

