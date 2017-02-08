class CompilationEngine

  attr_reader :tokenizer, :output, :classes

  def initialize(tokenizer,source)
    @tokenizer = tokenizer
    @output = source.out_file
    @classes = []
  end

  def compile_class
    write "<class>"
    eat('class')
    save_class identifier
    eat('{')
    compile_class_var_dec
    compile_subroutine
    eat('}')
    write "</class>"
  end

  def compile_class_var_dec
    write "<classVarDec>"
    eat('(')
    eat(['static','field'])
    eat(['int','char','boolean'] + classes)
    identifier
    write "</classVarDec>"
  end

  def compile_subroutine
  end

  def identifier
    raise "#{current_token} is not an identifier" if current_token.type != :identifier
    value = current_token.value
    write_and_advance
    value
  end

  def save_class(class_name)
    classes << class_name
  end

  def eat(strings)
    strings = Array(strings)
    raise "#{string} not handled" if strings.include?(current_token.value)
    write_and_advance
  end

  def current_token
    @current_token ||= tokenizer.advance
  end

  def advance
    @current_token = tokenizer.advance
  end

  def reset
    File.delete(output) if File.exist?(output)
    File.new(output, "w+")
  end

  def write_and_advance
    write current_token.xml
    advance
  end

  def write(text)
    File.open(output, 'a') { |f| f.puts text }
  end
end
