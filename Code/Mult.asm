// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

//R2 become 0
@R2
M=0

//Determine whether R0 and R1 is >=0
@R1
D=M
@GetEND
D;JLT
//************************
@R0
D=M
@GetEND
D;JLT

//Make the Multiplication Loop
(Loop)
@R1
M=M-1
@R1
D=M
@GetEND
D;JLT
@R0
D=M
@R2
M=D+M
@Loop
0;JMP

//Determine whether R2 < 32768
@R2
D=M
@32768
D=D-A
@GetEND
D;JLT
@R2
M=0

//END, this can't delete the 0;JMP, when i delete "0;JMP" ,the procedure will go down foever untill last line
(GetEND)
@GetEND
0;JMP



//The CPU told the Mult.asm is successful
//But i don't know when i write "@32768" in the Mult.asm ,then, after
//this floder enter the CPU , "@32768" become "@16"
//And i don't know why this Mult.asm will success when IN is 6 and 7 after the"@32768" become "@16"
