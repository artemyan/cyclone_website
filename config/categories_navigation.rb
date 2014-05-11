# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  # navigation.active_leaf_class = 'your_active_leaf_class'
  # navigation.autogenerate_item_ids = false
  # navigation.auto_highlight = false
  # navigation.consider_item_names_as_safe = false

  # Define the primary navigation
  navigation.items do |primary|
    Category.all.each do |category|
      primary.auto_highlight = true

      primary.item category.id, category.title, page_path(category.path) do |submenu|
        # отрисовываем в меню и объекты по категориям, иначе не работает подсветка категории при открытии объекта
        # ссылка на категорию /facilities/cat1
        # ссылка на объект /facilities/cat1/facility_id
        Facility.group_by_category.each do |cat_id, facilities|
          if cat_id==category.id
            facilities.each do |facility|
              submenu.item facility.id, facility.title, page_path(facility.path)
            end
          end
        end
      end
    end
    primary.item :map, 'карта объектов', page_path('facilities')
  end
end
