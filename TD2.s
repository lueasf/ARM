;TD2

VAL1    DCD     0b00001001 ; on definit notre valeur en binaire dans VAL1
        MOV     r0, #32 ; on met 32 dans r0
        MOV     r1, #VAL1 ; on met l'adresse de VAL1 dans r1
        LDR     r1, [r1] ; on charge la valeur de VAL1 dans r1

LOOP    CMP     r0, #0; on compare 32 Et 0
        BEQ     ENDLOOP ; on termine la loop si ils sont egaux
        AND     r2, r1, #1 ; on fait un et logique entre r1 et 1 et on met le resultat dans r2 ( le res du et logique est 1 si les deux bits sont 1, 0 sinon)
        CMP     r2, #0; on compare le res du et logiqur avec 0
        ADDNE   r3, r3, #1; si on si pas egaux, cad c'est 1, on add 1 au registre
        ADD     r1,r1, #1; on incremete de 1
        SUB     r0, r0, #1; on décremente notre 32
        B       LOOP
ENDLOOP 

; bit de poids faible = le dernier bit indiquant la parité.