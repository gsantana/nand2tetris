COMMANDS = [Arithmetic, Push, Pop, Label, GoTo, IfGoto, Function, Call, Return]
class CommandFactory
  def self.create(type, arg1, arg2, line, fileName)
    command = COMMANDS.find{|c| c.is_a?(type)}
    command.new(type.strip, arg1.strip, arg2.strip, line, fileName)
  end
end
