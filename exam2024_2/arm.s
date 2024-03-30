MAIN            
                MOV     R11, R13
                SUB     R13, R13, #4*4
                MOV     R0, #0x3D
                STR     R0, [R11, #-4]
                MOV     R0, #0x36
                STR     R0, [R11, #-4*2]
                MOV     R0, #0x3D
                STR     R0, [R11, #-4*3]
                MOV     R0, #0x3E
                STR     R0, [R11, #-4*4]
                LDR     R0, [R11, #-4]
                SUB     R13, R13, #4
                STR     R0, [R13]
                MOV     R0, #0
                ADD     R0, R11, #-4*3
                SUB     R13, R13, #4
                STR     R0, [R13]
                MOV     R0, #0
                ADD     R0, R11, #-4*2
                SUB     R13, R13, #4
                STR     R0, [R13]
                LDR     R0, [R11, #-4*4]
                SUB     R13, R13, #4
                STR     R0, [R13]
                BL      FUNK
                MOV     R13, R11
                END
FUNK            
                STMFD   R13!, {R0, R1, R11, LR}
                MOV     R11, R13
                MOV     R0, #0x01
                SUB     R13, R13, #4
                STR     R0, [R13]
                MOV     R0, #0
                SUB     R13, R13, #4
                STR     R0, [R13]
                LDR     R0, [R11, #-4]
                SUB     R13, R13, #4
                STR     R0, [R13]
                SUB     R13, R13, #4
                BL      CANT_STOP
                LDR     R0, [R13]
                STR     R0, [R11, #-4*2]
                LDR     R0, [R11, #4*6]
                LDR     R1, [R0]
                LDR     R0, [R11, #-4*2]
                ADD     R1, R0, R1
                LDR     R0, [R11, #4*6]
                STR     R1, [R0]
                LDR     R0, [R11, #4*5]
                LDR     R1, [R0]
                LDR     R0, [R11, #-4*2]
                ADD     R1, R0, R1
                LDR     R0, [R11, #4*5]
                STR     R1, [R0]
                LDR     R0, [R11, #-4*2]
                LDR     R1, [R11, #4*4]
                ADD     R0, R0, R1
                STR     R0, [R11, #-4*2]
                LDR     R0, [R11, #-4*2]
                SUB     R13, R13, #4
                STR     R0, [R13]
                SUB     R13, R13, #4
                BL      CALIFORNICATION
                LDR     R0, [R13]
                STR     R0, [R11, #-4*2]
                MOV     R13, R11
                LDMFD   R13!, {R0, R1, R11, PC}
CANT_STOP       
                STMFD   R13!, {R0, R11, LR}
                MOV     R11, R13
                LDR     R0, [R11, #4*4]
                ANDS    R0, R0, #1
                BEQ     RIGHT
                LSR     R0, R0, #4
                B       OUT
RIGHT           ASR     R0, R0, #4
OUT             STR     R0, [R11, #4*3]
                MOV     R13, R11
                LDMFD   R13!, {R0, R11, PC}
CALIFORNICATION 
                STMFD   R13!, {R0, R1, R11, LR}
                MOV     R11, R13
                MOV     R0, #0
                SUB     R13, R13, #4
                STR     R0, [R13]
LOOP            LDR     R0, [R11, #-4]
                CMP     R0, #30
                BEQ     RET
                LDR     R0, [R11, #4*5]
                LDR     R1, [R11, #-4]
                ADD     R0, R0, R1
                STR     R0, [R11, #4*5]
                LDR     R0, [R11, #-4]
                ADD     R0, R0, #1
                STR     R0, [R11, #-4]
                B       LOOP
RET             LDR     R0, [R11, #4*5]
                STR     R0, [R11, #4*4]
                MOV     R13, R11
                LDMFD   R13!, {R0, R1, R11, PC}