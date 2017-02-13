class CompilationEngine

  attr_reader :tokenizer, :output, :symbol_table, :vm_writer

  def initialize(tokenizer,source)
    @tokenizer = tokenizer
    @output = source.out_file
    @symbol_table = ::SymbolTable.new
    @vm_writer = ::VMWriter.new source
  end

  def compile_class
    eat('class')
    class_name = eat_identifier
    symbol_table.set_class_name(class_name)
    eat('{')
    compile_class_var_dec
    compile_subroutine
    eat('}')
  end

  def compile_class_var_dec
    while(can_eat?(['static','field']))
      kind = eat(['static','field'])
      var_type = if(can_eat_identifier?)
               eat_identifier
             else
               eat(type)
             end

      name = eat_identifier
      symbol_table.define(name, var_type, kind)

      while(can_eat?(','))
        eat(',')
        name = eat_identifier
        symbol_table.define(name, var_type, kind)
      end
      eat(';')
    end
  end

  def compile_subroutine
    while(can_eat?(['constructor','function','method']))
      symbol_table.start_subroutine
      value = eat(['constructor','function','method'])

      function_type = if(can_eat_identifier?)
                        eat_identifier
                      else
                        eat(type + ['void'])
                      end
      symbol_table.set_subroutune_return_type(function_type)

      function_name = eat_identifier
      eat('(')
      compiler_parameter_list
      eat(')')
      compile_subroutine_body(value, function_name)
    end
  end

  def compiler_parameter_list
    if(can_eat?(type) || can_eat_identifier?)
      var_type = if can_eat?(type)
               eat(type)
             else
               eat_identifier
             end
      name = eat_identifier
      symbol_table.define(name, var_type, 'argument')
      while(can_eat?(',') || can_eat_identifier?)
        eat(',')
        var_type = if can_eat?(type)
                 eat(type)
               else
                 eat_identifier
               end
        name = eat_identifier
        symbol_table.define(name, var_type, 'argument')
      end
    end
  end

  def compile_subroutine_body(routine, function_name)
    eat('{')
    compile_var_dec
    nlocals = symbol_table.var_count('local')
    if(routine == 'method')
      vm_writer.write_function(function_name, nlocals)
      symbol_table.define('this', symbol_table.class_name, 'argument')
      vm_writer.write_push('argument',0)
      vm_writer.write_pop('pointer',0)
    end

    if(routine == 'constructor')
      vm_writer.write_function(function_name, nlocals)
      nfields = symbol_table.var_count('field')
      vm_writer.write_push('constant',nfields)
      vm_writer.write_call('Memory.alloc', 1)
      vm_writer.write_pop('pointer', 0)
    end

    if(routine == 'function')
      vm_writer.write_function("#{symbol_table.class_name}.#{function_name}", nlocals)
    end

    compile_statements
    eat('}')
  end

  def compile_var_dec
    if(can_eat?('var'))
      while(can_eat?('var'))
        eat('var')
        var_type = if(can_eat_identifier?)
                 eat_identifier
               else
                 eat(type)
               end
        name = eat_identifier
        symbol_table.define(name, var_type, 'local')
        while(can_eat?(','))
          eat(',')
          name = eat_identifier
          symbol_table.define(name, var_type, 'local')
        end
        eat(';')
      end
    end
  end

  def compile_statements
    if(can_eat?(statement_keys))
      while(can_eat?(statement_keys))
        compile_let
        compile_if
        compile_while
        compile_do
        compile_return
      end
    end
  end

  def compile_let
    if(can_eat?('let'))
      eat('let')
      value = eat_identifier
      if(can_eat?('['))
        eat('[')
        compile_expression
        eat(']')
      end
      eat('=')
      compile_expression
      symbol = symbol_table.symbol(value)
      vm_writer.write_pop(symbol.segment, symbol.index)
      eat(';')
    end
  end

  def compile_if
    if(can_eat?('if'))
      eat('if')
      eat('(')
      compile_expression
      vm_writer.write_arithmetic "neg"
      label_1 = "L1-#{uniqueKey}"
      vm_writer.write_ifgoto(label_1)
      eat(')')
      eat('{')
      compile_statements
      label_2 = "L2-#{uniqueKey}"
      vm_writer.write_goto(label_2)
      vm_writer.write_label(label_1)
      eat('}')
      if(can_eat?('else'))
        eat('else')
        eat('{')
        compile_statements
        eat('}')
      end
      vm_writer.write_label(label_2)
    end
  end

  def compile_while
    if(can_eat?('while'))
      eat('while')
      label_1 = "L1-#{uniqueKey}"
      vm_writer.write_label(label_1)
      eat('(')
      compile_expression
      vm_writer.write_arithmetic "neg"
      label_2 = "L2-#{uniqueKey}"
      vm_writer.write_goto(label_2)
      eat(')')
      eat('{')
      compile_statements
      vm_writer.write_goto(label_1)
      vm_writer.write_label(label_2)
      eat('}')
    end
  end

  def compile_do
    if(can_eat?('do'))
      eat('do')
      value = eat_identifier
      symbol = symbol_table.symbol(value)
      if(can_eat?('('))
        eat('(')
        vm_writer.write_push 'pointer', 0
        nargs = compile_expression_list
        vm_writer.write_call(value, nargs + 1)
        eat(')')
      elsif(can_eat?('.'))
        if symbol
          vm_writer.write_push symbol.segment, symbol.index
        end
        eat('.')
        func = eat_identifier
        eat('(')
        nargs = compile_expression_list
        if symbol
          vm_writer.write_call("#{value}.#{func}", nargs + 1)
        else
          vm_writer.write_call("#{value}.#{func}", nargs)
        end
        vm_writer.write_pop('temp', 0)
        eat(')')
      else
        raise "compile_do con not handle #{current_token}"
      end
      eat(';')
    end
  end

  def compile_return
    if(can_eat?('return'))
      eat('return')
      compile_expression
      if(symbol_table.subroutune_return_type == 'void')
        vm_writer.write_push('constant', 0)
      end
      vm_writer.write_return
      eat(';')
    end
  end

  def compile_expression
    if(can_eat_term?)
      compile_term
      while(can_eat?(op))
        value = eat(op)
        compile_term
        vm_writer.write_arithmetic(value)
      end
    end
  end

  def compile_term
    if(current_token.type == :integer_constant)
      value = write_and_advance
      vm_writer.write_push('constant', value)
    elsif(current_token.type == :string_constant)
      write_and_advance
    elsif(can_eat?(keyword_constant))
      if current_token.value == 'this'
        vm_writer.write_push 'pointer', 0
      end
      write_and_advance
    elsif(can_eat?(unary_op))
      value = eat(unary_op)
      compile_term
      value = "neg" if value == "-"
      vm_writer.write_arithmetic(value)
    elsif(can_eat?('('))
      eat('(')
      compile_expression
      eat(')')
    else
      token = current_token
      symbol = symbol_table.symbol(token.value)
      advance

      if(can_eat?('['))
        eat('[')
        compile_expression
        eat(']')
      elsif(can_eat?('('))
        vm_writer.write_push 'pointer', 0
        eat('(')
        nargs = compile_expression_list
        eat(')')
        vm_writer.write_call(token.value, nargs + 1)
      elsif(can_eat?('.'))
        if symbol
          vm_writer.write_push symbol.segment, symbol.index
        end
        eat('.')
        func = eat_identifier
        eat('(')
        nargs = compile_expression_list
        eat(')')
        if symbol
          vm_writer.write_call("#{token.value}.#{func}", nargs + 1)
        else
          vm_writer.write_call("#{token.value}.#{func}", nargs)
        end
      else
        vm_writer.write_push symbol.segment, symbol.index
      end
    end
  end

  def compile_expression_list
    count = 0
    if(can_eat_term?)
      compile_expression
      count = 1
      while(can_eat?(','))
        eat(',')
        compile_expression
        count = count + 1
      end
    end
    count
  end

  def can_eat_term?
    ([:integer_constant, :string_constant, :keyword, :identifier].include?(current_token.type)) ||
    unary_op.include?(current_token.value) || can_eat?('(') || can_eat_identifier?
  end

  def op
    ['+','-','*','/','&','|','<','>','=']
  end

  def unary_op
    ['-','~']
  end

  def keyword_constant
    ['true','false','null','this']
  end

  def statement_keys
    ['let','if','while','do','return']
  end

  def type
    ['int','char','boolean']
  end

  def eat_identifier
    raise "#{current_token} is not an identifier" if current_token.type != :identifier
    write_and_advance
  end

  def can_eat_identifier?
    current_token.type == :identifier
  end

  def can_eat?(string)
    strings = Array(string)
    strings.include?(current_token.value)
  end

  def eat(strings)
    strings = Array(strings)
    raise "token #{current_token} not handled #{strings} " unless strings.include?(current_token.value)
    write_and_advance
  end

  def write_and_advance
    value = current_token.value
    advance
    value
  end

  def current_token
    @current_token ||= tokenizer.advance
  end

  def advance
    @current_token = tokenizer.advance
  end

  def reset
    File.delete(output) if File.exist?(output)
    File.new(output, "w+")
  end

  def uniqueKey
    rand(36**8).to_s(36)
  end

  def write(text)
    # File.open(output, 'a') { |f| f.puts text }
  end
end
