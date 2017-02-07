class CodeWriter
  attr_reader :output
  def initialize(source)
    @output = source.outFile
  end

  def reset
    File.delete(output) if File.exist?(output)
    File.new(output, "w+")
  end

  def write(codes, line)
    File.open(output, 'a') do |f|
      f.puts "//#{line}"
      codes.each do |code|
        f.puts code
      end
    end
  end
end

