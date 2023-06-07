 //CONFIG
#pragma config FOSC = HS        // Oscillator Selection bits (HS oscillator)
#pragma config WDTE = OFF       // Watchdog Timer Enable bit (WDT disabled)
#pragma config PWRTE = OFF      // Power-up Timer Enable bit (PWRT disabled)
#pragma config BOREN = OFF      // Brown-out Reset Enable bit (BOR disabled)
#pragma config LVP = OFF        // Low-Voltage (Single-Supply) In-Circuit Serial Programming Enable bit (RB3 is digital I/O, HV on MCLR must be used for programming)
#pragma config CPD = OFF        // Data EEPROM Memory Code Protection bit (Data EEPROM code protection off)
#pragma config WRT = OFF        // Flash Program Memory Write Enable bits (Write protection off; all program memory may be written to by EECON control)
#pragma config CP = OFF         // Flash Program Memory Code Protection bit (Code protection off)

//if use full step mode, the motor shaft will run faster
#include <xc.h>
//#include "LCD.h"

#define _XTAL_FREQ 16000000

#define MS1_SET             TRISBbits.TRISB6
#define MS2_SET             TRISBbits.TRISB1
#define MS3_SET             TRISBbits.TRISB2

#define ENABLE_SET          TRISBbits.TRISB3
#define STEP1_SET           TRISBbits.TRISB4
#define DIR1_SET            TRISBbits.TRISB5

#define MS1                 PORTBbits.RB6
#define MS2                 PORTBbits.RB1
#define MS3                 PORTBbits.RB2

#define ENABLE              PORTBbits.RB3
#define STEP1               PORTBbits.RB4
#define DIR1                PORTBbits.RB5

#define BTN_SET             TRISBbits.TRISB0
#define BTN                 PORTBbits.RB0

long Count_TOP1, Count_BOT1, Count_timer1, Count_TOP2, Count_BOT2, Count_timer2;
long step1 = 0, step2 = 0, analog_value; //step1 step2 dung de luu so step

void A4988_init() {
    MS1_SET = 0; 
    MS2_SET = 0; 
    MS3_SET = 0; 
    ENABLE_SET = 0; 
    DIR1_SET = 0;  
    STEP1_SET = 0;  
    
    MS1 = 1; 
    MS2 = 1; 
    MS3 = 1; 
    ENABLE = 0; 
}

void timer0_init() {
    OPTION_REGbits.T0CS = 0;  
    OPTION_REGbits.PSA = 0;   
    OPTION_REGbits.PS2 = 0;   
    OPTION_REGbits.PS1 = 0;    
    OPTION_REGbits.PS0 = 1;   
    TMR0 = 235;   
    INTCONbits.TMR0IF = 0; 
    INTCONbits.TMR0IE = 1; 
    INTCONbits.GIE = 1; 
}

void Speed_M1(int16_t x) 
{
    uint8_t speed; //nam trong khoang (2.34 - 93.75)
    if (x < 0) 
    { 
        //DIR1 = 1;
        Count_BOT1 = -x;
        Count_TOP1 = -x/2;
    }
    else if (x > 0) 
    {
        //DIR1 = 0;
        Count_BOT1 = x;
        Count_TOP1 = (uint16_t)x/2;
    }
    else 
    {
      Count_BOT1 = 0;
      Count_TOP1 = 0;
    }
}

void main()
{
    uint16_t x;
    A4988_init();
    timer0_init(); 
    BTN_SET = 1;
    DIR1 = 1;
    Speed_M1(10);

    while(1)
    { 
        if(BTN == 0)
        {
            __delay_ms(20);
            DIR1 = !DIR1;
            while(BTN == 0);
        }
    }
}

void __interrupt() timer_isr(void)  //20us la no nhay vao ham nay 1 lan
{
    if(INTCONbits.TMR0IF)
    {
        TMR0 = 235;
        INTCONbits.TMR0IF = 0;
    }
   
    Count_timer1++; //moi lan ngat 20us tang len 1 don 
                           
    if (Count_timer1 <= Count_TOP1) 
    {
       STEP1 = 1; 
    }

    else 
    {
       STEP1 = 0;  
    }
    if (Count_timer1 > Count_BOT1) 
    {
        Count_timer1 = 0;
        if (DIR1 == 1) 
        {
            step1++;
        }
        else
        {
            step1--;
        }
    }
}
    