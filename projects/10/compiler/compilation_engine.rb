class CompilationEngine

  attr_reader :tokenizer, :output

  def initialize(tokenizer,source)
    @tokenizer = tokenizer
    @output = source.out_file
  end

  def compile_class
    write "<class>"
    eat('class')
    eat_identifier
    eat('{')
    compile_class_var_dec
    compile_subroutine
    eat('}')
    write "</class>"
  end

  def compile_class_var_dec
    while(can_eat?(['static','field']))
      write "<classVarDec>"
      eat(['static','field'])
      if(can_eat_identifier?)
        eat_identifier
      else
        eat(type)
      end
      eat_identifier
      while(can_eat?(','))
        eat(',')
        eat_identifier
      end
      eat(';')
      write "</classVarDec>"
    end
  end

  def compile_subroutine
    while(can_eat?(['constructor','function','method']))
      write '<subroutineDec>'
      eat(['constructor','function','method'])
      if(can_eat_identifier?)
        eat_identifier
      else
        eat(type + ['void'])
      end
      eat_identifier
      eat('(')
      compiler_parameter_list
      eat(')')
      compile_subroutine_body
      write'</subroutineDec>'
    end
  end

  def compiler_parameter_list
    write '<parameterList>'
    if(can_eat?(type) || can_eat_identifier?)
      if can_eat?(type)
        eat(type)
      else
        eat_identifier
      end
      eat_identifier
      while(can_eat?(',') || can_eat_identifier?)
        eat(',')
        if can_eat?(type)
          eat(type)
        else
          eat_identifier
        end
        eat_identifier
      end
    end
    write '</parameterList>'
  end

  def compile_subroutine_body
    write '<subroutineBody>'
    eat('{')
    compile_var_dec
    compile_statements
    eat('}')
    write '</subroutineBody>'
  end

  def compile_var_dec
    if(can_eat?('var'))
      while(can_eat?('var'))
        write '<varDec>'
        eat('var')
        if(can_eat_identifier?)
          eat_identifier
        else
          eat(type)
        end
        eat_identifier
        while(can_eat?(','))
          eat(',')
          eat_identifier
        end
        eat(';')
        write '</varDec>'
      end
    end
  end

  def compile_statements
    if(can_eat?(statement_keys))
      write '<statements>'
      while(can_eat?(statement_keys))
        compile_let
        compile_if
        compile_while
        compile_do
        compile_return
      end
      write '</statements>'
    end
  end

  def compile_let
    if(can_eat?('let'))
      write '<letStatement>'
      eat('let')
      eat_identifier
      if(can_eat?('['))
        eat('[')
        compile_expression
        eat(']')
      end
      eat('=')
      compile_expression
      eat(';')
      write '</letStatement>'
    end
  end

  def compile_if
    if(can_eat?('if'))
      write '<ifStatement>'
      eat('if')
      eat('(')
      compile_expression
      eat(')')
      eat('{')
      compile_statements
      eat('}')
      if(can_eat?('else'))
        eat('else')
        eat('{')
        compile_statements
        eat('}')
      end
      write '</ifStatement>'
    end
  end

  def compile_while
    if(can_eat?('while'))
      write '<whileStatement>'
      eat('while')
      eat('(')
      compile_expression
      eat(')')
      eat('{')
      compile_statements
      eat('}')
      write '</whileStatement>'
    end
  end

  def compile_do
    if(can_eat?('do'))
      write '<doStatement>'
      eat('do')
      eat_identifier
      if(can_eat?('('))
        eat('(')
        compile_expression_list
        eat(')')
      elsif(can_eat?('.'))
        eat('.')
        eat_identifier
        eat('(')
        compile_expression_list
        eat(')')
      else
        raise "compile_do con not handle #{current_token}"
      end
      eat(';')
      write '</doStatement>'
    end
  end

  def compile_return
    if(can_eat?('return'))
      write '<returnStatement>'
      eat('return')
      compile_expression
      eat(';')
      write '</returnStatement>'
    end
  end

  def compile_expression
    if(can_eat_term?)
      write '<expression>'
      compile_term
      while(can_eat?(op))
        eat(op)
        compile_term
      end
      write '</expression>'
    end
  end

  def compile_term
    if([:integer_constant, :string_constant, :keyword].include? current_token.type)
      write_expression { write_and_advance }
    elsif(can_eat?(unary_op))
      write_expression do
        eat(unary_op)
        compile_term
      end
    elsif(can_eat?('('))
      write_expression do
        eat('(')
        compile_expression
        eat(')')
      end
    else
      write_expression do
        eat_identifier
        if(can_eat?('['))
          eat('[')
          compile_expression
          eat(']')
        elsif(can_eat?('('))
          eat('(')
          compile_expression_list
          eat(')')
        elsif(can_eat?('.'))
          eat('.')
          eat_identifier
          eat('(')
          compile_expression_list
          eat(')')
        end
      end
    end
  end

  def can_eat_term?
    ([:integer_constant, :string_constant, :keyword, :identifier].include?(current_token.type)) ||
    unary_op.include?(current_token.value) || can_eat?('(') || can_eat_identifier?
  end

  def compile_expression_list
    write '<expressionList>'
    if(can_eat_term?)
      compile_expression
      while(can_eat?(','))
        eat(',')
        compile_expression
      end
    end
    write '</expressionList>'
  end

  def write_expression
    write '<term>'
    yield
    write '</term>'
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
    value = current_token.value
    write_and_advance
    value
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

  def write_and_advance
    write current_token.xml
    advance
  end

  def write(text)
    File.open(output, 'a') { |f| f.puts text }
  end
end
