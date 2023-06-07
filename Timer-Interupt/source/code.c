
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

void delay_10ms(void)
{
    T0CS = 0;   //su dung nguon dao dong noi FOCS/4
    T0SE = 0;   //chon xung canh xuong
    PSA = 0;    //su dung bo chia
    
    PS2 = 1;    // Chia
    PS1 = 0;    // bo chia
    PS0 = 1;    // 1:16
    TMR0 = 99.75;   ////can tao ra thoi gian la 4ms, t? cong thuc suy ra TMR0_init = 6;
    TMR0IF = 0;
    
    while(TMR0IF == 0)
    {
        
    }
}

void port()
{
    ANSEL = ANSELH = 0x00;
    TRISD = 0;
    PORTD = 0;
}

void main(void) 
{ 
    port();
    while(1)
    {
        RD1 = 1;
        delay_10ms();
        RD1 = 0; 
    }
    
}
