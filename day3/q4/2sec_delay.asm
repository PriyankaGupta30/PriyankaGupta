; ******************************************************
; BASIC .ASM template file for AVR
; ******************************************************
;Write a delay subroutine to give an exact delay of 2sec.(Test by outputting 0x55 and 0xaa alternately on the LED's using port B if possible ).
.include "C:\VMLAB\include\m8def.inc"

; Define here the variables
;
.def  temp  =r16

; Define here Reset and interrupt vectors, if any
;
reset:

  rjmp start
  ; RJMP int0_handler
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
;  int0_handler:SBI PORTD,PD6
 ;              RETI
; Program starts here after Reset
;
start:
		
	   LDI R16, low (RAMEND)
		OUT SPL,R16
		
	   LDI  R16,high(RAMEND)
	   OUT  SPH,R16
	
	  LDI R16,0x40
	  OUT  DDRD,R16
	
	
		
repeat:LDI R16,0xAA
      OUT PORTD ,R16
       CALL delay
       LDI R16,0x55
      OUT PORTD ,R16


       CALL delay
       RJMP repeat


.ORG 0x30

delay:LDI R20,10
loop:LDI R21,255
loop1:LDI R23,255



loop2: DEC R23
       BRNE loop2
       DEC R21
       BRNE loop1
       DEC R20
       BRNE loop
       RET









