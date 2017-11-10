;
; Exercise3.asm
;
; Created: 11/10/2017 11:41:51 AM
; Author : Syarif Hidayatullah
;


; Replace with your application code
rjmp main

main:
    ldi r16, 204			; input register, 204 is 1100 1100 
	ldi r17, 1				; set r17 to 0000 0001
	ldi r18, 0				; total bits counter. end value should be 4
	ldi r19, 1				; 1 as comparator
	ldi r20, 8				; max bit in a register
	ldi r21, 0				; loop counter 

L1:
	and r17, r16			; do "and" operator and save the value to r17
	cp r19,r17				; compare if r17 has the value 1
	breq L2					; if r17 hast the value one than go to L2
	ldi r17, 1				; set r17 back to 1 
	lsr r16					; shift r16 one bit to the right
	cp r20,r21				; check the condition of the loop
	breq END				; end program if all bits are checked
	inc r21					; increment the loop counter
	rjmp L1					; next iteration

L2:
	inc r18					; increment the counter
	lsr r16					; shift the value r16 one bit to the right 
	inc r21					; increment the loop counter
	rjmp L1

END:

rjmp END


	
	
