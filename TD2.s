;TD2

VAL1    DCD     0b00001001 ; 9
        MOV     r0, #32
        MOV     r1, #VAL1
        LDR     r1, [r1]

LOOP    CMP     r0, #0; on compare 32 Et 0
        BEQ     ENDLOOP ; on termine la loop si ils sont egaux
        AND     r2, r1, #1 ; le et logique du nb et de 1
        CMP     r2, #0; on compare le res du et logiqur avec 0
        ADDNE   r3, r3, #1; si on si pas egaux, cad c'est 1, on add 1 au registre
        LSR     r1,r1, #1; on incremete de 1
        SUB     r0, r0, #1; on décremente notre 32
        B       LOOP
ENDLOOP 