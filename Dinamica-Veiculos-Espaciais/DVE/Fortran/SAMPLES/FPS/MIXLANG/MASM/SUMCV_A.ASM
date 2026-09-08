;       SUMCV_A.ASM     MASM Subprogram
;       Implements C sumcv function
;
;       INTERFACE TO INTEGER FUNCTION sumcv [C,VARYING] ( nterms, term )
;       INTEGER nterms, term
;       END
;

        .386
        .MODEL  FLAT, C

sumcv   PROTO   C, nterms:SDWORD, term:VARARG

        .CODE
;       sumcv - computes the sum of a variable number of integer terms;
;                 does not check for overflow of sum
;
;       arguments:      nterms - the number of terms to sum
;                       term   - the term(s) in the sum
;       returns:        sumcv = summation[i=1,nterms]( term(i) )
;

sumcv   PROC   C USES ebx, nterms:SDWORD, term:VARARG

        sub     eax, eax        ; Load sum of 0 terms
        sub     ebx, ebx        ; Clear base register
        mov     ecx, nterms	     ; Load number of terms


        .WHILE  ecx > 0
        add     eax, term[ebx]  ; Add term to sum
        dec     ecx             ; One less sum to add
        add     ebx, 4          ; Adjust for next term
        .ENDW
done:
        ret                     ; Leave return value in eax

sumcv   ENDP

        END

