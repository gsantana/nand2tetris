@R0
D=M
@n1
M=D

@R1
D=M
@n2
M=D

@sum
M=0

(LOOP)
@n1
D=M
@sum
M=M+D

@n2
M=M-1
D=M
@LOOP
D,JNE

@sum
D=M
@R2
M=D

(END)
  @END
  0;JMP


