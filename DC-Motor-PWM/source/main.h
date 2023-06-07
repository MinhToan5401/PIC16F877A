#include <16F877A.h>
#device ADC=10

#FUSES NOWDT, HS, NOPROTECT, NOLVP                  //No Watch Dog Timer
#FUSES WRT_1000                 //Program Memory Write Protected from 0 to 0x0FFF

#use delay(crystal=8000000)
#use fast_io(B)
#use fast_io(C)


