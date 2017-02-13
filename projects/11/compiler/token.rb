class Token
  attr_reader :value, :type

  def initialize(value,type)
    value.gsub!('"', '') if type == :string_constant
    @value = value
    @type = type
  end

  def xml
    "<#{type_camelize}>#{sanitize(value)}</#{type_camelize}>"
  end

  def sanitize(string)
    string.tap(&encode_amp).tap(&encode_lt).tap(&encode_gt).tap(&encode_quot)
  end

  def type_camelize
    type.to_s.split('_').reduce(''){|acc,v| acc = acc+v.capitalize}.tap { |e| e[0] = e[0].downcase }
  end

  def encode_lt
    lambda do |value|
      value.gsub!(/</, '&lt;') if value
    end
  end

  def encode_gt
    lambda do |value|
      value.gsub!(/>/, '&gt;') if value
    end
  end

  def encode_amp
    lambda do |value|
      value.gsub!(/&/, '&amp;') if value
    end
  end

  def encode_quot
    lambda do |value|
      value.gsub!(/"/, '&quot;') if value
    end
  end
  def to_s
    "#{@value} #{type}"
  end
end
