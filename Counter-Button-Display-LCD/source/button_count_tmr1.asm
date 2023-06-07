
_main:

	CLRF       main_a_L0+0
	CLRF       main_a_L0+1
	BSF        TRISC+0, 0
	CLRF       TRISB+0
	CALL       _Lcd_Init+0
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	BSF        T1CON+0, 1
	BCF        T1CON+0, 5
	BCF        T1CON+0, 5
	CLRF       TMR1H+0
	CLRF       TMR1L+0
	BSF        T1CON+0, 0
L_main0:
	MOVF       PORTC+0, 0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      20
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main2
	INCF       main_a_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_a_L0+1, 1
L_main3:
	MOVF       PORTC+0, 0
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
L_main2:
	MOVF       main_a_L0+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main7
	MOVF       main_a_L0+0, 0
	SUBLW      3
L__main7:
	BTFSC      STATUS+0, 0
	GOTO       L_main5
	CLRF       main_a_L0+0
	CLRF       main_a_L0+1
L_main5:
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      76
	MOVWF      ?lstr1_button_count_tmr1+0
	MOVLW      101
	MOVWF      ?lstr1_button_count_tmr1+1
	MOVLW      116
	MOVWF      ?lstr1_button_count_tmr1+2
	MOVLW      39
	MOVWF      ?lstr1_button_count_tmr1+3
	MOVLW      115
	MOVWF      ?lstr1_button_count_tmr1+4
	MOVLW      32
	MOVWF      ?lstr1_button_count_tmr1+5
	MOVLW      99
	MOVWF      ?lstr1_button_count_tmr1+6
	MOVLW      111
	MOVWF      ?lstr1_button_count_tmr1+7
	MOVLW      117
	MOVWF      ?lstr1_button_count_tmr1+8
	MOVLW      110
	MOVWF      ?lstr1_button_count_tmr1+9
	MOVLW      116
	MOVWF      ?lstr1_button_count_tmr1+10
	MOVLW      58
	MOVWF      ?lstr1_button_count_tmr1+11
	CLRF       ?lstr1_button_count_tmr1+12
	MOVLW      ?lstr1_button_count_tmr1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVF       main_a_L0+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      main_buffer_L0+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      main_buffer_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	GOTO       L_main0
L_end_main:
	GOTO       $+0
; end of _main
