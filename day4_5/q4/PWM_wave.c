// ***********************************************************
// Project:
// Author:
// Module description:
// ***********************************************************
// Write a code to generate a PWM waveform.
#include <avr\io.h>              // Most basic include files
#include <avr\interrupt.h>    // Add the necessary ones
#include <avr\signal.h>        // here
#define BV(X )   (1 << X)

// Define here the global static variables
//

int My_global;


// Interrupt handler example for INT0
//
ISR(SIG_OUTPUT_COMPARE2) {

}

// It is recommended to use this coding style to
// follow better the mixed C-assembly code in the
// Program Memory window
//

void my_function(void) {  // Put the open brace '{' here

   asm("nop");          // Inline assembly example
}

// ***********************************************************
// Main program
//
int main(void) {
 DDRB= 0xff;
 OCR2= 100;
 TCNT2=0x00;

 TIMSK |= BV(OCIE2);
 TCCR2   =  BV(WGM20) | BV(COM20) | BV(COM21) | BV(CS20)      ;
 sei( );


   while(1) {             // Infinite loop; define here the
      my_function();      // system behaviour
   }

}

