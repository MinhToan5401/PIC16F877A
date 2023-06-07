#line 1 "D:/Download/microC/daochieu_dc_mach_cau_H/MyProject.c"
void main() {
 ADCON1 |= 0x07;
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
