stm8/
  #include "mapping.inc"

  segment 'rom'
Digit0	equ $88	
Digit1	equ $F9
Digit2	equ $4C
Digit3	equ $68
Digit4	equ $39
Digit5	equ $2A
Digit6	equ $0A
Digit7	equ $B8
Digit8	equ $08
Digit9	equ $28

PB_DDR 	equ $5007
PB_ODR 	equ $5005
PB_CR1 	equ $5008
PIN_ALL equ $FF

		mov PB_DDR, #PIN_ALL	;Output mode
		mov PB_CR1, #PIN_ALL	;Push-Pull

main
		mov PB_ODR, #Digit0	;display digit
		call delay
		mov PB_ODR, #Digit1	
		call delay
		mov PB_ODR, #Digit2	
		call delay
		mov PB_ODR, #Digit3	
		call delay
		mov PB_ODR, #Digit4	
		call delay
		mov PB_ODR, #Digit5	
		call delay
		mov PB_ODR, #Digit6	
		call delay
		mov PB_ODR, #Digit7	
		call delay
		mov PB_ODR, #Digit8	
		call delay
		mov PB_ODR, #Digit9	
		call delay
    jra main
		
delay:
		ldw X, #$FF1
xloop		
		ldw Y, #$55		
yloop
		decw Y
		jrne yloop	
		decw X
		jrne xloop
		ret
		
    end
		
