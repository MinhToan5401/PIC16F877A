#include <16F877A.h>
#device ADC=16

#FUSES NOWDT                 	//No Watch Dog Timer
#FUSES WRT_1000              	//Program Memory Write Protected from 0 to 0x0FFF

#use delay(crystal=20000000)

