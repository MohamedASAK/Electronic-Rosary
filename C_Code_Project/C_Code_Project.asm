
_flagInit:

;C_Code_Project.c,3 :: 		void flagInit() {
;C_Code_Project.c,4 :: 		Flag1 = 0;
	CLRF       _Flag1+0
	CLRF       _Flag1+1
;C_Code_Project.c,5 :: 		Flag2 = 0;
	CLRF       _Flag2+0
	CLRF       _Flag2+1
;C_Code_Project.c,6 :: 		Flag3 = 0;
	CLRF       _Flag3+0
	CLRF       _Flag3+1
;C_Code_Project.c,7 :: 		Flag4 = 0;
	CLRF       _Flag4+0
	CLRF       _Flag4+1
;C_Code_Project.c,8 :: 		}
L_end_flagInit:
	RETURN
; end of _flagInit

_portInit:

;C_Code_Project.c,9 :: 		void portInit() {
;C_Code_Project.c,10 :: 		PORTB = 0;
	CLRF       PORTB+0
;C_Code_Project.c,11 :: 		PORTC = 0;
	CLRF       PORTC+0
;C_Code_Project.c,12 :: 		PORTD = 0;
	CLRF       PORTD+0
;C_Code_Project.c,13 :: 		PORTA = 0;
	CLRF       PORTA+0
;C_Code_Project.c,14 :: 		}
L_end_portInit:
	RETURN
; end of _portInit

_reset:

;C_Code_Project.c,15 :: 		void reset() {
;C_Code_Project.c,16 :: 		if (PORTE.B1 == 1) {
	BTFSS      PORTE+0, 1
	GOTO       L_reset0
;C_Code_Project.c,17 :: 		portInit();
	CALL       _portInit+0
;C_Code_Project.c,18 :: 		flagInit();
	CALL       _flagInit+0
;C_Code_Project.c,19 :: 		} else {
	GOTO       L_reset1
L_reset0:
;C_Code_Project.c,20 :: 		PORTB.B1 = 0;
	BCF        PORTB+0, 1
;C_Code_Project.c,21 :: 		}
L_reset1:
;C_Code_Project.c,22 :: 		}
L_end_reset:
	RETURN
; end of _reset

_thousandsLoop:

;C_Code_Project.c,24 :: 		void thousandsLoop() {
;C_Code_Project.c,25 :: 		if (Flag3 >= 9) {
	MOVLW      128
	XORWF      _Flag3+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__thousandsLoop22
	MOVLW      9
	SUBWF      _Flag3+0, 0
L__thousandsLoop22:
	BTFSS      STATUS+0, 0
	GOTO       L_thousandsLoop2
;C_Code_Project.c,26 :: 		Flag3 = 0;
	CLRF       _Flag3+0
	CLRF       _Flag3+1
;C_Code_Project.c,27 :: 		PORTC = Flag3;
	CLRF       PORTC+0
;C_Code_Project.c,28 :: 		Flag4++;
	INCF       _Flag4+0, 1
	BTFSC      STATUS+0, 2
	INCF       _Flag4+1, 1
;C_Code_Project.c,29 :: 		}
L_thousandsLoop2:
;C_Code_Project.c,30 :: 		PORTB = Flag4;
	MOVF       _Flag4+0, 0
	MOVWF      PORTB+0
;C_Code_Project.c,31 :: 		}
L_end_thousandsLoop:
	RETURN
; end of _thousandsLoop

_hundredsLoop:

;C_Code_Project.c,33 :: 		void hundredsLoop() {
;C_Code_Project.c,34 :: 		if (Flag2 >= 9) {
	MOVLW      128
	XORWF      _Flag2+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__hundredsLoop24
	MOVLW      9
	SUBWF      _Flag2+0, 0
L__hundredsLoop24:
	BTFSS      STATUS+0, 0
	GOTO       L_hundredsLoop3
;C_Code_Project.c,35 :: 		Flag2 = 0;
	CLRF       _Flag2+0
	CLRF       _Flag2+1
;C_Code_Project.c,36 :: 		PORTD = Flag2;
	CLRF       PORTD+0
;C_Code_Project.c,37 :: 		Flag3++;
	INCF       _Flag3+0, 1
	BTFSC      STATUS+0, 2
	INCF       _Flag3+1, 1
;C_Code_Project.c,38 :: 		}
L_hundredsLoop3:
;C_Code_Project.c,39 :: 		PORTC = Flag3;
	MOVF       _Flag3+0, 0
	MOVWF      PORTC+0
;C_Code_Project.c,40 :: 		if (Flag3 > 9) {
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _Flag3+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__hundredsLoop25
	MOVF       _Flag3+0, 0
	SUBLW      9
L__hundredsLoop25:
	BTFSC      STATUS+0, 0
	GOTO       L_hundredsLoop4
;C_Code_Project.c,41 :: 		thousandsLoop();
	CALL       _thousandsLoop+0
;C_Code_Project.c,42 :: 		}
L_hundredsLoop4:
;C_Code_Project.c,43 :: 		}
L_end_hundredsLoop:
	RETURN
; end of _hundredsLoop

_tensLoop:

;C_Code_Project.c,45 :: 		void tensLoop() {
;C_Code_Project.c,46 :: 		if (Flag1 >= 9) {
	MOVLW      128
	XORWF      _Flag1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__tensLoop27
	MOVLW      9
	SUBWF      _Flag1+0, 0
L__tensLoop27:
	BTFSS      STATUS+0, 0
	GOTO       L_tensLoop5
;C_Code_Project.c,47 :: 		Flag1 = 0;
	CLRF       _Flag1+0
	CLRF       _Flag1+1
;C_Code_Project.c,48 :: 		PORTA= Flag1;
	CLRF       PORTA+0
;C_Code_Project.c,49 :: 		Flag2++;
	INCF       _Flag2+0, 1
	BTFSC      STATUS+0, 2
	INCF       _Flag2+1, 1
;C_Code_Project.c,50 :: 		}
L_tensLoop5:
;C_Code_Project.c,51 :: 		PORTD = Flag2;
	MOVF       _Flag2+0, 0
	MOVWF      PORTD+0
;C_Code_Project.c,52 :: 		if (Flag2 > 9) {
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _Flag2+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__tensLoop28
	MOVF       _Flag2+0, 0
	SUBLW      9
L__tensLoop28:
	BTFSC      STATUS+0, 0
	GOTO       L_tensLoop6
;C_Code_Project.c,53 :: 		hundredsLoop();
	CALL       _hundredsLoop+0
;C_Code_Project.c,54 :: 		}
L_tensLoop6:
;C_Code_Project.c,55 :: 		}
L_end_tensLoop:
	RETURN
; end of _tensLoop

_onesLoop:

;C_Code_Project.c,57 :: 		void onesLoop() {
;C_Code_Project.c,58 :: 		if (Flag1 <= 9) {
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _Flag1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__onesLoop30
	MOVF       _Flag1+0, 0
	SUBLW      9
L__onesLoop30:
	BTFSS      STATUS+0, 0
	GOTO       L_onesLoop7
;C_Code_Project.c,59 :: 		Flag1++;
	INCF       _Flag1+0, 1
	BTFSC      STATUS+0, 2
	INCF       _Flag1+1, 1
;C_Code_Project.c,60 :: 		}
L_onesLoop7:
;C_Code_Project.c,61 :: 		PORTA = Flag1;
	MOVF       _Flag1+0, 0
	MOVWF      PORTA+0
;C_Code_Project.c,62 :: 		if(Flag1 > 9){
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _Flag1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__onesLoop31
	MOVF       _Flag1+0, 0
	SUBLW      9
L__onesLoop31:
	BTFSC      STATUS+0, 0
	GOTO       L_onesLoop8
;C_Code_Project.c,63 :: 		tensLoop();
	CALL       _tensLoop+0
;C_Code_Project.c,64 :: 		}
L_onesLoop8:
;C_Code_Project.c,65 :: 		}
L_end_onesLoop:
	RETURN
; end of _onesLoop

_main:

;C_Code_Project.c,67 :: 		void main() {
;C_Code_Project.c,68 :: 		lastIsPressed = 1;
	BSF        _lastIsPressed+0, BitPos(_lastIsPressed+0)
;C_Code_Project.c,69 :: 		TRISB = 0;
	CLRF       TRISB+0
;C_Code_Project.c,70 :: 		TRISC = 0;
	CLRF       TRISC+0
;C_Code_Project.c,71 :: 		TRISD = 0;
	CLRF       TRISD+0
;C_Code_Project.c,72 :: 		TRISA = 0;
	CLRF       TRISA+0
;C_Code_Project.c,73 :: 		ADCON1 = 0x0f;
	MOVLW      15
	MOVWF      ADCON1+0
;C_Code_Project.c,74 :: 		TRISE.B0 = 1;
	BSF        TRISE+0, 0
;C_Code_Project.c,75 :: 		TRISE.B1 = 1;
	BSF        TRISE+0, 1
;C_Code_Project.c,76 :: 		portInit();
	CALL       _portInit+0
;C_Code_Project.c,77 :: 		flagInit();
	CALL       _flagInit+0
;C_Code_Project.c,78 :: 		while (1) {
L_main9:
;C_Code_Project.c,79 :: 		if (PORTE.B0 == 1 && !lastIsPressed) {
	BTFSS      PORTE+0, 0
	GOTO       L_main13
	BTFSC      _lastIsPressed+0, BitPos(_lastIsPressed+0)
	GOTO       L_main13
L__main17:
;C_Code_Project.c,80 :: 		onesLoop();
	CALL       _onesLoop+0
;C_Code_Project.c,81 :: 		lastIsPressed = 1;
	BSF        _lastIsPressed+0, BitPos(_lastIsPressed+0)
;C_Code_Project.c,82 :: 		} else {
	GOTO       L_main14
L_main13:
;C_Code_Project.c,83 :: 		lastIsPressed = PORTE.B0;
	BTFSC      PORTE+0, 0
	GOTO       L__main33
	BCF        _lastIsPressed+0, BitPos(_lastIsPressed+0)
	GOTO       L__main34
L__main33:
	BSF        _lastIsPressed+0, BitPos(_lastIsPressed+0)
L__main34:
;C_Code_Project.c,84 :: 		}
L_main14:
;C_Code_Project.c,85 :: 		if (PORTE.B1 == 1) {
	BTFSS      PORTE+0, 1
	GOTO       L_main15
;C_Code_Project.c,86 :: 		reset();
	CALL       _reset+0
;C_Code_Project.c,87 :: 		} else {
	GOTO       L_main16
L_main15:
;C_Code_Project.c,88 :: 		PORTB.B1 = 0;
	BCF        PORTB+0, 1
;C_Code_Project.c,89 :: 		}
L_main16:
;C_Code_Project.c,90 :: 		}
	GOTO       L_main9
;C_Code_Project.c,91 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
