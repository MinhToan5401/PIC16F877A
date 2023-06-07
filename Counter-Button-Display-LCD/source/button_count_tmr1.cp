#line 1 "D:/Download/microC/New folder/button_count_tmr1.c"

sbit LCD_RS at RB0_bit;
sbit LCD_EN at RB1_bit;
sbit LCD_D4 at RB4_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D7 at RB7_bit;

sbit LCD_RS_Direction at TRISB0_bit;
sbit LCD_EN_Direction at TRISB1_bit;
sbit LCD_D4_Direction at TRISB4_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D7_Direction at TRISB7_bit;


sbit button at TRISC.B0;

void main() {
 unsigned int counter, a = 0;
 char buffer[4];
 TRISC.B0 = 1;
 TRISB = 0x00;

 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);

 T1CON.TMR1CS = 1;
 T1CON.T1CKPS1 = 0;
 T1CON.T1CKPS1 = 0;
 TMR1H = 0;
 TMR1L = 0;
 T1CON.TMR1ON = 1;

 while(1)
 {
#line 52 "D:/Download/microC/New folder/button_count_tmr1.c"
 if(Button(PORTC, 0, 20, 0))
 {
 a++;
 while(Button(PORTC, 0, 20, 0));
 }
 if(a > 3)
 {
 a = 0;
 }
 Lcd_Out(1, 1, "Let's count:");
 ByteToStr(a, buffer);
 Lcd_Out(2, 1, buffer);
 }
}
