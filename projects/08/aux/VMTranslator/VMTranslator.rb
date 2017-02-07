#!/usr/bin/env ruby
require_relative 'source'
require_relative 'parser'
require_relative 'code_writer'
require_relative 'command'
require_relative 'push'
require_relative 'pop'
require_relative 'label'
require_relative 'goto'
require_relative 'ifgoto'
require_relative 'function'
require_relative 'call'
require_relative 'return'
require_relative 'arithmetic'
require_relative 'command_factory'

class VMTranslator
  def self.compile source
    source = Source.new(source)
    writer = CodeWriter.new(source)
    writer.reset
    writer.write(Command.init, "") if source.directory?

    source.files.map do |s|
      parser = Parser.new(s)
      while(command = parser.next_command)
        writer.write(command.codes, command.line)
      end
    end
  end

  def self.uniqueKey
    rand(36**8).to_s(36)
  end
end

VMTranslator.compile ARGV.first if ARGV.first
