;
; Exercise 1.c 
;
; Created: 11/8/2017 8:54:37 PM
; Author : Syarif Hidayatullah
;


; Replace with your application code

rjmp main


main:
    ldi r16, 30 ; multiplicator
	ldi r17, 1 ; check
	ldi r18, 10 ; init x and the end result comes here. The Result should be 300
	ldi r21, 0 ; carry
	.DEF xinit = r18 ; x
	mov r19, xinit ; copy xinit to r19

L1:
	cp r17, r16 ; compare r17 with r16
	brge L2 ; go to L2 if r17 >= r16 
		mov r20, r18 ; copy the value on r18 to r20
		add r18, r19 ; add r19 to the value in r18
		inc r17 ; increment r17
		cp r20,r18 ; compare the values in r20 and r18
		brge L3 ; go to L3 if r20 >= r18. Because after 255 the value goes back to 0
	rjmp L1
	
L3:
	inc r21 ; increment the value of the carry register
	rjmp L1 ; jump back to L1

	
L2:

rjmp L2 ; end of the program
