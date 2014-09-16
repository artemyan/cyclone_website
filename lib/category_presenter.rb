class CategoryPresenter < Middleman::Extension
  def initialize(app, options_hash={}, &block)
    super
  end

  helpers do

    def categories
      data.categories
    end

    def category_path(id)
      "facilities/#{id}" if id
    end

    def categories_find(id)
      data.categories.select { |c| c.id==id }.first
    end

  end
end


::Middleman::Extensions.register(:category_presenter, CategoryPresenter)
