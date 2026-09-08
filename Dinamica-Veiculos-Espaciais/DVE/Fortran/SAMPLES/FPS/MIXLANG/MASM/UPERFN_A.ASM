;      UPERFN_A.ASM     MASM Subprogram
;      Implements FORTRAN UPPERFN function
;
;      INTERFACE TO CHARACTER*(*) FUNCTION upperfn( text )
;      CHARACTER*(*) text
;      END

        .386
        .MODEL  FLAT, STDCALL
UPPERFN PROTO   STDCALL, retval:PTR SBYTE,
                         lretval:DWORD,
                         text:PTR SBYTE,
                         ltext:DWORD

        .CODE

; UPPERFN - return an uppercase copy of a FORTRAN character string
;
; arguments:      retval   - hidden address for returning string
;                 lretval  - length to return in the string
;                 text     - the character string to convert
;                 ltext    - the length of the character string
;
;       Note that a FORTRAN function that returns a character string
;       passes the address and the length of a string where the
;       returned string should be placed.


UPPERFN PROC    STDCALL USES edi esi,
                retval:PTR SBYTE,
                lretval:DWORD,
                text:PTR SBYTE,
                ltext:DWORD

        mov     esi, text       ; Load addresses of both strings
        mov     edi, retval
        mov     edx, ltext      ; Load length of both strings
        mov     ecx, lretval
        cmp     ecx, edx        ; Figure out which is longer
        jbe     next            ; If destination smaller, truncate
        xchg    ecx, edx        ; Else blank pad
        sub     edx, ecx        ; Calculate number of blanks to pad
next:
        lodsb                   ; Load the next character
        cmp     al, 'a'	         ; Check start of lowercase alpha

        jb      gotcase    ; Do next char if less, continue otherwise
        cmp     al, 'z'	         ; Check end of lowercase alpha
        ja      gotcase    ; Do next char if greater, continue otherwise
        sub     al, 32          ; Convert to uppercase
gotcase:
        stosb                   ; Store character to destination string
        loop    next            ; Until all characters copied

        cmp     edx, ltext      ; If edx is unchanged, we're done
        je      done
        mov     al, ' '         ; Load space
        mov     ecx, edx        ; Copy count of spaces left
        rep     stosb           ; Store them to return address
done:
        mov     eax, retval     ; Load return address


        ret                     ; Return with return address in eax

UPPERFN ENDP

        END




