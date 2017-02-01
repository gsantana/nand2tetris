class Pop < Command
  def codes
    self.send arg1.to_sym
  end

  def constant
    push
  end

  def local
    @arg1  = "LCL"
    pop
  end

  def argument
    @arg1  = "ARG"
    pop
  end

  def this
    @arg1  = "THIS"
    pop
  end

  def that
    @arg1  = "THAT"
    pop
  end

  def static
    [
      point_last_stack_element,
      "D=M",
      "@#{fileName}.#{arg2}",
      "M=D"
    ]
  end

  def temp
    [
      "@"+arg2,
      "D=A",
      "@5",
      "D=D+A",
      "@R13",
      "M=D",
      point_last_stack_element,
      "D=M", 
      "@R13",
      "A=M",
      "M=D"
    ]
  end

  def pointer
    [
      point_last_stack_element,
      "D=M",
      arg2 == "0" ? "@THIS" : "@THAT",
      "M=D",
    ]
  end
end

