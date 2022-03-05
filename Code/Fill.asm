// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.

//That's select procedure
(select)
@KBD
D=M
@Screen_Black
D;JNE
@Screen_White
0;JMP

//That's Screen_White
(Screen_White)
@SCREEN
D=A
(Screen_Loop)
@24576
D=A-D
@select
D;JEQ

@24576
D=A-D
A=D
M=0
D=D+1
@Screen_Loop
0;JMP

//This's Screen_Black
(Screen_Black)
@SCREEN
D=A
(Screen_Loopone)
@24576
D=A-D
@select
D;JEQ

@24576
D=A-D
A=D
M=-1
//This can't write M=!M,because it will have black and white on screen
D=D+1
@Screen_Loopone
0;JMP
//Why the A or D will become 24577

//END ,enter the next select
//220225
//In the END ,we can delete the (END) ,get "@END" become "@select"-----this OK
