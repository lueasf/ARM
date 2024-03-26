MAIN    
        MOV     r11, r13 ; Par convention, dans r11 on met la pile
        SUB     r13, r13, #4*3; on descend le pointeur de pile de 12 o = 3 var
        MOV     r0, #10
        STR     r0, [r11, #-4]
        MOV     r0, #3
        STR     r0, [r11, #-4*2]
        MOV     r0, #0
        STR     r0, [r11, #-4*3]
        LDR     r0, [r11, #-4]
        SUB     r13, r13, #4
        STR     r0, [r13]
        LDR     r0, [r11, #-4*2]
        SUB     r13, r13, #4
        STR     r0, [r13]
        SUB     r13, r13, #4
        BL      SPLIT
        LDR     r0, [r13]
        MOV     r13, r11
        END
SPLIT   
        STMFD   r13!, {r0, r1, r11, LR}
        MOV     r11, r13
        SUB     r13, r13, #4*2
        MOV     r0, #0
        STR     r0, [r11, #-4]
        MOV     r0, #0
        STR     r0, [r11, #-4*2]
INCR    
        LDR     r0, [r11, #4*6]
        SUB     r13, r13, #4
        STR     r0, [r13]
        LDR     r0, [r11, #4*5]
        SUB     r13, r13, #4
        STR     r0, [r13]
        SUB     r13, r13, #4
        BL      RESULT
        LDR     r0, [r13]
        STR     r0, [r11, #-4*2]
LOOP    
        LDR     r0, [r11, #-4*2]
        CMP     r0, #0
        BEQ     ENDLOOP
        LDR     r0, [r11, #-4]
        ADD     r0, r0, #1
        STR     r0, [r11, #-4]
        LDR     r0, [r11, #-4*2]
        CMP     r0, #0
        BGT     F1
        B       F2
F1      
        MOV     r0, #0
        ADD     r0, r11, #4*6
        SUB     r13, r13, #4
        STR     r0, [r13]
        LDR     r0, [r11, #4*5]
        SUB     r13, r13, #4
        STR     r0, [r13]
        SUB     r13, r13, #4
        BL      FUNC1
        B       INCR
F2      
        LDR     r0, [r11, #4*6]
        SUB     r13, r13, #4
        STR     r0, [r13]
        MOV     r0, #0
        ADD     r0, r11, #4*5
        SUB     r13, r13, #4
        STR     r0, [r13]
        SUB     r13, r13, #4
        BL      FUNC2
        B       INCR
ENDLOOP 
        LDR     r0, [r11, #-4]
        STR     r0, [r11, #4*4]
        MOV     r13, r11
        LDMFD   r13!, {r0, r1, r11, PC}
FUNC1   
        STMFD   r13!, {r0, r1, r11, LR}
        MOV     r11, r13
        LDR     r0, [r11, #4*6]
        LDR     r1, [r0]
        LDR     r0, [r11, #4*5]
        SUB     r0, r1, r0
        LDR     r1, [r11, #4*6]
        STR     r0, [r1]
        MOV     r13, r11
        LDMFD   r13!, {r0, r1, r11, PC}
FUNC2   
        STMFD   r13!, {r0, r1, r11, LR}
        MOV     r11, r13
        LDR     r0, [r11, #4*5]
        LDR     r1, [r0]
        LDR     r0, [r11, #4*6]
        SUB     r0, r1, r0
        LDR     r1, [r11, #4*5]
        STR     r0, [r1]
        MOV     r13, r11
        LDMFD   r13!, {r0, r1, r11, PC}
RESULT  
        STMFD   r13!, {r0, r1, r11, LR}
        MOV     r11, r13
        LDR     r0, [r11, #4*6]
        LDR     r1, [r11, #4*5]
        SUB     r0, r0, r1
        STR     r0, [r11, #4*4]
        MOV     r13, r11
        LDMFD   r13!, {r0, r1, r11, PC}