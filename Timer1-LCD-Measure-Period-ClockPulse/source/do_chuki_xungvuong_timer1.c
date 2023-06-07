//LUU Y: code nay chi do chu ky xung tu 77Hz tro len (13ms tro xuong) do bo dem cua timer1 co gioi han la 16bit, su dung thach anh tan so cao 20MHz

// LCD module connections
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
    
    //khoi tao timer1
    T1CON.TMR1CS = 0;   //su dung nguon xung noi FOSC/4 = 5MHz
    T1CON.T1CKPS0 = 0;   //bo chia 1:1
    T1CON.T1CKPS0 = 0;
    while(1)
    {
        TMR1H = TMR1H = 0; //gia tri ban dau cua timer1 la 0
        while(PORTD.B0 == 1);
        while(PORTD.B0 == 0);   //doi cho den khi RD0 vua chuyen len muc cao
        //cho timer bat dau dem chu ki 1 xung clock
        T1CON.TMR1ON = 1;  //cho timer bat dau dem o xung canh len
        while(PORTD.B0 == 1);
        while(PORTD.B0 == 0); 
        T1CON.TMR1ON = 0;  //dung timer
        
        cnt = TMR1H;
        cnt <<= 8;
        cnt |= TMR1L; //cnt luu gia tri dem cua timer1
        
        chuky = cnt/5000; //ms
        WordToStr(chuky, buffer);
        Lcd_Out(1, 4, buffer);
        Lcd_Out_CP("ms");
        Delay_ms(500);    
    }
}