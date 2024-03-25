main          
              mov     r11,r13

              mov     r0,#1
              sub     r13,r13,#4
              str     r0,[r13] ; allClues

              mov     r0,#1
              sub     r13,r13,#4
              str     r0,[r13] ; temoignage

              ;       now we prepare phoenix(allClues, temoignage)

              ldr     r0,[r11,#-4] ; r0 = allClues
              sub     r13,r13,#4
              str     r0,[r13] ; arg1 of phoenix (a/allClues)

              ldr     r0,[r11,#-8] ; r0 = temoignage
              sub     r13,r13,#4
              str     r0,[r13] ; arg2 of phoenix (b/temoignage)

              sub     r13,r13,#4 ; return value of poenix
              Bl      phoenix ; phoenix(allClues, temoignage) called

              END;
phoenix       
              STMFD   r13!, {r0, r1, r11, LR}; save the values of those register
              mov     r11,r13; init of any fc

              ldr     r0,[r11,#4*6] ; r0=a
              sub     r13,r13,#4
              str     r0,[r13] ; clue

              ldr     r0,[r11,#-4] ; r0=clue useless but we don t optimize there
              ldr     r1,[r11,#4*5] ; r1=b
              sub     r0,r0,r1 ; r0 = clue-b
              str     r0,[r11,#-4] ; stock clue

              ldr     r0,[r11,#-4] ; r0=clue useless but we don t optimize there
              cmp     r0,#0 ; set flag for r0-0
              BLE     elsephoenix; if clue<=0
              ;       now do the if (if the condition is not verified skip to the elsephoenix)

              ;       now we prepare phoenix(clue, b)

              ldr     r0,[r11,#-4] ; r0 = clue
              sub     r13,r13,#4
              str     r0,[r13] ; arg1 of phoenix (a/clue)

              ldr     r0,[r11,#4*5] ; r0 = b
              sub     r13,r13,#4
              str     r0,[r13] ; arg2 of phoenix (b/b)

              sub     r13,r13,#4 ; return value of poenix
              Bl      phoenix
              ;       phoenixphoenix(clue, b) called

elsephoenix   

              ;       now we prepare objection(a)

              ldr     r0,[r11,#4*6] ; r0 = a
              sub     r13,r13,#4
              str     r0,[r13] ; arg1 of objection (i/a)

              sub     r13,r13,#4 ;return value of objection
              bl      objection
              ;       objection(a) called

              ;       do the return
              ldr     r0,[r13] ;get return value of objection
              str     r0,[r11,#4*4] ; load the return value of phoenix
              ;       which is the return value of objection
              ;       return done

              mov     r13, r11; put back r13 to it initial value
              LDMFD   r13!, {r0, r1, r11, PC}; come back to before the call of phoenix

objection     
              STMFD   r13!, {r0, r1, r11, LR}; save the values of those register
              mov     r11,r13; init of any fc

              mov     r0,#0
              sub     r13,r13,#4
              str     r0,[r13] ; rapport

              ldr     r0,[r11,#-4] ; r0=rapport
              ldr     r1,[r11,#4*5]; r1 = i

              ;       following bloc do the multiplication of r0*r1 r1 postitive
              mov     r2,r0
loop          
              cmp     r1, #0
              beq     done
              add     r0, r0, r2
              sub     r1, r1, #1
              b       loop
done          ;       fin de multiplication

              mov     r2, #0; reset value of r2 used in mult
              str     r0,[r11,#-4] ; r0=rapport
              ;       now we prepare miles(rapport)

              ldr     r0,[r11,#-4] ; r0 = rapport
              sub     r13,r13,#4
              str     r0,[r13] ; arg1 of objection (counter/rapport)

              ;miles  don t return anything sub r13,r13,#4
              bl      miles
              ;       miles(rapport) called

              ldr     r0,[r11,#-4] ; r0 = rapport
              ;       miles called without anything str r0,[r11,#4*4]

              mov     r13, r11; put back r13 to it initial value
              LDMFD   r13!, {r0, r1, r11, PC}; come back to before the call of objection

miles         
              STMFD   r13!, {r0, r1, r11, LR}; save the values of those register
              mov     r11,r13; init of any fc

              ldr     r0,[r11,#4*4] ; r0=counter
              sub     r13,r13,#4
              str     r0,[r13] ; counter we save it as local variable

              ldr     r0,[r11,#-4] ; r0=counter
              cmp     r0,#0
              ble     elseobjection

              mov     r13, r11; put back r13 to it initial value
              LDMFD   r13!, {r0, r1, r11, PC}; come back to before the call of objection

elseobjection 
              ;       this is a security since our function should still finish anyway
              mov     r13, r11; put back r13 to it initial value
              LDMFD   r13!, {r0, r1, r11, PC}; come back to before the call of objection