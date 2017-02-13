class VMWriter
  attr_reader :output
  

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
    write(command.upcase)
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
