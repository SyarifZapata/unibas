;
; AssemblerApplication1.asm
;
; Created: 11/8/2017 8:54:37 PM
; Author : Arkad
;


; Replace with your application code
rjmp main


main:
    	ldi r16, 30 ;multiplicator
	ldi r17, 1 ; check
	ldi r18, 10 ; init x and the end result comes here
	ldi r21, 0 ; carry
	.DEF xinit = r18 ; x
	mov r19, xinit ;copy xinit to r19

L1:
	cp r17, r16 ; vergleiche (compare) r1 mit r2
	brge L2 ; springe hinaus falls r1 >= r2 (mit Vorzeichen!)
		mov r20, r18
		add r18, r19
		inc r17
		cp r20,r18
		brge L3;
	rjmp L1
	
L3:
	inc r21
	rjmp L1

	
L2:
	

rjmp L2

	
