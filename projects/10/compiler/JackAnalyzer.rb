#!/usr/bin/env ruby
require 'pry-byebug'
require_relative 'source'
require_relative 'jack_tokenizer'
require_relative 'token'
require_relative 'compilation_engine'

class JackAnalizer
  def self.compile source
    source = Source.new(source)
    tokenizer = JackTokenizer.new(source)
    parser = CompilationEngine.new(tokenizer, source) 
    parser.reset
    parser.compile_class
    # parser.write('<tokens>')
    # while(token=tokenizer.advance)
       # parser.write token.xml
    # end
    # parser.write('</tokens>')
  end
end

JackAnalizer.compile ARGV.first if ARGV.first
