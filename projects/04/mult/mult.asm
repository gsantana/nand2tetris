// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

@R0
D=M
@n1
M=D   // n1 = R0

@R1
D=M
@n2
M=D   // n1 = R0

@sum
M=0    // sum=0


(LOOP)
  @n2
  D=M
  @STOP
  D;JEQ  //if n2 = 0 goto STOP

  @n1
  D=M
  @sum
  M=M+D  //sum = sum + n1

  @n2
  M=M-1 //n2 = n2 -1
  @LOOP
  0;JMP

(STOP)
  @sum
  D=M
  @R2
  M=D   //R2=sum

(END)
  @END
  0;JMP







