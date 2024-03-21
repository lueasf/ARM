;TD 1 

;Instructions simples : 
;MOV, ADD, SUB ( r2, r0, r1 cad dans r2 on met r0 – r1) 
;LSL r4, r3, #3 ; dans r4 on met r3 décalé de 3 bits. 
;Nous avons les Labels à gauche. 
; mettre une valeur en dur : LDR rx = 0x...


;EXE1
VAL1 DCD 10 ; DEFINITION DE VALEUR, DS val1 on stoque l'adresse mémoire de la valeur 10
VAL2 DCD 20 
RES  FILL 4 ; RESERVATION D'UN ESPACE MÉMOIRE de 4 octets

     MOV r2, #0x20 ; dans r2 on stoque la valeur ox20

     ADR r0,VAL1 ; dans le registre r0 on stoque l'adresse memoire VAL1
     ADR r1,VAL2
     ADR r2,RES

     LDR r3, [r0] ; dans r3, on stoque la valeur de r0, qui est donc la valeur de l'adresse mémoire, qu est 10
     LDR r4, [r1] ; pareil

JUMP ADD r5, r3, r4 ; on fait la somme des valeurs dans r3 et r4, on met le tout dans r5

     STR r5, [r2] ;dans r2, on écrit l'adresse mémoire contenue dans r5, c'est l'inverse de LDR.

     END ; pseudo commande, seul ADR, LDR et STR sont des vrais "commandes" qui discutent avec le CPU
     
     
;PILE :
;val1 = ad(10)
;val2 = ad(20)

;r0 = ad(val1)
;r1 = ad(val1)
;r2 = ad(30)
;r3 = 10
;r4 = 20
;r5 = 30