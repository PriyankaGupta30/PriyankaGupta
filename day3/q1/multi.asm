; ******************************************************
; BASIC .ASM template file for AVR
; ******************************************************
;Multiply two 8-bit data without using the MUL instruction
.include "C:\VMLAB\include\m8def.inc"

; Define here the variables
;
.def  temp  =r16

; Define here Reset and interrupt vectors, if any
;
reset:
   rjmp start



; Program starts here after Reset



start:
      LDI R16,0x0F
      LDI R17,0x0E
      MOV  R0,R16
      DEC R17



loop:
      ADD  R16,R0
      DEC R17

      BRNE loop




