void main() {
     unsigned short dc = 0;
     ADCON1 |= 0x07;
     TRISA = 0xFF;
     TRISC = 0x00;
     
     PWM1_Init(500);
     PWM1_Set_Duty(dc);
     PWM1_Start();
     while(1)
     {
         while(Button(&PORTA, 0, 10, 0))
         {
             if(dc<255)
             {
                dc++;
             }
             PWM1_Set_Duty(dc);
             Delay_ms(10);
         }
         while(Button(&PORTA, 1, 10, 0))
         {
             if(dc>0)
             {
                dc--;
             }
             PWM1_Set_Duty(dc);
             Delay_ms(10);
         }
     }
}