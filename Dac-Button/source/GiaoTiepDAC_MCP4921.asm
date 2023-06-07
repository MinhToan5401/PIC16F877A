
_DACMCP4921_Write:

;GiaoTiepDAC_MCP4921.c,9 :: 		void DACMCP4921_Write(unsigned int dat)
;GiaoTiepDAC_MCP4921.c,11 :: 		CS = 0;
	BCF        PORTC+0, 0
;GiaoTiepDAC_MCP4921.c,15 :: 		SPI1_Write(dat>>8 | 0x30); //lay 8 bit cao cua 16bit data va chuyen no ve dang 0x00110000
	MOVF       FARG_DACMCP4921_Write_dat+1, 0
	MOVWF      R0+0
	CLRF       R0+1
	MOVLW      48
	IORWF      R0+0, 0
	MOVWF      FARG_SPI1_Write_data_+0
	CALL       _SPI1_Write+0
;GiaoTiepDAC_MCP4921.c,16 :: 		SPI1_Write(dat&0x00FF);
	MOVLW      255
	ANDWF      FARG_DACMCP4921_Write_dat+0, 0
	MOVWF      FARG_SPI1_Write_data_+0
	CALL       _SPI1_Write+0
;GiaoTiepDAC_MCP4921.c,17 :: 		CS = 1;
	BSF        PORTC+0, 0
;GiaoTiepDAC_MCP4921.c,18 :: 		}
L_end_DACMCP4921_Write:
	RETURN
; end of _DACMCP4921_Write

_main:

;GiaoTiepDAC_MCP4921.c,20 :: 		void main() {
;GiaoTiepDAC_MCP4921.c,21 :: 		unsigned int dat = 0;
	CLRF       main_dat_L0+0
	CLRF       main_dat_L0+1
;GiaoTiepDAC_MCP4921.c,22 :: 		ADCON1 |= 0x07;
	MOVLW      7
	IORWF      ADCON1+0, 1
;GiaoTiepDAC_MCP4921.c,24 :: 		TANG_BTN_SET = 1;
	BSF        TRISA+0, 0
;GiaoTiepDAC_MCP4921.c,25 :: 		GIAM_BTN_SET = 1;
	BSF        TRISA+0, 1
;GiaoTiepDAC_MCP4921.c,26 :: 		CS_SET = 0;
	BCF        TRISC+0, 0
;GiaoTiepDAC_MCP4921.c,28 :: 		SPI1_Init();
	CALL       _SPI1_Init+0
;GiaoTiepDAC_MCP4921.c,30 :: 		DACMCP4921_Write(2048);
	MOVLW      0
	MOVWF      FARG_DACMCP4921_Write_dat+0
	MOVLW      8
	MOVWF      FARG_DACMCP4921_Write_dat+1
	CALL       _DACMCP4921_Write+0
;GiaoTiepDAC_MCP4921.c,31 :: 		while(1)
L_main0:
;GiaoTiepDAC_MCP4921.c,33 :: 		if(TANG_BTN==0)
	BTFSC      PORTA+0, 0
	GOTO       L_main2
;GiaoTiepDAC_MCP4921.c,35 :: 		if(dat < 4095)
	MOVLW      15
	SUBWF      main_dat_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main9
	MOVLW      255
	SUBWF      main_dat_L0+0, 0
L__main9:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;GiaoTiepDAC_MCP4921.c,37 :: 		dat++;
	INCF       main_dat_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_dat_L0+1, 1
;GiaoTiepDAC_MCP4921.c,38 :: 		}
L_main3:
;GiaoTiepDAC_MCP4921.c,39 :: 		}
L_main2:
;GiaoTiepDAC_MCP4921.c,40 :: 		if(GIAM_BTN==0)
	BTFSC      PORTA+0, 1
	GOTO       L_main4
;GiaoTiepDAC_MCP4921.c,42 :: 		if(dat > 0)
	MOVF       main_dat_L0+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main10
	MOVF       main_dat_L0+0, 0
	SUBLW      0
L__main10:
	BTFSC      STATUS+0, 0
	GOTO       L_main5
;GiaoTiepDAC_MCP4921.c,44 :: 		dat--;
	MOVLW      1
	SUBWF      main_dat_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       main_dat_L0+1, 1
;GiaoTiepDAC_MCP4921.c,45 :: 		}
L_main5:
;GiaoTiepDAC_MCP4921.c,46 :: 		}
L_main4:
;GiaoTiepDAC_MCP4921.c,47 :: 		DACMCP4921_Write(dat);
	MOVF       main_dat_L0+0, 0
	MOVWF      FARG_DACMCP4921_Write_dat+0
	MOVF       main_dat_L0+1, 0
	MOVWF      FARG_DACMCP4921_Write_dat+1
	CALL       _DACMCP4921_Write+0
;GiaoTiepDAC_MCP4921.c,48 :: 		Delay_ms(1);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
;GiaoTiepDAC_MCP4921.c,49 :: 		}
	GOTO       L_main0
;GiaoTiepDAC_MCP4921.c,52 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
