class CityPresenter < Middleman::Extension
  def initialize(app, options_hash={}, &block)
    super
  end

  helpers do

    def cities
      data.cities
    end

    def cities_find(id)
      cities.select { |c| c.id==id }.first
    end

  end
end


::Middleman::Extensions.register(:city_presenter, CityPresenter)
