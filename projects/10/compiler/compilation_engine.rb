class CompilationEngine

  attr_reader :tokenizer, :output, :classes

  def initialize(tokenizer,source)
    @tokenizer = tokenizer
    @output = source.out_file
    @classes = []
  end

  def compile_class
    write "<class>"
    eat('class')
    save_class eat_identifier
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
      eat(type)
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
      eat(type + ['void'])
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
    if(can_eat?(type))
      eat(type)
      eat_identifier
      while(can_eat?(','))
        eat(',')
        eat(type)
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
      write '<varDec>'
      while(can_eat?('var'))
        eat('var')
        eat(type)
        eat_identifier
        while(can_eat?(','))
          eat(',')
          eat_identifier
        end
      end
      eat(';')
      write '</varDec>'
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
        compile_expression(optional:false)
        eat(']')
      end
      eat('=')
      compile_expression(optional:false)
      eat(';')
      write '</letStatement>'
    end
  end

  def compile_if
    if(can_eat?('if'))
      write '<ifStatement>'
      eat('if')
      eat('(')
      compile_expression(optional:false)
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
      compile_expression(optional:false)
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
      if(can_eat?(classes))
        eat('.')
        eat_identifier
        eat('(')
        compile_expression_list
        eat(')')
      else
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
      end
      eat(';')
      write '</doStatement>'
    end
  end

  def compile_return
    if(can_eat?('return'))
      write '<returnStatement>'
      eat('return')
      compile_expression(optional: true)
      eat(';')
      write '</returnStatement>'
    end
  end

  def compile_expression(optional:)
    if(can_eat_term?)
      write '<expression>'
      compile_term(optional)
      while(can_eat?(op))
        eat(op)
        compile_term(optional)
      end
      write '</expression>'
    end
  end

  def compile_term(optional)
    if([:integer_constant, :string_constant, :keyword].include? current_token.type)
      write_expression { write_and_advance }
    elsif(can_eat?(unary_op))
      write_expression do
        eat(unary_op)
        write_and_advance
      end
    elsif(can_eat?('('))
      write_expression do
        eat('(')
        compile_expression(optional:false)
        eat(')')
      end
    elsif(can_eat?(classes))
      write_expression do
        eat('.')
        eat_identifier
        eat('(')
        compile_expression_list
        eat(')')
      end
    elsif(current_token.type == :identifier)
      write_expression do
        eat_identifier
        if(can_eat?('['))
          eat('[')
          compile_expression(optional:false)
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
    else
      raise "token #{current_token} not handle in expression" unless optional
    end
  end

  def can_eat_term?
    ([:integer_constant, :string_constant, :keyword, :unary_op, :identifier].include?(current_token.type)) ||
      can_eat?('(') || can_eat?(classes)
  end

  def compile_expression_list
    write '<expressionList>'
    if(can_eat_term?)
      compile_expression(optional:true)
      while(can_eat?(','))
        eat(',')
        compile_expression(optional:false)
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
    ['int','char','boolean'] + classes
  end

  def eat_identifier
    raise "#{current_token} is not an identifier" if current_token.type != :identifier
    value = current_token.value
    write_and_advance
    value
  end

  def save_class(class_name)
    classes << class_name
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
