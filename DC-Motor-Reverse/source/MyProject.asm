
_main:

;MyProject.c,1 :: 		void main() {
;MyProject.c,2 :: 		ADCON1 |= 0x07; //cho portA la port xuat nhap tin hieu digital
	MOVLW      7
	IORWF      ADCON1+0, 1
;MyProject.c,3 :: 		TRISA = 0xFF;
	MOVLW      255
	MOVWF      TRISA+0
;MyProject.c,4 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;MyProject.c,5 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;MyProject.c,7 :: 		while(1)
L_main0:
;MyProject.c,9 :: 		if(Button(&PORTA, 0, 20, 0))
	MOVLW      PORTA+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      20
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main2
;MyProject.c,11 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;MyProject.c,12 :: 		while(Button(&PORTA, 0, 20, 0));
L_main3:
	MOVLW      PORTA+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      20
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main4
	GOTO       L_main3
L_main4:
;MyProject.c,13 :: 		}
L_main2:
;MyProject.c,14 :: 		if(Button(&PORTA, 1, 20, 0))
	MOVLW      PORTA+0
	MOVWF      FARG_Button_port+0
	MOVLW      1
	MOVWF      FARG_Button_pin+0
	MOVLW      20
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main5
;MyProject.c,16 :: 		PORTB = 0x01;
	MOVLW      1
	MOVWF      PORTB+0
;MyProject.c,17 :: 		while(Button(&PORTA, 1, 20, 0));
L_main6:
	MOVLW      PORTA+0
	MOVWF      FARG_Button_port+0
	MOVLW      1
	MOVWF      FARG_Button_pin+0
	MOVLW      20
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main7
	GOTO       L_main6
L_main7:
;MyProject.c,18 :: 		}
L_main5:
;MyProject.c,19 :: 		if(Button(&PORTA, 2, 20, 0))
	MOVLW      PORTA+0
	MOVWF      FARG_Button_port+0
	MOVLW      2
	MOVWF      FARG_Button_pin+0
	MOVLW      20
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main8
;MyProject.c,21 :: 		PORTB = 0x02;
	MOVLW      2
	MOVWF      PORTB+0
;MyProject.c,22 :: 		while(Button(&PORTA, 2, 20, 0));
L_main9:
	MOVLW      PORTA+0
	MOVWF      FARG_Button_port+0
	MOVLW      2
	MOVWF      FARG_Button_pin+0
	MOVLW      20
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main10
	GOTO       L_main9
L_main10:
;MyProject.c,23 :: 		}
L_main8:
;MyProject.c,24 :: 		}
	GOTO       L_main0
;MyProject.c,25 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
