#!/usr/bin/env ruby
require  'pry-byebug'

class Assembler

  def self.compile path
    parser = Parser.new path
    while line = parser.next_line
      if LabelExpression.is_a? line
        ex = LabelExpression.new line
        SymbolTable.add_label ex.label, ex.line_number
      end
    end

    parser.reset

    ast  = AST.new

    while line = parser.next_line
      if AExpression.is_a? line
        ast.add AExpression.new line
      elsif CExpression.is_a? line
        ast.add CExpression.new line
      elsif LabelExpression.is_a? line
      else
        raise "Comand not valid in line #{line.text } number #{line.number}"
      end

    end

    filename = File.basename(path)
    binary_file = "#{filename.gsub(".asm",'')}.hack"

    File.delete(binary_file) if File.exist?(binary_file)

    File.open(binary_file, 'a') do |f|
      ast.lines.each do |l|
        f.puts l.code
        puts l.code
      end
    end

  end
end


class AST

  attr_reader :lines

  def initialize
    @lines = []
  end

  def add ast
    @lines << ast
  end
end

class AExpression
  BASE_CARACTER = "@"

  attr_reader :code, :line

  def initialize(line)
    @line = line
    addr = line.text.gsub(BASE_CARACTER, "")
    value = addr.match(/^(\d)+$/) ?  addr : SymbolTable.variable(addr)
    @code = dec2bin(value)
  end

  def dec2bin(number)
    number = Integer(number)

    return "0000000000000000" if number == 0

    ret_bin = ""
    while(number != 0)
      ret_bin = String(number % 2) + ret_bin
      number = number / 2
    end
    ("0000000000000000#{ret_bin}").split(//).last(16).join("").to_s
  end

  def self.is_a? line
    line.first_caracter == BASE_CARACTER
  end
end

class CExpression

  attr_reader :dest, :comp, :jump, :line

  def initialize(line)
   @line = line
   dest_comp,  jump = line.text.split(";")
   dest_comp_arr = dest_comp.split("=")
   if dest_comp_arr.count == 1
     comp =  dest_comp_arr.first
   else
     dest, comp = dest_comp_arr
   end

   @dest = Destination.new dest
   @comp = Computation.new comp
   @jump = Jump.new jump
  end

  def code
    "111#{comp.code}#{dest.code}#{jump.code}"
  end

  def self.is_a? line
    line.first_caracter =~ /[a-zA-Z0-9]/
  end
end

class Destination

  attr_reader :code

  TABLE = {
            "null" => "000",
            "M"    => "001",
            "D"    => "010",
            "MD"   => "011",
            "A"    => "100",
            "AM"   => "101",
            "AD"   => "110",
            "AMD"  => "111"
          }

  def initialize(dest)
    dest = dest.nil? ? "null" : dest
    @code = TABLE[dest]
  end

end

class Computation

  attr_reader :code

  TABLE = {
            "0"    => "0101010",
            "1"    => "0111111",
            "-1"   => "0111010",
            "D"    => "0001100",
            "A"    => "0110000",
            "!D"   => "0001101",
            "!A"   => "0110001",
            "-D"   => "0001111",
            "-A"   => "0110011",
            "D+1"  => "0011111",
            "A+1"  => "0110111",
            "D-1"  => "0001110",
            "A-1"  => "0110010",
            "D+A"  => "0000010",
            "D-A"  => "0010011",
            "A-D"  => "0000111",
            "D&A"  => "0000000",
            "D|A"  => "0010101",
            "M"    => "1110000",
            "!M"   => "1110001",
            "M+1"  => "1110111",
            "M-1"  => "1110010",
            "D+M"  => "1000010",
            "D-M"  => "1010011",
            "M-D"  => "1000111",
            "D&M"  => "1000000",
            "D|M"  => "1010101",
          }

  def initialize(comp)
      @code = TABLE[comp]
  end
end

class Jump

  attr_reader :code

  TABLE = {
            "null" => "000",
            "JGT"  => "001",
            "JEQ"  => "010",
            "JGE"  => "011",
            "JLT"  => "100",
            "JNE"  => "101",
            "JLE"  => "110",
            "JMP"  => "111"
          }

  def initialize(jump)
    jump = jump.nil? ? "null" : jump
    @code = TABLE[jump]
  end
end

class LabelExpression
  BASE_CARACTER = "("

  attr_reader :label, :line_number

  def initialize(line)
    @label = line.text.gsub(/[(|)]/, "")
    @line_number = line.number
  end

  def self.is_a? line
    line.first_caracter == BASE_CARACTER
  end

end

class SymbolTable

  attr_reader :table, :next_variable_addr

  BASE_TABLE = {
            "R0" => 0,
            "R1" => 1,
            "R2" => 2,
            "R3" => 3,
            "R4" => 4,
            "R5" => 5,
            "R6" => 6,
            "R7" => 7,
            "R8" => 8,
            "R9" => 9,
            "R10" => 10,
            "R11" => 11,
            "R12" => 12,
            "R13" => 13,
            "R14" => 14,
            "R15" => 15,
            "SP" => 0,
            "LCL" => 1,
            "ARG" => 2,
            "THIS" => 3,
            "THAT" => 4,
            "R0-R15" => "0-15",
            "SCREEN" => 16384,
            "KBD" => 24576
          }

  def add_label label, line_number
    @table[label] = line_number
  end

  def label_value label
    @table[label]
  end

  def variable variable
    return @table[variable] if @table[variable]

    @table[variable] = @next_variable_addr
    @next_variable_addr += 1
    @table[variable]
  end

  def initialize
    @table = BASE_TABLE.dup
    @next_variable_addr = 16
  end

  @@instance = SymbolTable.new

  def self.instance
    return @@instance
  end

  def self.method_missing(method, *args)
    if instance.respond_to?(method)
      instance.send(method, *args)
    else
      super
    end
  end

end

class Parser

  attr_reader :lines, :bklines

  def initialize filename
    origin_line_number = 0
    lines = File.readlines(filename).map do |line|
      origin_line_number += 1
      Line.create(line,origin_line_number)
    end

    @bklines = lines.select{|line| !line.empty?}

    line_number = 0
    @bklines.each do |line|
      line.number = line_number
      line_number += 1 unless LabelExpression.is_a?(line)
    end

    @lines= @bklines.dup

  end

  def next_line
    @lines.shift
  end

  def reset
    @lines = @bklines.dup
  end

end

class Line

  attr_accessor :text, :number, :origin_line_number

  def initialize text, origin_line_number
    @text =  text
    @origin_line_number = origin_line_number
  end

  def remove_whitespace
      @text.gsub!(/\s/, '') if @text
  end

  def remove_linefeed
      @text.gsub!(/\n/, '') if @text
  end

  def remove_comments
      @text.gsub!(/\/\/.*/, '') if @text
  end

  def empty?
    @text.empty?
  end

  def first_caracter
    @text[0]
  end

  def number= number
    @number = number.to_s
  end

  def self.create text, origin_line_number
    Line.new(text,origin_line_number).tap do |l|
      l.remove_whitespace
      l.remove_linefeed
      l.remove_comments
    end
  end

end


Assembler.compile ARGV.first if ARGV.first
