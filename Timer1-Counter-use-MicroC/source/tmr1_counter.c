const code7seg[] = {0xC0, 0xF9, 0xA4, 0xB0, 0x99, 0x92, 0x82, 0xF8, 0x80, 0x90};

void main() {
     unsigned int cnt; //16 bit
     unsigned char nghin, chuc, tram, donvi;
     ADCON1 |= 0x07;
     TRISC.B0 = 1;
     TRISB = 0x00;
     TRISD = 0x00;
     
     //timer1 hoat dong o che do counter, che do chia 1:1
     T1CON.TMR1CS = 1;//counter, dem xung ngoai
     T1CON.T1CKPS0 = 0;//ti le 1:1
     T1CON.T1CKPS1 = 0;
     
     TMR1H = TMR1L = 0; //dem tu 0
     
     T1CON.TMR1ON = 1; //cho phep timer1 bat dau dem
     while(1)
     {
           //ghep 2 thanh ghi TMR1H va TMR1L
           cnt = TMR1H; //gan TMR1H vao 8 bit thap cnt
           cnt = cnt << 8;
           cnt |= TMR1L;
           
           if(cnt > 20) //dem den 20 thi reset gia tri dem ve 0
           {
            cnt = 0;
            T1CON.TMR1ON = 0;  //ngung hoat dong timer1;
            TMR1L = 0; //nap lai gia tri cua timer1
            TMR1H = 0;
            T1CON.TMR1ON = 1;  //timer1 dem lai;
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