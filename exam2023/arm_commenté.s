          ;       r13 fin/haut de la pile
          ;r11    première adresse ou on commence une nouvelle fonction
MAIN      
          MOV     r11, r13 ; on met r13 dans r11 (car début de la fonction et rien n'est écrit avant

          ;       les variables locales
          SUB     r13, r13, #4*2 ; on descend r13 de 2 crans (on préallou la place pour hamonie et concert)
          MOV     r0, #2 ; on met 2 dans le registre 0
          STR     r0, [r11, #-4] ; on stocke le registre r0 dans la pile ( à l'adresse r11 - 4)
          MOV     r0, #0 ; on met concert dans r0
          STR     r0, [r11, #-4*2] ; on la stock en dessous de haromnie (r11 - 8)

          ;       apelle de la fonction
          LDR     r0, [r11, #-4]; charge la valeur de harmonie dans r0
          SUB     r13, r13, #4 ; on descend la fin de pile de -4
          STR     r0, [r13] ; on stocke r0 dans la 3eme case de la pile ( en tant que argument d'entrée de hannah)
          SUB     r13, r13, #4 ; on descend r13 de 4 ( on préalloue la variable de sortie si il y en a une)
          BL      HANNAH ; on rentre dans hannah


          LDR     r0, [r13]
          MOV     r13, r11
          END

HANNAH    
          STMFD   r13!, {r0, r1, r11, LR} ;on stocke tout les registres qui n'ont pas leurs valeurs par défault avant de commencer la fct
          ;       on déplace r13 de 4crans et on stock les 4 registres
          ; LR repartir a la ligne 21 (LDR r0, [r13]
          MOV     r11, r13 ; on place l'adresse du début de fonction

          ; définition des variables locales
          SUB     r13, r13, #4*5 ; j'alloue 5 crans car 5 variables locales
          MOV     r0, #0 ; on définit miley dans le registre
          STR     r0, [r11, #-4] ; on le place dans la mémoire 
          MOV     r0, #4 ; on définit wig 
          STR     r0, [r11, #-4*2] ; on le place dans la mémoire
          MOV     r0, #20 ; on définit wreckingball
          STR     r0, [r11, #-4*3] ; on le place dans la mémoire
          MOV     r0, #30 ; on définit flowers
          STR     r0, [r11, #-4*4] ; on le place dans la mémoire
          MOV     r0, #0 ; on définit music 
          STR     r0, [r11, #-4*5] ; on le place dans la mémoire

        ; apelle de la fonction
          MOV     r0, #0 ; on remet a 0 r0
          ADD     r0, r11, #-4 ; on met dans r0 l'adresse de miley qui vaut r11-4
          SUB     r13, r13, #4 ; on descend la fin de pile d'un cran
          STR     r0, [r13] ; on sauvegarde dans la mémoire la variable d'entré
          LDR     r0, [r11, #-4*2] ; on charge la valeur de wig 
          SUB     r13, r13, #4 ; on descend r13 d'un cran
          STR     r0, [r13] ; 
          BL      TRANSFORM
          LDR     r0, [r11, #-4]
          SUB     r13, r13, #4
          STR     r0, [r13]
          LDR     r0, [r11, #-4*3]
          SUB     r13, r13, #4
          STR     r0, [r13]
          LDR     r0, [r11, #4*5]
          SUB     r13, r13, #4
          STR     r0, [r13]
          SUB     r13, r13, #4
          BL      SING
          LDR     r0, [r13]
          STR     r0, [r11, #-4*5]
          LDR     r0, [r11, #-4]
          SUB     r13, r13, #4
          STR     r0, [r13]
          LDR     r0, [r11, #-4*4]
          SUB     r13, r13, #4
          STR     r0, [r13]
          LDR     r0, [r11, #4*5]
          SUB     r13, r13, #4
          STR     r0, [r13]
          SUB     r13, r13, #4
          BL      SING
          LDR     r0, [r13]
          LDR     r1, [r11, #-4*5]
          ADD     r0, r0, r1
          STR     r0, [r11, #-4*5]
          LDR     r0, [r11, #-4*3]
          LDR     r1, [r11, #-4*4]
          ADD     r0, r0, r1
          STR     r0, [r11, #4*4]
          MOV     r13, r11 ; on remet r11 dans r13 pour retourner au début de la fonction
          LDMFD   r13!, {r0, r1, r11, PC} ; on recharge les registre qu'on avait avant de rentrer dans la fct ( r0, r1 pour des variables, r11 pour le début de la fonction d'avant
            ; PC=LR
TRANSFORM 
          STMFD   r13!, {r0, r1, r11, LR}
          MOV     r11, r13
          SUB     r13, r13, #4
          LDR     r0, [r11, #4*4]
          STR     r0, [r11, #-4]
          LDR     r0, [r11, #-4]
          CMP     r0, #0
          BEQ     RET_T
          LDR     r0, [r11, #-4]
          LSR     r0, r0, #1
          STR     r0, [r11, #-4]
          LDR     r0, [r11, #4*5]
          LDR     r1, [r0]
          LDR     r0, [r11, #-4]
          ADD     r0, r0, r1
          LDR     r1, [r11, #4*5]
          STR     r0, [r1]
          LDR     r0, [r11, #4*5]
          SUB     r13, r13, #4
          STR     r0, [r13]
          LDR     r0, [r11, #-4]
          SUB     r13, r13, #4
          STR     r0, [r13]
          BL      TRANSFORM
RET_T     
          MOV     r13, r11
          LDMFD   r13!, {r0, r1, r11, PC}

SING      
          STMFD   r13!, {r0, r1, r11, LR}
          MOV     r11, r13
          SUB     r13, r13, #4
          MOV     r0, #0
          STR     r0, [r11, #-4]
          LDR     r0, [r11, #4*6]
          LDR     r1, [r11, #4*7]
          ADD     r0, r0, r1
          STR     r0, [r11, #-4]
          LDR     r0, [r11, #-4]
          LDR     r1, [r11, #4*5]
          LSL     r0, r0, r1
          STR     r0, [r11, #-4]
          LDR     r0, [r11, #-4]
          STR     r1, [r11, #4*4]
          MOV     r13, r11
          LDMFD   r13!, {r0, r1, r11, PC}