// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

@SCREEN
D=A
@addrsc
M=D  //addr=SCREEN

@KBD
D=A
@addrkb
M=D   // addrkb=KBD

(LOOP)
 @addrkb
 A=M
 D=M
 @BLACK
 D;JNE  // if addr != 0 goto BLACK

 @color
 M=0  // color=0
 @FILL
 0;JMP   // goto FILL

(BLACK)
  @color
  M=-1   // color=-1
 @FILL
 0;JMP   // goto FILL

(FILL)
  @8191
  D=A
  @i
  M=D  // i=8160
  @addrsc
  D=M
  @regaddr
  M=D  //regaddr = addrsc
  @i
  D=M
  @regaddr
  M=M+D   // regaddr = regaddr + i
  @color
  D=M   
  @addrsc
  A=M
  M=D   // RAM[addrsc] = color
  (LOOP2)
  @i
  D=M
  @LOOP
  D;JEQ  //if i = 0 goto LOOP
  @color
  D=M
  @regaddr
  A=M
  M=D   // RAM[regaddr] = color
  @i
  M=M-1   // i= i -1
  @regaddr
  M=M-1  // regaddr = regaddr - 1
  @LOOP2
  0;JMP // goto LOOP2
