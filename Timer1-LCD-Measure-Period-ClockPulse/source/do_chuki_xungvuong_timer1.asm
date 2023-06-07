
_main:

	BSF        TRISD+0, 0
	CALL       _Lcd_Init+0
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      84
	MOVWF      ?lstr1_do_chuki_xungvuong_timer1+0
	MOVLW      32
	MOVWF      ?lstr1_do_chuki_xungvuong_timer1+1
	MOVLW      61
	MOVWF      ?lstr1_do_chuki_xungvuong_timer1+2
	CLRF       ?lstr1_do_chuki_xungvuong_timer1+3
	MOVLW      ?lstr1_do_chuki_xungvuong_timer1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	BCF        T1CON+0, 1
	BCF        T1CON+0, 4
	BCF        T1CON+0, 4
L_main0:
	CLRF       TMR1H+0
L_main2:
	BTFSS      PORTD+0, 0
	GOTO       L_main3
	GOTO       L_main2
L_main3:
L_main4:
	BTFSC      PORTD+0, 0
	GOTO       L_main5
	GOTO       L_main4
L_main5:
	BSF        T1CON+0, 0
L_main6:
	BTFSS      PORTD+0, 0
	GOTO       L_main7
	GOTO       L_main6
L_main7:
L_main8:
	BTFSC      PORTD+0, 0
	GOTO       L_main9
	GOTO       L_main8
L_main9:
	BCF        T1CON+0, 0
	MOVF       TMR1H+0, 0
	MOVWF      main_cnt_L0+0
	CLRF       main_cnt_L0+1
	MOVF       main_cnt_L0+0, 0
	MOVWF      R0+1
	CLRF       R0+0
	MOVF       R0+0, 0
	MOVWF      main_cnt_L0+0
	MOVF       R0+1, 0
	MOVWF      main_cnt_L0+1
	MOVF       TMR1L+0, 0
	IORWF      R0+0, 1
	MOVLW      0
	IORWF      R0+1, 1
	MOVF       R0+0, 0
	MOVWF      main_cnt_L0+0
	MOVF       R0+1, 0
	MOVWF      main_cnt_L0+1
	MOVLW      136
	MOVWF      R4+0
	MOVLW      19
	MOVWF      R4+1
	CALL       _Div_16X16_U+0
	MOVF       R0+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      main_buffer_L0+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      main_buffer_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      109
	MOVWF      ?lstr2_do_chuki_xungvuong_timer1+0
	MOVLW      115
	MOVWF      ?lstr2_do_chuki_xungvuong_timer1+1
	CLRF       ?lstr2_do_chuki_xungvuong_timer1+2
	MOVLW      ?lstr2_do_chuki_xungvuong_timer1+0
	MOVWF      FARG_Lcd_Out_CP_text+0
	CALL       _Lcd_Out_CP+0
	MOVLW      13
	MOVWF      R11+0
	MOVLW      175
	MOVWF      R12+0
	MOVLW      182
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
	DECFSZ     R11+0, 1
	GOTO       L_main10
	NOP
	GOTO       L_main0
L_end_main:
	GOTO       $+0
; end of _main
