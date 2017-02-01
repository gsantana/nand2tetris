class GoTo < Command
  def codes
    [
      "@#{arg1}",
      "0,JMP",
    ]
  end
end
