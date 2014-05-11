class Category
  attr_reader :id, :title, :path

  def initialize(obj)
    @category = obj
    @id = obj[:id]
    @title = obj[:title]
    @path = generate_path(obj[:id])
  end

  def generate_path(id)
    "facilities/#{id}" if id
  end



  def self.all
    CATEGORIES.map{|obj| Category.new(HashTransform.keys_to_symbols(obj)) }
  end

  def self.find(id)
    all.select{|c| c.id==id}.first
  end

end