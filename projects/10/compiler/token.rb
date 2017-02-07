class Token
  attr_reader :value, :type

  def initialize(value,type)
    @value = value.gsub('"', '')
    @type = type
  end

  def to_s
    "#{@value} #{type}"
  end
end
