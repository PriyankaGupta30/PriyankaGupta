; ******************************************************
; BASIC .ASM template file for AVR
; ******************************************************
;Add a block of 10 Data bytes and store the result in the memory.
.include "C:\VMLAB\include\m8def.inc"

; Define here the variables
;
.def  temp  =r16

; Define here Reset and interrupt vectors, if any
;
reset:
   rjmp start


; Program starts here after Reset
;
start:  LDI R16,10
        STS $0060,R16
        LDI R17,12
       STS $0061,R17
        LDI R18,13
       STS $0062,R18
        LDI R19,80
       STS $0063,R19
        LDI R20,60
       STS $0064,R20
        LDI R21,23
       STS $0065,R21
        LDI R22,05
       STS $0066,R22
        LDI R23,15
       STS $0067,R23
        LDI R24,30
       STS $0068,R24
        LDI R25,10
       STS $0069,R25






