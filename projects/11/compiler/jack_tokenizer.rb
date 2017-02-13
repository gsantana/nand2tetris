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
      if (posible_token =~  /^class$|^constructor$|^function$|^method$|^field$|^static$|^var$|^int$|^char$|^boolean$|^void$|^true$|^false$|^null$|^this$|^let$|^do$|^if$|^else$|^while$|^return$/  && character != "\n")
        type = :keyword
      elsif(posible_token =~ /^[a-zA-Z_]+$/ && character != "\n")
        type = :identifier
        posible_token = "" if comment
      elsif(posible_token =~ /^\d+$/ && character != "\n")
        type = :integer_constant
      elsif(posible_token =~ /^[{|}|(|)|\[|\]|\.|,|;|\+|\-|\*|\/|&|\||<|>|=|~]$/ && character != "\n")
        type = :symbol
      elsif(posible_token =~ /^\/\/$/)
        comment=true
      elsif(posible_token =~ /^\/\*$/)
        block_comment=true
      elsif(posible_token =~ /^\*\/$/)
        block_comment=false
        posible_token = ""
      elsif(posible_token =~ /^"$|^".*"$/)
        if comment
          posible_token = ""
        else
          found_string = !found_string
          type = :string_constant
        end
      elsif(posible_token =~ /^\n|\r\n$/)
        posible_token = ""
        comment = false
        posible_token = "" unless found_string
      elsif(posible_token =~ /^\s+$/)
        posible_token = ""
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
