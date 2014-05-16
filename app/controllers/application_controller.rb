class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :licenses,
                :facilities,
                :facilities_by_city,
                :facilities_by_category,
                :cities,
                :current_category


  private

  def licenses
    _licenses = LICENSES.map{|l| HashTransform.keys_to_symbols(l) }
    @licenses ||= _licenses.map{ |l| License.new(l) }
  end

  def facilities
    @_facilities ||= Facility.all
  end

  def facilities_by_city
    @_facilities_by_city ||= Facility.group_by_city
  end

  def facilities_by_category
    @_facilities_by_category ||= Facility.group_by_category
  end

  def cities
    @_cities ||= City.all
  end


  # возвращаем категорию, внутри которой находимся
  # урл страницы может быть таким:
  #     /facilities/category_id
  #     /facilities/category_id/facility_id
  #
  def current_category
    @current_category ||= params[:id].split('/').map { |param_id| Category.find(param_id) }.compact.first
  end

end
