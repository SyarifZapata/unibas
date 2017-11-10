;
; exercise3_3.asm
;
; Created: 11/10/2017 8:54:02 PM
; Author : Syarif Hidayatullah
;


; Replace with your application code
rjmp main

main:
    ldi r16, 0x55			; mask 0
	ldi r17, 0x33			; mask 1
	ldi r18, 0x0f			; mask 2
	ldi r19, 252			; input and output register. here is input = 204 11001100
	mov r20, r19			; copy input to r20 for the logical shift operation

MASK:
	and r20,r16				; assembly implementation of the C code on the exercise sheet. 
	lsr r19					; (c >> 1)
	and r19,r16
	add r19,r20
	mov r20,r19

	and r20,r17
	lsr r19					; (c >> 2)
	lsr r19
	and r19,r17
	add r19,r20
	mov r20,r19

	and r20,r18
	lsr r19					; (c >> 4)
	lsr r19
	lsr r19
	lsr r19
	and r19,r18
	add r19,r20

	rjmp END

END:
rjmp END



    
