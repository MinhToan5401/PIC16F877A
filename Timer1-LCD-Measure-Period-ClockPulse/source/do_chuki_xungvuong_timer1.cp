#line 1 "D:/Download/microC/timer1_do_chuki_xungvuong/do_chuki_xungvuong_timer1.c"



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


void main() {
 unsigned int cnt, chuky;
 char buffer[6];

 TRISD.B0 = 1;
 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1, 1, "T =");


 T1CON.TMR1CS = 0;
 T1CON.T1CKPS0 = 0;
 T1CON.T1CKPS0 = 0;
 while(1)
 {
 TMR1H = TMR1H = 0;
 while(PORTD.B0 == 1);
 while(PORTD.B0 == 0);

 T1CON.TMR1ON = 1;
 while(PORTD.B0 == 1);
 while(PORTD.B0 == 0);
 T1CON.TMR1ON = 0;

 cnt = TMR1H;
 cnt <<= 8;
 cnt |= TMR1L;

 chuky = cnt/5000;
 WordToStr(chuky, buffer);
 Lcd_Out(1, 4, buffer);
 Lcd_Out_CP("ms");
 Delay_ms(500);
 }
}
