
_main:

;PWM_DC_motor.c,1 :: 		void main() {
;PWM_DC_motor.c,2 :: 		unsigned short dc = 0;
	CLRF       main_dc_L0+0
;PWM_DC_motor.c,3 :: 		ADCON1 |= 0x07;
	MOVLW      7
	IORWF      ADCON1+0, 1
;PWM_DC_motor.c,4 :: 		TRISA = 0xFF;
	MOVLW      255
	MOVWF      TRISA+0
;PWM_DC_motor.c,5 :: 		TRISC = 0x00;
	CLRF       TRISC+0
;PWM_DC_motor.c,7 :: 		PWM1_Init(500);
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;PWM_DC_motor.c,8 :: 		PWM1_Set_Duty(dc);
	MOVF       main_dc_L0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;PWM_DC_motor.c,9 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;PWM_DC_motor.c,10 :: 		while(1)
L_main0:
;PWM_DC_motor.c,12 :: 		while(Button(&PORTA, 0, 10, 0))
L_main2:
	MOVLW      PORTA+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      10
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main3
;PWM_DC_motor.c,14 :: 		if(dc<255)
	MOVLW      255
	SUBWF      main_dc_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main4
;PWM_DC_motor.c,16 :: 		dc++;
	INCF       main_dc_L0+0, 1
;PWM_DC_motor.c,17 :: 		}
L_main4:
;PWM_DC_motor.c,18 :: 		PWM1_Set_Duty(dc);
	MOVF       main_dc_L0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;PWM_DC_motor.c,19 :: 		Delay_ms(10);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	NOP
	NOP
;PWM_DC_motor.c,20 :: 		}
	GOTO       L_main2
L_main3:
;PWM_DC_motor.c,21 :: 		while(Button(&PORTA, 1, 10, 0))
L_main6:
	MOVLW      PORTA+0
	MOVWF      FARG_Button_port+0
	MOVLW      1
	MOVWF      FARG_Button_pin+0
	MOVLW      10
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main7
;PWM_DC_motor.c,23 :: 		if(dc>0)
	MOVF       main_dc_L0+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_main8
;PWM_DC_motor.c,25 :: 		dc--;
	DECF       main_dc_L0+0, 1
;PWM_DC_motor.c,26 :: 		}
L_main8:
;PWM_DC_motor.c,27 :: 		PWM1_Set_Duty(dc);
	MOVF       main_dc_L0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;PWM_DC_motor.c,28 :: 		Delay_ms(10);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	NOP
	NOP
;PWM_DC_motor.c,29 :: 		}
	GOTO       L_main6
L_main7:
;PWM_DC_motor.c,30 :: 		}
	GOTO       L_main0
;PWM_DC_motor.c,31 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
