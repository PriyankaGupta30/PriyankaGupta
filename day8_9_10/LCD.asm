; ******************************************************
; BASIC .ASM template file for AVR
; ******************************************************
;Study the LCD Interface and Write a code for LCD using AVR Micro controller .

.include "C:\VMLAB\include\m8def.inc"



.def  temp  =r16

; Define here Reset and interrupt vectors, if any
;
reset:
   rjmp start
   reti      ; Addr $01
   reti      ; Addr $02
   reti      ; Addr $03
   reti      ; Addr $04
   reti      ; Addr $05
   reti      ; Addr $06        Use 'rjmp myVector'
   reti      ; Addr $07        to define a interrupt vector
   reti      ; Addr $08
   reti      ; Addr $09
   reti      ; Addr $0A
   reti      ; Addr $0B        This is just an example
   reti      ; Addr $0C        Not all MCUs have the same
   reti      ; Addr $0D        number of interrupt vectors
   reti      ; Addr $0E
   reti      ; Addr $0F
   reti      ; Addr $10

; Program starts here after Reset
;
start:
 	 LDI R21,HIGH (RAMEND)
 	 OUT SPH, R21
 	 LDI R21,LOW (RAMEND)
 	 OUT SPL, R21

		LDI R21,0xFF
		OUT DDRD, R21
		OUT DDRB, R21
		LDI R16,0x33
		CALL CMNDWRT
		CALL DELAY_2ms
		LDI R16,0x32
		CALL CMNDWRT
		CALL DELAY_2ms
		LDI R16,0x28
		CALL CMNDWRT
		CALL DELAY_2ms
		LDI R16,0x0E
		CALL CMNDWRT
		LDI R16,0x01
		CALL CMNDWRT
		CALL DELAY_2ms
		LDI R16,0x06
		CALL CMNDWRT
		LDI R16,'H'
		CALL DATAWRT
		LDI R16,'i'
		CALL DATAWRT

HERE: JMP HERE

CMNDWRT:
			MOV  R27, R16
			ANDI R27,0xF0
			OUT PORTD, R27
			CBI PORTB, 5
		
			SBI PORTB, 4
			CALL SDELAY
			CBI PORTB, 4
			CALL DELAY_100us
			
			MOV R27,R16
			SWAP  R27	
			ANDI R27,0xF0
			OUT PORTD,R27
			SBI PORTB ,4
			CALL SDELAY
			CBI PORTB, 4
			CALL DELAY_100us
			RET
			
DATAWRT:
			MOV  R27, R16
			ANDI R27, 0xF0
			OUT PORTD, R27
			SBI PORTB, 5
			SBI PORTB, 4
			CALL SDELAY
			CBI PORTB, 4
			
			MOV  R27, R16
			SWAP  R27
			ANDI R27, 0XF0
			OUT PORTD, R27
			SBI PORTB, 4
			CALL SDELAY
			CBI PORTB, 4
			
			CALL DELAY_100us
			RET
			
SDELAY:
			NOP
			NOP
			RET
			
DELAY_100us:
			PUSH  R17
			LDI R17, 60
			
DR0:
			CALL SDELAY
			DEC R17
			BRNE DR0
			POP R17
			RET
			
DELAY_2ms:
			PUSH R17
			LDI R17,20
LDR0:
         CALL DELAY_100us
         DEC R17
         BRNE LDR0
         POP R17
         RET															
						






