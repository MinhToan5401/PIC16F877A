     
// CONFIG1
#pragma config FOSC = HS        
#pragma config WDTE = OFF       
#pragma config PWRTE = OFF      
#pragma config MCLRE = ON       
#pragma config CP = OFF        
#pragma config CPD = OFF        
#pragma config BOREN = OFF      
#pragma config IESO = OFF       
#pragma config FCMEN = OFF      
#pragma config LVP = ON         

// CONFIG2
#pragma config BOR4V = BOR40V   
#pragma config WRT = OFF    

#include <xc.h>
#define _XTAL_FREQ 4000000

void sang_duoi()
{
    unsigned char i, a = 0x80;
    for(i = 0; i<8; i++)
    {
        PORTD = (a>>i) | PORTD;
        __delay_ms(200);
    }
}


void main(void) 
{
    ANSEL = ANSELH = 0x00;
    TRISD = 0;
    TRISB = 0xff;
    nRBPU = 0;
    WPUB = 0xFF;
    
    GIE = 1;//Enables all unmasked interrupts
    INTE = 1;//Enables the INT external interrupt
    INTF = 0;//The INT external interrupt did not occur
    INTEDG = 0;// Interrupt Edge Select
    
    PORTD = 0;
    
    while(1)
    {
        sang_duoi();
        PORTD = 0;
    }
}

void __interrupt() isr(void)
{
    INTF = 0;
    if(RB0 == 0)
    {
        while(RB0 == 0)
        {
            
        }
        if(RB0 == 1)
        {
            PORTD = 0;
        }
    }
}


