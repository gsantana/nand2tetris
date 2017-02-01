class Source
  attr_reader :dir, :name, :ext, :path
  def initialize(path)
    @path = path
    @ext = File.extname path
    @name = File.basename(path, ext)
    @dir = File.dirname path
  end

  def directory?
    File.directory?(path)
  end

  def files
    if directory?
      Dir["#{path}/*.vm"].map{|f| Source.new(f) }
    else
      [self]
    end
  end

  def lines
    File.readlines(path)
  end

  def outFile
    if directory?
      "#{path.chomp("/")}/#{name}.asm"
    else
      "#{dir}/#{name}.asm"
    end
  end
end
