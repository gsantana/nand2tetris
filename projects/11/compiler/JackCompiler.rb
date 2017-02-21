#!/usr/bin/env ruby
# require 'pry-byebug'
require_relative 'source'
require_relative 'jack_tokenizer'
require_relative 'token'
require_relative 'compilation_engine'
require_relative 'symbol_table'
require_relative 'vm_writer'

class JackCompiler
  def self.compile path
    source = Source.new(path)
    source.files.map do |s|
      tokenizer = JackTokenizer.new(s)
      parser = CompilationEngine.new(tokenizer, s) 
      parser.reset
      parser.compile_class
    end
  end
end

JackCompiler.compile ARGV.first if ARGV.first
