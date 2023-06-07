#define TANG_BTN_SET TRISA.B0
#define GIAM_BTN_SET TRISA.B1
#define CS_SET TRISC.B0

#define TANG_BTN PORTA.B0
#define GIAM_BTN PORTA.B1
#define CS PORTC.B0

void DACMCP4921_Write(unsigned int dat)
{
   CS = 0;

   //gui data va cac bit cau hinh 0011 sang cho DAC
   //0011xxxxxxxxxxxx
   SPI1_Write(dat>>8 | 0x30); //lay 8 bit cao cua 16bit data va chuyen no ve dang 0x00110000
   SPI1_Write(dat&0x00FF);
   CS = 1;
}

void main() {
     unsigned int dat = 0;
    ADCON1 |= 0x07;
    
    TANG_BTN_SET = 1;
    GIAM_BTN_SET = 1;
    CS_SET = 0;
    
    SPI1_Init();
    //vout = 0V
    DACMCP4921_Write(2048);
    while(1)
    {
       if(TANG_BTN==0)
       {
           if(dat < 4095)
           {
             dat++;
           }
       }
       if(GIAM_BTN==0)
       {
           if(dat > 0)
           {
             dat--;
           }
       }
       DACMCP4921_Write(dat);
       Delay_ms(1);
    }
    
    
}