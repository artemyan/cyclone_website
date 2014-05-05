class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :licenses,
                :facilities,
                :facilities_by_city,
                :facilities_by_category,


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
end
