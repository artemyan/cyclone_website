class Facility
  attr_reader :title, :path, :city, :category

  def initialize(obj)
    @facility = obj
    @title = obj[:title]
    @city = obj[:city]
    @category = obj[:category]
    @path = generate_path(obj[:uniq_name])
  end

  def generate_path(title)
    "facilities/#{title}" if title
  end



  def self.all
    FACILITIES.map{|obj| Facility.new(HashTransform.keys_to_symbols(obj)) }
  end

  def self.group_by_city
    self.all.group_by{ |x| x.city }
  end

  def self.group_by_category
    self.all.group_by{ |x| x.category }
  end

end