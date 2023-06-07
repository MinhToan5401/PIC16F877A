
_LoadCharToCGRAM:

;lcd2.c,23 :: 		void LoadCharToCGRAM (char p, const char * chr)   //ham dua ki tu custom vao vi tri p
;lcd2.c,26 :: 		Lcd_Cmd(64 + p*8);
	MOVF       FARG_LoadCharToCGRAM_p+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      64
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;lcd2.c,27 :: 		for(i = 0; i<7; i++) Lcd_Chr_CP(chr[i]);
	CLRF       LoadCharToCGRAM_i_L0+0
L_LoadCharToCGRAM0:
	MOVLW      7
	SUBWF      LoadCharToCGRAM_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_LoadCharToCGRAM1
	MOVF       LoadCharToCGRAM_i_L0+0, 0
	ADDWF      FARG_LoadCharToCGRAM_chr+0, 0
	MOVWF      R0+0
	MOVF       FARG_LoadCharToCGRAM_chr+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	INCF       LoadCharToCGRAM_i_L0+0, 1
	GOTO       L_LoadCharToCGRAM0
L_LoadCharToCGRAM1:
;lcd2.c,28 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	MOVLW      2
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;lcd2.c,29 :: 		}
L_end_LoadCharToCGRAM:
	RETURN
; end of _LoadCharToCGRAM

_Lcd_ProgressBar:

;lcd2.c,31 :: 		void Lcd_ProgressBar(char row, char value, char length)
;lcd2.c,36 :: 		LoadCharToCGRAM(0, none_filled_box);
	CLRF       FARG_LoadCharToCGRAM_p+0
	MOVLW      _none_filled_box+0
	MOVWF      FARG_LoadCharToCGRAM_chr+0
	MOVLW      hi_addr(_none_filled_box+0)
	MOVWF      FARG_LoadCharToCGRAM_chr+1
	CALL       _LoadCharToCGRAM+0
;lcd2.c,37 :: 		LoadCharToCGRAM(1, filled_box);
	MOVLW      1
	MOVWF      FARG_LoadCharToCGRAM_p+0
	MOVLW      _filled_box+0
	MOVWF      FARG_LoadCharToCGRAM_chr+0
	MOVLW      hi_addr(_filled_box+0)
	MOVWF      FARG_LoadCharToCGRAM_chr+1
	CALL       _LoadCharToCGRAM+0
;lcd2.c,38 :: 		LoadCharToCGRAM(2, half_filled_box);
	MOVLW      2
	MOVWF      FARG_LoadCharToCGRAM_p+0
	MOVLW      _half_filled_box+0
	MOVWF      FARG_LoadCharToCGRAM_chr+0
	MOVLW      hi_addr(_half_filled_box+0)
	MOVWF      FARG_LoadCharToCGRAM_chr+1
	CALL       _LoadCharToCGRAM+0
;lcd2.c,39 :: 		value = value * length / (float)100;
	MOVF       FARG_Lcd_ProgressBar_value+0, 0
	MOVWF      R0+0
	MOVF       FARG_Lcd_ProgressBar_length+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	CALL       _int2double+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      72
	MOVWF      R4+2
	MOVLW      133
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	CALL       _double2byte+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_ProgressBar_value+0
;lcd2.c,40 :: 		for(i = 1; i<=length; i++)
	MOVLW      1
	MOVWF      Lcd_ProgressBar_i_L0+0
	CLRF       Lcd_ProgressBar_i_L0+1
	CLRF       Lcd_ProgressBar_i_L0+2
	CLRF       Lcd_ProgressBar_i_L0+3
L_Lcd_ProgressBar3:
	MOVF       Lcd_ProgressBar_i_L0+3, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__Lcd_ProgressBar16
	MOVF       Lcd_ProgressBar_i_L0+2, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__Lcd_ProgressBar16
	MOVF       Lcd_ProgressBar_i_L0+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__Lcd_ProgressBar16
	MOVF       Lcd_ProgressBar_i_L0+0, 0
	SUBWF      FARG_Lcd_ProgressBar_length+0, 0
L__Lcd_ProgressBar16:
	BTFSS      STATUS+0, 0
	GOTO       L_Lcd_ProgressBar4
;lcd2.c,42 :: 		Lcd_Chr(row, i, 0);
	MOVF       FARG_Lcd_ProgressBar_row+0, 0
	MOVWF      FARG_Lcd_Chr_row+0
	MOVF       Lcd_ProgressBar_i_L0+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	CLRF       FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;lcd2.c,40 :: 		for(i = 1; i<=length; i++)
	MOVF       Lcd_ProgressBar_i_L0+0, 0
	MOVWF      R0+0
	MOVF       Lcd_ProgressBar_i_L0+1, 0
	MOVWF      R0+1
	MOVF       Lcd_ProgressBar_i_L0+2, 0
	MOVWF      R0+2
	MOVF       Lcd_ProgressBar_i_L0+3, 0
	MOVWF      R0+3
	INCF       R0+0, 1
	BTFSC      STATUS+0, 2
	INCF       R0+1, 1
	BTFSC      STATUS+0, 2
	INCF       R0+2, 1
	BTFSC      STATUS+0, 2
	INCF       R0+3, 1
	MOVF       R0+0, 0
	MOVWF      Lcd_ProgressBar_i_L0+0
	MOVF       R0+1, 0
	MOVWF      Lcd_ProgressBar_i_L0+1
	MOVF       R0+2, 0
	MOVWF      Lcd_ProgressBar_i_L0+2
	MOVF       R0+3, 0
	MOVWF      Lcd_ProgressBar_i_L0+3
;lcd2.c,43 :: 		}
	GOTO       L_Lcd_ProgressBar3
L_Lcd_ProgressBar4:
;lcd2.c,44 :: 		for(j = 1; j <= value; j++)
	MOVLW      1
	MOVWF      Lcd_ProgressBar_j_L0+0
	CLRF       Lcd_ProgressBar_j_L0+1
	CLRF       Lcd_ProgressBar_j_L0+2
	CLRF       Lcd_ProgressBar_j_L0+3
L_Lcd_ProgressBar6:
	MOVF       Lcd_ProgressBar_j_L0+3, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__Lcd_ProgressBar17
	MOVF       Lcd_ProgressBar_j_L0+2, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__Lcd_ProgressBar17
	MOVF       Lcd_ProgressBar_j_L0+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__Lcd_ProgressBar17
	MOVF       Lcd_ProgressBar_j_L0+0, 0
	SUBWF      FARG_Lcd_ProgressBar_value+0, 0
L__Lcd_ProgressBar17:
	BTFSS      STATUS+0, 0
	GOTO       L_Lcd_ProgressBar7
;lcd2.c,47 :: 		b = j * 10 / (length/(float)10);
	MOVF       Lcd_ProgressBar_j_L0+0, 0
	MOVWF      R0+0
	MOVF       Lcd_ProgressBar_j_L0+1, 0
	MOVWF      R0+1
	MOVF       Lcd_ProgressBar_j_L0+2, 0
	MOVWF      R0+2
	MOVF       Lcd_ProgressBar_j_L0+3, 0
	MOVWF      R0+3
	MOVLW      10
	MOVWF      R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Mul_32x32_U+0
	MOVF       R0+0, 0
	MOVWF      FLOC__Lcd_ProgressBar+4
	MOVF       R0+1, 0
	MOVWF      FLOC__Lcd_ProgressBar+5
	MOVF       R0+2, 0
	MOVWF      FLOC__Lcd_ProgressBar+6
	MOVF       R0+3, 0
	MOVWF      FLOC__Lcd_ProgressBar+7
	MOVF       FARG_Lcd_ProgressBar_length+0, 0
	MOVWF      R0+0
	CALL       _byte2double+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      130
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      FLOC__Lcd_ProgressBar+0
	MOVF       R0+1, 0
	MOVWF      FLOC__Lcd_ProgressBar+1
	MOVF       R0+2, 0
	MOVWF      FLOC__Lcd_ProgressBar+2
	MOVF       R0+3, 0
	MOVWF      FLOC__Lcd_ProgressBar+3
	MOVF       FLOC__Lcd_ProgressBar+4, 0
	MOVWF      R0+0
	MOVF       FLOC__Lcd_ProgressBar+5, 0
	MOVWF      R0+1
	MOVF       FLOC__Lcd_ProgressBar+6, 0
	MOVWF      R0+2
	MOVF       FLOC__Lcd_ProgressBar+7, 0
	MOVWF      R0+3
	CALL       _longword2double+0
	MOVF       FLOC__Lcd_ProgressBar+0, 0
	MOVWF      R4+0
	MOVF       FLOC__Lcd_ProgressBar+1, 0
	MOVWF      R4+1
	MOVF       FLOC__Lcd_ProgressBar+2, 0
	MOVWF      R4+2
	MOVF       FLOC__Lcd_ProgressBar+3, 0
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	CALL       _double2longword+0
;lcd2.c,48 :: 		ByteToStr(b, percent); //convert byte to string and save the the variable to percent
	MOVF       R0+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      Lcd_ProgressBar_percent_L0+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
;lcd2.c,49 :: 		Lcd_Out(2, 1, percent); //out the percent
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      Lcd_ProgressBar_percent_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lcd2.c,52 :: 		Lcd_Chr_CP('%');
	MOVLW      37
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;lcd2.c,53 :: 		Lcd_Chr(row, j, 1);
	MOVF       FARG_Lcd_ProgressBar_row+0, 0
	MOVWF      FARG_Lcd_Chr_row+0
	MOVF       Lcd_ProgressBar_j_L0+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;lcd2.c,54 :: 		Delay_ms(300);
	MOVLW      8
	MOVWF      R11+0
	MOVLW      157
	MOVWF      R12+0
	MOVLW      5
	MOVWF      R13+0
L_Lcd_ProgressBar9:
	DECFSZ     R13+0, 1
	GOTO       L_Lcd_ProgressBar9
	DECFSZ     R12+0, 1
	GOTO       L_Lcd_ProgressBar9
	DECFSZ     R11+0, 1
	GOTO       L_Lcd_ProgressBar9
	NOP
	NOP
;lcd2.c,44 :: 		for(j = 1; j <= value; j++)
	MOVF       Lcd_ProgressBar_j_L0+0, 0
	MOVWF      R0+0
	MOVF       Lcd_ProgressBar_j_L0+1, 0
	MOVWF      R0+1
	MOVF       Lcd_ProgressBar_j_L0+2, 0
	MOVWF      R0+2
	MOVF       Lcd_ProgressBar_j_L0+3, 0
	MOVWF      R0+3
	INCF       R0+0, 1
	BTFSC      STATUS+0, 2
	INCF       R0+1, 1
	BTFSC      STATUS+0, 2
	INCF       R0+2, 1
	BTFSC      STATUS+0, 2
	INCF       R0+3, 1
	MOVF       R0+0, 0
	MOVWF      Lcd_ProgressBar_j_L0+0
	MOVF       R0+1, 0
	MOVWF      Lcd_ProgressBar_j_L0+1
	MOVF       R0+2, 0
	MOVWF      Lcd_ProgressBar_j_L0+2
	MOVF       R0+3, 0
	MOVWF      Lcd_ProgressBar_j_L0+3
;lcd2.c,55 :: 		}
	GOTO       L_Lcd_ProgressBar6
L_Lcd_ProgressBar7:
;lcd2.c,56 :: 		}
L_end_Lcd_ProgressBar:
	RETURN
; end of _Lcd_ProgressBar

_main:

;lcd2.c,58 :: 		void main() {
;lcd2.c,59 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;lcd2.c,60 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); //tat con tro
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;lcd2.c,61 :: 		Lcd_Out(1, 1, "LOADING..."); //xuat ki tu character1 ra cot 1 hang 1 tu vi tri 0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_lcd2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lcd2.c,62 :: 		Lcd_ProgressBar(3, 75, 20);
	MOVLW      3
	MOVWF      FARG_Lcd_ProgressBar_row+0
	MOVLW      75
	MOVWF      FARG_Lcd_ProgressBar_value+0
	MOVLW      20
	MOVWF      FARG_Lcd_ProgressBar_length+0
	CALL       _Lcd_ProgressBar+0
;lcd2.c,64 :: 		Lcd_Out(1, 1, "System Ready!");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_lcd2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lcd2.c,65 :: 		while(1)
L_main10:
;lcd2.c,67 :: 		Lcd_Cmd(_LCD_TURN_ON);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;lcd2.c,68 :: 		Delay_ms(500);
	MOVLW      13
	MOVWF      R11+0
	MOVLW      175
	MOVWF      R12+0
	MOVLW      182
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
	DECFSZ     R11+0, 1
	GOTO       L_main12
	NOP
;lcd2.c,69 :: 		Lcd_Cmd(_LCD_TURN_OFF);
	MOVLW      8
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;lcd2.c,70 :: 		Delay_ms(500);
	MOVLW      13
	MOVWF      R11+0
	MOVLW      175
	MOVWF      R12+0
	MOVLW      182
	MOVWF      R13+0
L_main13:
	DECFSZ     R13+0, 1
	GOTO       L_main13
	DECFSZ     R12+0, 1
	GOTO       L_main13
	DECFSZ     R11+0, 1
	GOTO       L_main13
	NOP
;lcd2.c,71 :: 		}
	GOTO       L_main10
;lcd2.c,72 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
