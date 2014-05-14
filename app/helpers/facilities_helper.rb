module FacilitiesHelper


  def facility_title
    # params[:id] = 'facilities/engineering_systems/uniq_object_1'
    # return id = uniq_object_1
    id = params[:id].split('/').last

    facility = Facility.find(id)
    content_tag :h2, facility.title if facility
  end


  def facilities_submenu
    content_for :sidebar_menu do
      render_navigation context: :categories, level: 1
    end
  end

end