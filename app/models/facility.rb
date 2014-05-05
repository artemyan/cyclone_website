class Facility

  def self.all
    FACILITIES.map{|obj| HashTransform.keys_to_symbols(obj) }
  end

  def self.group_by_city
    self.all.group_by{|x| x[:city]}
  end

  def self.group_by_category
    self.all.group_by{|x| x[:category]}
  end

end