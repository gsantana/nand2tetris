//
// SP=256
@256
D=A
@SP
M=D
//push returnAddress
@Sys.init$retaj7sp1bs
D=A
@SP
A=M
M=D
@SP
M=M+1
//push LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
//push ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
//push THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
//push THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//ARG = SP-nArgs-5
@5
D=A
@0
D=D+A
@SP
D=M-D
@ARG
M=D
//LCL = SP
@SP
D=M
@LCL
M=D
//goto g
@Sys.init
0,JMP
//returnAddress:
(Sys.init$retaj7sp1bs)
//function Sys.init 0
(Sys.init)
//push constant 4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1
//call Main.fibonacci 1   
//push returnAddress
@Main.fibonacci$retdt8x21da
D=A
@SP
A=M
M=D
@SP
M=M+1
//push LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
//push ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
//push THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
//push THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//ARG = SP-nArgs-5
@5
D=A
@1
D=D+A
@SP
D=M-D
@ARG
M=D
//LCL = SP
@SP
D=M
@LCL
M=D
//goto g
@Main.fibonacci
0,JMP
//returnAddress:
(Main.fibonacci$retdt8x21da)
//Sys
(WHILE)
//Sys
@WHILE
0,JMP
//function Main.fibonacci 0
(Main.fibonacci)
//push argument 0
@0
D=A
@ARG
A=D+M
D=M
@SP
A=M
M=D
@SP
M=M+1
//push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
//["lt"]
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
@JUMPwhd8hhnt
D,JLT
@SP
A=M
M=0
@ENDwhd8hhnt
0;JMP
0;JMP
(JUMPwhd8hhnt)
@SP
A=M
M=-1
(ENDwhd8hhnt)
@SP
M=M+1
//Main
@SP
M=M-1
A=M
D=M
@IF_TRUE
D,JNE
//Main
@IF_FALSE
0,JMP
//Main
(IF_TRUE)
//push argument 0        
@0
D=A
@ARG
A=D+M
D=M
@SP
A=M
M=D
@SP
M=M+1
//["return"]
// endFrame=LCL
@LCL
D=M
@R13
M=D
// retAddr = *(endFrame-5)
@5
D=A
@R13
A=M-D
D=M
@R14
M=D
// *ARG = pop
@SP
M=M-1
A=M
D=M
@ARG
A=M
M=D
// SP=ARG+1
@ARG
D=M+1
@SP
M=D
// THAT = *(endFramee-1)
@R13
A=M-1
D=M
@THAT
M=D
// THIS = *(endFrame-2)
@2
D=A
@R13
A=M-D
D=M
@THIS
M=D
// ARG = *(endFrame-3)
@3
D=A
@R13
A=M-D
D=M
@ARG
M=D
// LCL = *(endFrame-4)
@4
D=A
@R13
A=M-D
D=M
@LCL
M=D
// goto retAddr
@R14
A=M
0;JMP
//Main
(IF_FALSE)
//push argument 0
@0
D=A
@ARG
A=D+M
D=M
@SP
A=M
M=D
@SP
M=M+1
//push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
//["sub"]
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M-D
@SP
M=M+1
//call Main.fibonacci 1  
//push returnAddress
@Main.fibonacci$retv33b8f66
D=A
@SP
A=M
M=D
@SP
M=M+1
//push LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
//push ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
//push THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
//push THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//ARG = SP-nArgs-5
@5
D=A
@1
D=D+A
@SP
D=M-D
@ARG
M=D
//LCL = SP
@SP
D=M
@LCL
M=D
//goto g
@Main.fibonacci
0,JMP
//returnAddress:
(Main.fibonacci$retv33b8f66)
//push argument 0
@0
D=A
@ARG
A=D+M
D=M
@SP
A=M
M=D
@SP
M=M+1
//push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
//["sub"]
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M-D
@SP
M=M+1
//call Main.fibonacci 1  
//push returnAddress
@Main.fibonacci$retmm2bymvh
D=A
@SP
A=M
M=D
@SP
M=M+1
//push LCL
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
//push ARG
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
//push THIS
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
//push THAT
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
//ARG = SP-nArgs-5
@5
D=A
@1
D=D+A
@SP
D=M-D
@ARG
M=D
//LCL = SP
@SP
D=M
@LCL
M=D
//goto g
@Main.fibonacci
0,JMP
//returnAddress:
(Main.fibonacci$retmm2bymvh)
//["add"]
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M+D
@SP
M=M+1
//["return"]
// endFrame=LCL
@LCL
D=M
@R13
M=D
// retAddr = *(endFrame-5)
@5
D=A
@R13
A=M-D
D=M
@R14
M=D
// *ARG = pop
@SP
M=M-1
A=M
D=M
@ARG
A=M
M=D
// SP=ARG+1
@ARG
D=M+1
@SP
M=D
// THAT = *(endFramee-1)
@R13
A=M-1
D=M
@THAT
M=D
// THIS = *(endFrame-2)
@2
D=A
@R13
A=M-D
D=M
@THIS
M=D
// ARG = *(endFrame-3)
@3
D=A
@R13
A=M-D
D=M
@ARG
M=D
// LCL = *(endFrame-4)
@4
D=A
@R13
A=M-D
D=M
@LCL
M=D
// goto retAddr
@R14
A=M
0;JMP
