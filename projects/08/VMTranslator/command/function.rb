class Function < Command
  def codes
    [
      "(#{arg1})",
      initialize_locals
    ]
  end

  def initialize_locals
      arg2.to_i.times.map do 
        [
          "@0",
          "D=A",
          point_to_top_stack,
          "M=D",
          increment_stack
        ]
      end.flatten
  end
end

