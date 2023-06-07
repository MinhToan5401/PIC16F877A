#include <main.h>

int t = 0;
#byte OPREG = 0x81
#byte INTCON = 0x0b
#bit INTF = INTCON.1

#INT_EXT
void ngat()
{
   if(INTF == 1)
   {
      t = t + 1;
      INTF == 0;//khong anh huong
   }
   if(t == 2)
   {
      t = 0;
      output_toggle(PIN_B1);
   }
}

void main()
{
   OPREG = 0b11010111;
   INTCON = 0b11010000;
   INTF = 0;
   set_tris_b(0x01);
   output_high(PIN_B1);
   while(TRUE)
   {
//!      if(INTF == 1)
//!      {
//!         t = t + 1;
//!         INTF = 0;
//!      }
   }
//!   set_tris_b(0x01);
//!   ext_int_edge(H_TO_L);
//!   enable_interrupts(GLOBAL);
//!   enable_interrupts(INT_EXT);
//!   output_high(PIN_B1);
   while(1)
   {
     
   }
}
