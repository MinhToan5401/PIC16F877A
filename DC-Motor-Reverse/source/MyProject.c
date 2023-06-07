void main() {
     ADCON1 |= 0x07; //cho portA la port xuat nhap tin hieu digital
     TRISA = 0xFF;
     TRISB = 0x00;
     PORTB = 0x00;

     while(1)
     {
        if(Button(&PORTA, 0, 20, 0))
       {
        PORTB = 0x00;
        while(Button(&PORTA, 0, 20, 0));
       }
       if(Button(&PORTA, 1, 20, 0))
       {
        PORTB = 0x01;
        while(Button(&PORTA, 1, 20, 0));
       }
       if(Button(&PORTA, 2, 20, 0))
       {
        PORTB = 0x02;
        while(Button(&PORTA, 2, 20, 0));
       }
     }
}