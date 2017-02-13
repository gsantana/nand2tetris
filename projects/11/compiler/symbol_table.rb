class SymbolTable

  attr_reader :class_table, :routine_table, :class_name, :subroutune_return_type
   
  Symbol = Struct.new(:name, :type, :kind, :index, :segment)

  def initialize
    @class_table = []
    @routine_table = []
    @old_tables = []
  end

  def set_class_name(name)
    @class_name = name
  end

  def set_subroutune_return_type(type)
    @subroutune_return_type = type
  end

  def start_subroutine
    @old_tables << routine_table
    @routine_table = []
    @subroutune_return_type = nil
  end

  def define(name, type, kind)
   index = var_count(kind)
   segment = kind == "field"  ? "this" : kind
   table(kind) << Symbol.new(name, type, kind, index, segment)
  end

  def symbol(name)
    symbol = routine_table.select{|s|  s.name == name }
    return symbol.first unless symbol.empty?
    class_table.select{|s|  s.name == name }.first
  end

  def var_count(kind)
    table(kind).select{|s| s.kind == kind}.count
  end

  def table(kind)
    ['static', 'field'].include?(kind) ?  class_table : routine_table
  end
end
