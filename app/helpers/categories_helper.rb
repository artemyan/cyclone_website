module CategoriesHelper

  # рендерим объекты по текущей категории
  def render_categories_facilities
    facilities_by_category[current_category.id].map { |facility| render 'shared/facility', resource: facility }.join('').html_safe
  end
end