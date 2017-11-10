;
; Exercise2.asm
;
; Created: 11/9/2017 11:04:25 PM
; Author : Syarif Hidayatullah
;


; HEX in ASCII = upper 4 bits output , lower 4 bits output 
; 63 := 51('3'), 102('f') 


rjmp main

main:
    ldi r21, 16			; max hex value
	ldi r22, 9			; max hex value with number
	ldi r17, 0			; counter and higher 4 bits output 
	
	ldi r18, 63			; input register and lower 4 bits output
	
	ldi r25, 48			; add this value if the value of hex is a number (less than 10)
	ldi r26, 87			; add this value if the value of hex is a letter (greater than 9)

	ldi r16, 16			; divisor

	ldi r20, 255		; Two's Complement starts here
	eor r16,r20			; two's Complement 
	inc r16				; Two's Complement 
	.DEF xinit = r16	; x
	mov r19, xinit		; copy xinit to r19

L1:
	cp r18, r21			; in this function, we devide the input register by 16 (max hex value)
	brlt L2				; 
		add r18, r19	;
		inc r17			; the value of r17 is the higher 4 bits 
	rjmp L1				

L2:
	cp r17, r22			; we figure out if the value of r17 (higher 4 bits) is a number or a letter,
	brge L3				; if it is a number we add the value of r24 (48) to it. 
	add r17, r25
	rjmp L4

L3:
	add r17, r26		; else if it is a letter, we add the value of r26 (87) to it.  
	rjmp L4

L4:
	cp r18, r22			; we figure out if the value of r18 (lower 4 bits) is a number or a letter,
	brge L5				; if it is a number we add the value of r24 (48) to it. 
	add r18, r25
	rjmp END

L5:
	add r18, r26		; else if it is a letter, we add the value of r26 (87) to it.  
	rjmp END

END:
						; end of the programm
rjmp END
	
    
