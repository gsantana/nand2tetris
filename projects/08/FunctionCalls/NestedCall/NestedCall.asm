//
// SP=256
@256
D=A
@SP
M=D
//push returnAddress
@Sys.init$ret8l3gk3cz
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
(Sys.init$ret8l3gk3cz)
//function Sys.init 0
(Sys.init)
//call Sys.main 0
//push returnAddress
@Sys.main$retw54gacbq
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
@Sys.main
0,JMP
//returnAddress:
(Sys.main$retw54gacbq)
//pop temp 1
@1
D=A
@5
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
//Sys
(LOOP)
//Sys
@LOOP
0,JMP
//function Sys.main 0
(Sys.main)
//push constant 123
@123
D=A
@SP
A=M
M=D
@SP
M=M+1
//call Sys.add12 1
//push returnAddress
@Sys.add12$retpmb2yivf
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
@Sys.add12
0,JMP
//returnAddress:
(Sys.add12$retpmb2yivf)
//pop temp 0
@0
D=A
@5
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
//push constant 246
@246
D=A
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
//function Sys.add12 3
(Sys.add12)
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
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
//push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
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
