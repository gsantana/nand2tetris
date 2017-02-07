class JackTokenizer
  def initialize(source)
    @characters = source.characters
  end

  def advance
    found = false
    token = ""
    type = ""
    posible_token = ""
    comment=false
    block_comment=false
    found_string = false
    while(!found)
      character =  @characters.shift
      return nil unless character

      token = posible_token
      posible_token = token + character
      case posible_token
      when /^class$|^constructor$|^function$|^method$|^field$|^static$|^var$|^int$|^char$|^boolean$|^void$|^true$|^false$|^null$|^this$|^let$|^do$|^if$|^else$|^while$|^return$/
        type = :keyword
      when /^\w+$/
        type = :identifier
      when /^\d+$/
        type = :integer
      when /^[{|}|(|)|\[|\]|\.|,|;|\+|\-|\*|\/|&|\||<|>|=|~]$/
        type = :symbol
      when /^\/\/$/
        comment=true
      when /^\/\*$/
        block_comment=true
      when /^\*\/$/
        block_comment=false
        posible_token = ""
      when /^"$|^".*"$/ 
        found_string = !found_string
        type = :string
      when /^\n|\r\n$/
        posible_token = ""
        comment = false
      when /^\s|\t$/
         posible_token = "" unless found_string
      else
        next if found_string
        unless comment or block_comment
          found = true 
          @characters.unshift character
        end
        posible_token = "" 
      end
    end
    Token.new(token,type)
  end
end
