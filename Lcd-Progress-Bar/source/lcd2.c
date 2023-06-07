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

const char none_filled_box[] = {31,17,17,17,17,17,31,0};
const char filled_box[] = {31,31,31,31,31,31,31,0};
const char half_filled_box[] = {28,28,28,28,28,28,28,0};

void LoadCharToCGRAM(char p, const char * chr);
void Lcd_ProgressBar(char row, char value);

void LoadCharToCGRAM (char p, const char * chr)   //ham dua ki tu custom vao vi tri p
{
     char i;
     Lcd_Cmd(64 + p*8);
     for(i = 0; i<7; i++) Lcd_Chr_CP(chr[i]);
     Lcd_Cmd(_LCD_RETURN_HOME);
}

void Lcd_ProgressBar(char row, char value, char length)
//row: the row you setup progressbar, value is percentage value of the progress bar, length: number of box in the progressbar
{
     unsigned long i, j, b;
     char percent[4];
     LoadCharToCGRAM(0, none_filled_box);
     LoadCharToCGRAM(1, filled_box);
     LoadCharToCGRAM(2, half_filled_box);
      value = value * length / (float)100;
      for(i = 1; i<=length; i++)
      {
           Lcd_Chr(row, i, 0);
      }
      for(j = 1; j <= value; j++)
      {
           //digit display
           b = j * 10 / (length/(float)10);
           ByteToStr(b, percent); //convert byte to string and save the the variable to percent
           Lcd_Out(2, 1, percent); //out the percent
           
           //black box display
           Lcd_Chr_CP('%');
           Lcd_Chr(row, j, 1);
           Delay_ms(300);
      }
}

void main() {
     Lcd_Init();
     Lcd_Cmd(_LCD_CURSOR_OFF); //tat con tro
     Lcd_Out(1, 1, "LOADING..."); //xuat ki tu character1 ra cot 1 hang 1 tu vi tri 0
     Lcd_ProgressBar(3, 75, 20);
     //row: the row you setup progressbar, value is percentage value of the progress bar, length: number of blank box in the progressbar
     Lcd_Out(1, 1, "System Ready!");
     while(1)
     {
             Lcd_Cmd(_LCD_TURN_ON);
             Delay_ms(500);
             Lcd_Cmd(_LCD_TURN_OFF);
             Delay_ms(500);
     }
}