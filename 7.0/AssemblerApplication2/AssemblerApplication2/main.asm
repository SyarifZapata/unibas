;
; AssemblerApplication2.asm
;
; Created: 11/8/2017 10:27:03 PM
; Author : Arkad
;


; Replace with your application code
rjmp main


main:
    ldi r16, 14 ; multiplicator
	ldi r17, 0 ; check
	ldi r20, 0 ; The result comes here
	ldi r18, -2 ; init x
	.DEF xinit = r18 ; x
	mov r19, xinit ;copy xinit to r19

L1:
	cp r17, r16 ; vergleiche (compare) r1 mit r2
	brge L2 ; springe hinaus falls r1 >= r2 (mit Vorzeichen!)
		add r20, r19
		inc r17
	rjmp L1
L2:

rjmp L2
