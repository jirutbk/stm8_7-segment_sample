stm8/
  #include "mapping.inc"

  segment 'rom'	

PB_DDR 	equ $5007
PB_ODR 	equ $5005
PB_CR1 	equ $5008
PIN_ALL equ $FF

	mov PB_DDR, #PIN_ALL	;Output mode
	mov PB_CR1, #PIN_ALL	;Push-Pull	
	
main
	ldw	X,#0		
loop
	ld A,(digits,X)	; �ǧ���������ä
	ld	PB_ODR, A		;display digit
	pushw	X
	call delay	
	popw X
	incw X	
	cpw X,numDigit
	jrc loop		;������º��º������ҡѹ
	jra main
		
delay:
	ldw X,#$FF1
xloop		
	ldw Y,#$55		
yloop
	decw Y
	jrne yloop	
	decw X
	jrne xloop
	ret

digits	dc.b	$88,$F9,$4C,$68,$39,$2A,$0A,$B8,$08,$28
numDigit dc.w	$000A	;10

	end
		

