class FacilityPresenter < Middleman::Extension
  def initialize(app, options_hash={}, &block)
    super
  end

  helpers do

    def facilities
      data.facilities
    end

    def facilities_find(id)
      facilities.select { |c| c.id==id }.first
    end

    def facility_path(id)
      facility = facilities_find id
      "#{facility.category_id}/#{facility.id}" if facility
    end


    def facilities_by_city
      facilities.group_by { |x| x.city_id }
    end

    def facilities_by_category
      facilities.group_by { |x| x.category_id }
    end


    # Returns links for a facilities page sidebar
    # @note is called at facilities page
    # @note facilities must be last in main_menu_links or it should be changed
    def sidebar_links
      data.categories.dup << data.main_menu_links.last
    end

  end
end

::Middleman::Extensions.register(:facility_presenter, FacilityPresenter)
