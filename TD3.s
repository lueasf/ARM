; TD3


; registres importants
r11 = fp = frame pointer, pointe sur le début de la pile, avant les var locales.
;SP = 13 = stack pointer, pointe toujours sur le sommet de la pile
;LR = 14 = Link register, ce qu'on garde en mémoire
;PC = 15 = Program counter , instruction suivante

; OP:  BL = Branch with Link, on va au label appelé




### 1
;def func: return
;i = 1
;fund()
;i += 1
; se traduit en

main       

           MOV     r0, #1
           BL      maFonction ; BL garde en mémoire l'adresse de la prochaine instruction en r14
           ADD     r0, r0, #1
           END
maFonction 
           MOV     PC, LR; LR=r14, PC=R15;





### 2
;def maFonctionA:
;   return
;def maFonctionB:
;   maFonctionA()
;   return
;i=1
;maFonctionB()
;i +=1

            ;       pile

            MOV     r0, #1 ; i =1
            BL      maFonctionB
            ADD     r0, r0, #1
            END
maFonctionB 
            BL      maFonctionA
            MOV     PC, LR;

maFonctionA 
            MOV     PC, LR; LR=r14, PC=R15; r13=SP

; sauf que non car ca boucle sur la ligne 9!
; car il ne peut pas garder deux instructions en mm temps


            MOV     r0, #1 ; i =1
            BL      maFonctionB
            ADD     r0, r0, #1
            END
maFonctionB 
            B      maFonctionA

maFonctionA 
            MOV     PC, LR; LR=r14, PC=R15;

; comme va juste le B, on ne linke pas prochaine instruction


; tas = le reste , pile = données des appels de fonctions

; CORRECTION

    STMFD r13!, {LR} ; ICI ON MET DANS LA PILE (STore Multiple Registers)
    ; pointée par r13, la valeur de LR
    LDMFD r13!, {PC} ; l'inverse, ici on dépile
    ; le ! sert a autoincrementer r13 (SP)



    MOV r0, #1    1
    BL maFonctionB 2
    ADD r0, r0, #1   3
    END 4
maFonctionA    5
    STMFD r13!, {LR} ;  6
    LDMFD r13!, {PC}    7
maFonctionB    8
    STMFD r13!, {LR}    9
    BL maFonctionA    10
    LDMFD r13!, {PC}    11
; en gros ici on arrive ligne 50, on pile la ligne 44(ADD)
; on va a fonctionA on  


pile : 
3 -> pc
11-> pc

PILE
ADDRESSE MÉM | CONTENU | SENS :
3 | ADD r0, r0, #1  | on ajoute 1 on r0
11 | LDMFD r13!, {PC} | on met dans LR la val dans la pile et on va a l'adresse de LR



### 3 AJOUT DE PARAMÈTRES
;def maFonction(i):
;   i = i+1
;i=1
;maFonction(i)

; TRAD :

main
    MOV r0, #1
    BL maFonctionA
    END

maFonctionA
    STMFD r13!,{LR}
    ADD r0, r0,#1
    LDMFR r13!,{PC}




### 4 
def maFonctionA(i):
    i=i+1
def maFonctionB(j):
    j=j+1
    maFonctionA(j)
k=1
maFonctionB(k)

            ;       TRAD :

main        
            MOV     r0, #1
            BL      maFonctionB ; on met la ligne 11 dans LR
            END

maFonctionA 
            STMFD   r13!, {r0, LR}
            ADD     r0, r0, #1
            LDMFD   r13!, {r0, PC}

maFonctionB 
            STMFD   r13!, {r0, LR} ; instruction sauvegarde les contenus des registres r0 et PC sur la pile,
            ;       puis décrémente automatiquement le registre de pile (r13, ou SP) pour se préparer à la sauvegarde suivante.
            ;CAD    : pareil que avec une val, on append deux fois

            ADD     r0, r0, #1
            BL      maFonctionA
            LDMFD   r13!, {r0, PC}





### 5
            ;def    maFonctionA(i):
            ;       return I + 1
            ;def    maFonctionB(j):
            ;       j=j+1
            ;       k = maFonctionA(j)
            ;       j=j+2
            ;       k += maFonctionA(j)
            ;       return k
            ;I      = 1
            ;maFonctionB(I)

main        
            MOV     r0, #1
            BL      maFonctionB
            END
maFonctionA 
            STMFD   r13!, {r0,LR}
            ADD     r1, r0, #1
            LDMFD   r13!, {r0,PC}
maFonctionB 
            STMFD   r13!,{r0,LR}
            ADD     r0,r0, #1
            BL      maFonctionA
            MOV     r2, r1
            ADD     r0, r0, #2
            BL      maFonctionA
            ADD     r1,r2,r1
            LDMFD   r13!, {r0, PC}
