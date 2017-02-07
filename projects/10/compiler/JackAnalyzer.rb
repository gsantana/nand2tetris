#!/usr/bin/env ruby
require 'pry-byebug'
require_relative 'source'
require_relative 'jack_tokenizer'
require_relative 'token'

class JackAnalizer
  def self.compile source
    source = Source.new(source)
    tokenizer = JackTokenizer.new(source)
    while(token=tokenizer.advance)
      puts token
    end
  end
end

JackAnalizer.compile ARGV.first if ARGV.first
