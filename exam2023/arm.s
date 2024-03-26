MAIN      
          MOV     r11, r13
          SUB     r13, r13, #4*2
          MOV     r0, #2
          STR     r0, [r11, #-4]
          MOV     r0, #0
          STR     r0, [r11, #-4*2]
          LDR     r0, [r11, #-4]
          SUB     r13, r13, #4
          STR     r0, [r13]
          SUB     r13, r13, #4
          BL      HANNAH
          LDR     r0, [r13]
          MOV     r13, r11
          END

HANNAH    
          STMFD   r13!, {r0, r1, r11, LR}
          MOV     r11, r13
          SUB     r13, r13, #4*5
          MOV     r0, #0
          STR     r0, [r11, #-4]
          MOV     r0, #4
          STR     r0, [r11, #-4*2]
          MOV     r0, #20
          STR     r0, [r11, #-4*3]
          MOV     r0, #30
          STR     r0, [r11, #-4*4]
          MOV     r0, #0
          STR     r0, [r11, #-4*5]
          MOV     r0, #0
          ADD     r0, r11, #-4
          SUB     r13, r13, #4
          STR     r0, [r13]
          LDR     r0, [r11, #-4*2]
          SUB     r13, r13, #4
          STR     r0, [r13]
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
          MOV     r13, r11
          LDMFD   r13!, {r0, r1, r11, PC}

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