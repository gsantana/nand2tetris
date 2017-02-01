class Arithmetic < Command
  def self.is_a?(type)
    ["add", "sub", "neg", "eq",
     "gt", "lt", "and", "or", "not"].include?(type)
  end

  def codes
    self.send arg1.to_sym
  end

  def add
    [
      put_stack_top_value_into_reg_d,
      point_last_stack_element,
      "M=M+D",
      increment_stack
    ]
  end

  def sub
    [
      put_stack_top_value_into_reg_d,
      point_last_stack_element,
      "M=M-D",
      increment_stack
    ]
  end

  def neg
    [
      put_stack_top_value_into_reg_d,
      "M=-D",
      increment_stack
    ]
  end

  def eq
    comparation_commands "JEQ"
  end

  def gt
    comparation_commands "JGT"
  end

  def lt
    comparation_commands "JLT"
  end

  def and
    logic_commands "M=M&D"
  end

  def or
    logic_commands "M=M|D"
  end

  def not
    [
      point_last_stack_element,
      "M=!M",
      increment_stack
    ]
  end

  def comparation_commands jump
    uniqueKey = VMTranslator.uniqueKey
    [
      put_stack_top_value_into_reg_d,
      point_last_stack_element,
      "D=M-D", 
      "@JUMP"+uniqueKey, 
      "D," + jump, 
      "@SP", 
      "A=M", 
      "M=0", 
      "@END"+uniqueKey, 
      "0;JMP",
      "0;JMP", 
      "(JUMP#{uniqueKey})",
      "@SP",
      "A=M",
      "M=-1",
      "(END#{uniqueKey})",
      increment_stack
    ]
  end

  def logic_commands(oper)
    [
      put_stack_top_value_into_reg_d,
      point_to_top_stack,
      oper,
      increment_stack
    ]
  end
end
