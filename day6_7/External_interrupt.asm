; ******************************************************
; BASIC .ASM template file for AVR
; ******************************************************
;Write a program to generate external interrupt on Int0 (PD2) pin of atmega8 controller.
;In the interrupt handler toggle LED connected to PD4 every time an interrupt is 
;generated .
.include "C:\VMLAB\include\m8def.inc"

; Define here the variables
;
.def  temp  =r16

; Define here Reset and interrupt vectors, if any
;
 .ORG 0x00
   rjmp start

; Program starts here afterReset

;
.ORG 0x02
	jmp EX0_ISR
start:
       LDI R20,HIGH (RAMEND)
       OUT SPH,R20
       LDI R20,LOW (RAMEND)
       OUT SPL ,R20
      ; LDI R20,0x02
       ;OUT MCUCR, R20


SBI DDRD,4
SBI PORTD, 2
LDI R20,1<<INT0
OUT GICR,R20
SEI

HERE: jmp HERE
EX0_ISR:
		IN R21,PORTD
		LDI R22,0x10
		EOR R21,R22
		OUT PORTD,R21
		RETI


