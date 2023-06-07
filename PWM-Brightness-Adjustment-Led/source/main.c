#include <main.h>
int16 value = 0;
void main()
{
   setup_adc_ports(AN0);
   setup_adc(ADC_CLOCK_INTERNAL);
   set_adc_channel(0);
   delay_ms(1);
   setup_CCP1(CCP_PWM);
   setup_timer_2(T2_DIV_BY_1, 255, 1);
   while(TRUE)
   {
      value = read_adc();
      set_PWM1_duty(value);
   }

}
