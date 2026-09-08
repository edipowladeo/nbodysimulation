;       UPPER_A.ASM     MASM Subprogram
;       Implements FORTRAN UPPER subroutine with
;
;       INTERFACE TO SUBROUTINE upper ( text )
;       CHARACTER*(*) text
;       END
;

        .386
        .MODEL  FLAT, STDCALL

UPPER   PROTO   STDCALL, text:PTR SBYTE, ltext:DWORD

        .CODE

;       UPPER - converts a FORTRAN character string to uppercase
;
;       arguments:      text  - the character string to convert
;                       ltext - the length of the character string
;
;   Note that a FORTRAN procedure with character string arguments passes
;   a hidden integer argument with each character string that contains
;   the length of that string.

UPPER   PROC    STDCALL, text:PTR SBYTE, ltext:DWORD

        mov     edx, text  ; Load address of start of string
        mov     ecx, edx   ; Copy start address
        add     ecx, ltext ; Compute address of end of string
        jmp     first      ; Go to start of loop

next:
        mov     al, [edx]  ; Load the next character
        inc     edx        ; Increment character address
        cmp     al, 'a'    ; Check start of lowercase alpha
        jb      first      ; Do next char if less, continue otherwise
        cmp     al, 'z'    ; Check end of lowercase alpha
        ja      first      ; Do next char if greater, continue otherwise
        sub     al, 32     ; Convert to uppercase
        mov     [edx-1], al ; Put character back into string
first:
        cmp     edx, ecx   ; See if end of string reached
        jbe     next       ; Continue if not at end

        ret                ; Return if at end of string

UPPER   ENDP

        END

