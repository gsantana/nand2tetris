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
      Dir["#{path}/*.jack"].map{|f| Source.new(f) }
    else
      [self]
    end
  end

  def characters
    File.read(path).split("")
  end

  def out_file
    if directory?
      "#{path.chomp("/")}/#{name}.vm"
    else
      "#{dir}/#{name}.vm"
    end
  end
end
