#line 1 "D:/Download/microC/tm1_counter/tmr1_counter.c"
const code7seg[] = {0xC0, 0xF9, 0xA4, 0xB0, 0x99, 0x92, 0x82, 0xF8, 0x80, 0x90};

void main() {
 unsigned int cnt;
 unsigned char nghin, chuc, tram, donvi;
 ADCON1 |= 0x07;
 TRISC.B0 = 1;
 TRISB = 0x00;
 TRISD = 0x00;


 T1CON.TMR1CS = 1;
 T1CON.T1CKPS0 = 0;
 T1CON.T1CKPS1 = 0;

 TMR1H = TMR1L = 0;

 T1CON.TMR1ON = 1;
 while(1)
 {

 cnt = TMR1H;
 cnt = cnt << 8;
 cnt |= TMR1L;

 if(cnt > 20)
 {
 cnt = 0;
 T1CON.TMR1ON = 0;
 TMR1L = 0;
 TMR1H = 0;
 T1CON.TMR1ON = 1;
 }
 nghin = cnt / 1000;
 tram = (cnt % 1000) / 100;
 chuc = (cnt % 100) / 10;
 donvi = cnt % 10;

 PORTB = code7seg[nghin];
 PORTD.B0 = 0;
 Delay_ms(1);
 PORTD.B0 = 1;

 PORTB = code7seg[tram];
 PORTD.B1 = 0;
 Delay_ms(1);
 PORTD.B1 = 1;

 PORTB = code7seg[chuc];
 PORTD.B2 = 0;
 Delay_ms(1);
 PORTD.B2 = 1;

 PORTB = code7seg[donvi];
 PORTD.B3 = 0;
 Delay_ms(1);
 PORTD.B3 = 1;
 }
}
