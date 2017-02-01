class IfGoto < Command
  def self.is_a?(type)
     type == "if-goto"
  end

  def codes
    [
      put_stack_top_value_into_reg_d,
      "@#{arg1}",
      "D,JNE", 
    ]
  end
end

