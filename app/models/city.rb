class City
  attr_reader :id, :title, :map_x, :map_y, :path

  def initialize(obj)
    @city = obj
    @id = obj[:id]
    @title = obj[:title]
    @map_x = obj[:x]
    @map_y = obj[:y]
    @path = generate_path(obj[:id])
  end

  def generate_path(id)
    "facilities/cities/#{id}" if id
  end



  def self.all
    CITIES.map{|obj| City.new(HashTransform.keys_to_symbols(obj)) }
  end

  def self.find(id)
    all.select{|c| c.id==id}.first
  end

end