class Push < Command
  def codes
    self.send arg1.to_sym
  end

  def constant
    push
  end

  def local
    @arg1  = "LCL"
    push
  end

  def argument
    @arg1  = "ARG"
    push
  end

  def this
    @arg1  = "THIS"
    push
  end

  def that
    @arg1  = "THAT"
    push
  end

  def static
    [
      "@#{fileName}.#{arg2}",
      "D=M",
      push_reg_d_into_stack
    ]
  end

  def temp
    [
      "@#{arg2}",
      "D=A",
      "@5",
      "A=D+A",
      "D=M",
      point_to_top_stack,
      "M=D",
      increment_stack
    ]
  end

  def pointer
    [
      arg2 == "0" ? "@THIS" : "@THAT",
      "D=M",
      push_reg_d_into_stack
    ]
  end
end

