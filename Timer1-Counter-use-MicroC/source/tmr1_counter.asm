
_main:

	MOVLW      7
	IORWF      ADCON1+0, 1
	BSF        TRISC+0, 0
	CLRF       TRISB+0
	CLRF       TRISD+0
	BSF        T1CON+0, 1
	BCF        T1CON+0, 4
	BCF        T1CON+0, 5
	CLRF       TMR1L+0
	MOVF       TMR1L+0, 0
	MOVWF      TMR1H+0
	BSF        T1CON+0, 0
L_main0:
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
	IORWF      R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	MOVLW      0
	IORWF      R2+1, 1
	MOVF       R2+0, 0
	MOVWF      main_cnt_L0+0
	MOVF       R2+1, 0
	MOVWF      main_cnt_L0+1
	MOVF       R2+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main8
	MOVF       R2+0, 0
	SUBLW      20
L__main8:
	BTFSC      STATUS+0, 0
	GOTO       L_main2
	CLRF       main_cnt_L0+0
	CLRF       main_cnt_L0+1
	BCF        T1CON+0, 0
	CLRF       TMR1L+0
	CLRF       TMR1H+0
	BSF        T1CON+0, 0
L_main2:
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	MOVF       main_cnt_L0+0, 0
	MOVWF      R0+0
	MOVF       main_cnt_L0+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+0
	MOVF       R0+1, 0
	MOVWF      FLOC__main+1
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	MOVF       main_cnt_L0+0, 0
	MOVWF      R0+0
	MOVF       main_cnt_L0+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16X16_U+0
	MOVF       R0+0, 0
	MOVWF      main_tram_L0+0
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       main_cnt_L0+0, 0
	MOVWF      R0+0
	MOVF       main_cnt_L0+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16X16_U+0
	MOVF       R0+0, 0
	MOVWF      main_chuc_L0+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       main_cnt_L0+0, 0
	MOVWF      R0+0
	MOVF       main_cnt_L0+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      main_donvi_L0+0
	MOVF       FLOC__main+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVLW      _code7seg+0
	ADDWF      R0+0, 1
	MOVLW      hi_addr(_code7seg+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      PORTB+0
	BCF        PORTD+0, 0
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	BSF        PORTD+0, 0
	MOVF       main_tram_L0+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVLW      _code7seg+0
	ADDWF      R0+0, 1
	MOVLW      hi_addr(_code7seg+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      PORTB+0
	BCF        PORTD+0, 1
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	BSF        PORTD+0, 1
	MOVF       main_chuc_L0+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVLW      _code7seg+0
	ADDWF      R0+0, 1
	MOVLW      hi_addr(_code7seg+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      PORTB+0
	BCF        PORTD+0, 2
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	BSF        PORTD+0, 2
	MOVF       main_donvi_L0+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVLW      _code7seg+0
	ADDWF      R0+0, 1
	MOVLW      hi_addr(_code7seg+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      PORTB+0
	BCF        PORTD+0, 3
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	BSF        PORTD+0, 3
	GOTO       L_main0
L_end_main:
	GOTO       $+0
; end of _main
