class VMWriter
  attr_reader :output

  Operands = { "+" => "add",
               "-" => "sub",
               "*" => "call Math.multiply 2",
               "/" => "call Math.divide 2",
               "=" => "eq",
               ">" => "gt",
               "<" => "lt",
               "&" => "and",
               "|" => "or",
               "~" => "not",
             }
  

  def initialize(source)
    @output = source.out_file
  end

  def write_push(segment, index)
    write("push #{segment.to_s} #{index}")
  end

  def write_pop(segment, index)
    write("pop #{segment.to_s} #{index}")
  end

  def write_arithmetic(command)
    value = Operands[command] ? Operands[command] : command
    write(value)
  end

  def write_label(label)
    write("label #{label}")
  end

  def write_goto(label)
    write("goto #{label}")
  end

  def write_ifgoto(label)
    write("if-goto #{label}")
  end

  def write_call(name, args)
    write("call #{name} #{args}")
  end

  def write_function(name, nlocals)
    write("function #{name} #{nlocals}")
  end

  def write_return
    write("return")
  end

  def write(text)
    File.open(output, 'a') { |f| f.puts text }
  end
end
