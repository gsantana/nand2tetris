#!/usr/bin/env ruby
# require 'pry-byebug'
require_relative 'source'
require_relative 'jack_tokenizer'
require_relative 'token'
require_relative 'compilation_engine'

class JackAnalizer
  def self.compile path
    source = Source.new(path)
    source.files.map do |s|
      tokenizer = JackTokenizer.new(s)
      parser = CompilationEngine.new(tokenizer, s) 
      parser.reset
      parser.compile_class
    end
    # parser.write('<tokens>')
    # while(token=tokenizer.advance)
       # parser.write token.xml
    # end
    # parser.write('</tokens>')
  end
end

JackAnalizer.compile ARGV.first if ARGV.first
