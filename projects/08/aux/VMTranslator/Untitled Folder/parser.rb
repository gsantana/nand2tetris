class Parser
  def initialize source
    @commands = source.lines.map do |line|

      line = line.tap(&remove_comments)
      .tap(&remove_linefeed)

      tokens = generate_tokens(line)

      CommandFactory.create(*tokens, line, source.name) unless line.empty?
    end.flatten.compact
  end

  def next_command
    @commands.shift
  end

  def remove_comments
    lambda do |line|
      line.gsub!(/\/\/.*/, '') if line
    end
  end

  def remove_linefeed
    lambda do |line|
      line.gsub!(/\n|\r/, '') if line
    end
  end

  def generate_tokens(line)
    line.split(/\s+/)
  end
end
