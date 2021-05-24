
LED	EQU	P2.0

	ORG	000H	; starting address
	SJMP	MAIN	; jumps to the LABEL
	ORG	003H	; starting address for the ISR(INT0)
	ACALL	ISR	; calls the ISR (interrupt service routine)
	RETI		; returns from the interrupt

MAIN: ; main function that sets the interrupt parameters
	MOV	P0,#00H
	MOV	P1,#00H
	MOV	P2,#00H
	MOV	P3,#00000100B

	MOV	IE,#081H	; Enable INT0
	SETB	IT0	; Set Falling Edge Trigger for INT0
	SJMP	$ 	; jumps back to the MAIN subroutine
ISR:			; interrupt service routine
	CPL	LED 	; complements the current value in accumulator A
	RET		; jumps to RETI
	
	END