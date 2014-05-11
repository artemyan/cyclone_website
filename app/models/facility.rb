class Facility
  attr_reader :id, :title, :path, :city_id, :category_id

  def initialize(obj)
    @facility = obj
    @id = obj[:id]
    @title = obj[:title]
    @city_id = obj[:city_id]
    @category_id = obj[:category_id]
    @path = generate_path
  end

  def generate_path
    "facilities/#{@category_id}/#{@id}" if @id && @category_id
  end



  def self.all
    FACILITIES.map{|obj| Facility.new(HashTransform.keys_to_symbols(obj)) }
  end

  def self.group_by_city
    self.all.group_by{ |x| x.city_id }
  end

  def self.group_by_category
    self.all.group_by{ |x| x.category_id }
  end

  def self.find(id)
    all.select{|c| c.id==id}.first
  end

end