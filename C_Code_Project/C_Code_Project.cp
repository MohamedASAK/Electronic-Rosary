#line 1 "D:/Study/3rd Year/Embedded Systems/Embedded Systems C Programming/Electronic Rosary/C_Code_Project/C_Code_Project.c"
int Flag1, Flag2, Flag3, Flag4;
bit lastIsPressed;
void flagInit() {
 Flag1 = 0;
 Flag2 = 0;
 Flag3 = 0;
 Flag4 = 0;
}
void portInit() {
 PORTB = 0;
 PORTC = 0;
 PORTD = 0;
 PORTA = 0;
}
void reset() {
 if (PORTE.B1 == 1) {
 portInit();
 flagInit();
 } else {
 PORTB.B1 = 0;
 }
}

void thousandsLoop() {
 if (Flag3 >= 9) {
 Flag3 = 0;
 PORTC = Flag3;
 Flag4++;
 }
 PORTB = Flag4;
}

void hundredsLoop() {
 if (Flag2 >= 9) {
 Flag2 = 0;
 PORTD = Flag2;
 Flag3++;
 }
 PORTC = Flag3;
 if (Flag3 > 9) {
 thousandsLoop();
 }
}

void tensLoop() {
 if (Flag1 >= 9) {
 Flag1 = 0;
 PORTA= Flag1;
 Flag2++;
 }
 PORTD = Flag2;
 if (Flag2 > 9) {
 hundredsLoop();
 }
}

void onesLoop() {
 if (Flag1 <= 9) {
 Flag1++;
 }
 PORTA = Flag1;
 if(Flag1 > 9){
 tensLoop();
 }
}

void main() {
 lastIsPressed = 1;
 TRISB = 0;
 TRISC = 0;
 TRISD = 0;
 TRISA = 0;
 ADCON1 = 0x0f;
 TRISE.B0 = 1;
 TRISE.B1 = 1;
 portInit();
 flagInit();
 while (1) {
 if (PORTE.B0 == 1 && !lastIsPressed) {
 onesLoop();
 lastIsPressed = 1;
 } else {
 lastIsPressed = PORTE.B0;
 }
 if (PORTE.B1 == 1) {
 reset();
 } else {
 PORTB.B1 = 0;
 }
 }
}
