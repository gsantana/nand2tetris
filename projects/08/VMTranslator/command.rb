class Command
  attr_reader :type, :arg1, :arg2, :line, :fileName

  def initialize(type, arg1, arg2, line, fileName)
    @type = type
    @arg1 = arg1
    @arg2 = arg2
    @line = line
    @fileName = fileName
  end

  def self.is_a?(type)
    self.to_s.downcase == type
  end

  def codes
    []
    # raise "Not implemented"
  end

  def self.init
    code = [
      "// SP=256",
      "@256",
      "D=A",
      "@SP",
      "M=D"
    ]

    command = Call.new("call", "Sys.init", "0", "call Sys.init 0",nil)
    code + command.codes
  end

  def push
    [
      "@#{arg2}",
      "D=A",
      put_segment_value_into_reg_d,
      push_reg_d_into_stack
    ]
  end

  def pop
    [
      "@"+arg2,
      "D=A",
      "@"+arg1,
      "D=D+M",
      "@R13",
      "M=D",
      point_last_stack_element,
      "D=M", 
      "@R13",
      "A=M",
      "M=D"
    ]
  end

  def push_reg_d_into_stack
    [
      point_to_top_stack,
      "M=D",
      increment_stack
    ]
  end

  def put_segment_value_into_reg_d
    return [] if arg1 == 'constant'
    [
      "@#{arg1}",
      "A=D+M",
      "D=M",
    ]
  end

  def put_stack_top_value_into_reg_d
    [
      point_last_stack_element,
      "D=M"
    ]
  end

  def point_to_top_stack
    [
      "@SP",
      "A=M"
    ]
  end

  def point_last_stack_element
    [
      decrement_stack,
     "A=M"
    ]
  end

  def increment_stack
    [
      "@SP",
      "M=M+1"
    ]
  end

  def decrement_stack
    [
      "@SP",
      "M=M-1"
    ]
  end
end
