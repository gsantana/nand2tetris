class Call < Command
  def codes
    uniqueKey = VMTranslator.uniqueKey
    [
      "//push returnAddress",
      "@#{arg1}$ret#{uniqueKey}",
      "D=A",
      point_to_top_stack,
      "M=D",
      increment_stack,
      "//push LCL",
      "@LCL", 
      "D=M", 
      point_to_top_stack,
      "M=D", 
      increment_stack,
      "//push ARG",
      "@ARG", 
      "D=M", 
      point_to_top_stack,
      "M=D", 
      increment_stack,
      "//push THIS",
      "@THIS",
      "D=M", 
      point_to_top_stack,
      "M=D", 
      increment_stack,
      "//push THAT",
      "@THAT", 
      "D=M", 
      point_to_top_stack,
      "M=D",
      increment_stack,
      "//ARG = SP-nArgs-5",
      "@5", 
      "D=A",
      "@"+arg2,
      "D=D+A",
      "@SP", 
      "D=M-D",
      "@ARG",
      "M=D", 
      "//LCL = SP",
      "@SP",
      "D=M",
      "@LCL",
      "M=D",
      "//goto g",
      "@"+arg1, 
      "0,JMP", 
      "//returnAddress:",
      "(#{arg1}$ret#{uniqueKey})",
    ]
  end
end
