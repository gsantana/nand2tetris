//
// SP=256
@256
D=A
@SP
M=D
//push returnAddress
@Sys.init$retiwnc63xm
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
(Sys.init$retiwnc63xm)
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
@Main.fibonacci$retxfz5m9c0
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
(Main.fibonacci$retxfz5m9c0)
//label WHILE
(WHILE)
//goto WHILE              
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
//lt                     
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
@JUMPnam7zeqp
D,JLT
@SP
A=M
M=0
@ENDnam7zeqp
0;JMP
0;JMP
(JUMPnam7zeqp)
@SP
A=M
M=-1
(ENDnam7zeqp)
@SP
M=M+1
//if-goto IF_TRUE
@SP
M=M-1
A=M
D=M
@IF_TRUE
D,JNE
//goto IF_FALSE
@IF_FALSE
0,JMP
//label IF_TRUE          
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
//return
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
//label IF_FALSE         
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
//sub
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
@Main.fibonacci$reti1nryzqu
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
(Main.fibonacci$reti1nryzqu)
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
//sub
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
@Main.fibonacci$ret3rrod2ib
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
(Main.fibonacci$ret3rrod2ib)
//add                    
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
//return
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
