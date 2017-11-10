;
; Exercise3_2.asm
;
; Created: 11/10/2017 6:39:50 PM
; Author : Arkad
;


; Replace with your application code
rjmp main

main:
    ldi r16, 204			; input register, 204 = 1100 1100
	ldi r17, 0				; loop counter or equal to total bits 
	ldi r20, 0				; comparator 

L1:
	inc r17					; increment the counter
	mov r18,r16				; copy the value of r16 to r18
	dec r18					; decrement the value of r18
	and r16, r18			; do 'and' operation and save the value in r16
	cp r16,r20				; check if the all bit are zero
	breq END				; end the program if all bit are zero
	rjmp L1					; iterate one more time otherwise

END:

rjmp END
    
