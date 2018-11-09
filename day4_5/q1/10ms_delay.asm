; ******************************************************
; BASIC .ASM template file for AVR
; ******************************************************
;Write a delay subroutine to give an exact delay of 10ms using Timer 1 .(Test by outputting 0x55 and 0xaa alternately on the LED's using port B).
.include "C:\VMLAB\include\m8def.inc"

; Define here the variables
;
.def  temp  =r16

; Define here Reset and interrupt vectors, if any
;
reset:
   rjmp start
  ; rjmp int0_handler
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
;int0_handler: SBI PORTD,PD7
              ;RETI
start:
  LDI R16,LOW(RAMEND)
  OUT SPL,R16
  LDI R16,HIGH(RAMEND)
  OUT SPH,R16
  LDI R16,0x80
  OUT DDRD,R16

FOREVER:
    LDI R16,0X55
   OUT PORTD ,R16
   CALL DELAY

   LDI R16,0xAA
   OUT PORTD ,R16
    CALL DELAY
    RJMP FOREVER

DELAY: LDI R20,0xFB
      OUT  TCNT1H,R20
      LDI R20,0x1D
      OUT TCNT1L,R20
      LDI R20,0x00
      OUT TCCR1A,R20
       LDI R20,0x03
      OUT TCCR1B,R20


 AGAIN:

      IN R20,TIFR
      SBRS R20,(1<<TOV1)
      RJMP AGAIN
      LDI R20,0X00
      OUT TCCR1B,R20
      LDI R20,0X04
      OUT TIFR,R20
      RET


