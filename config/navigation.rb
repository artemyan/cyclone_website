# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  # navigation.active_leaf_class = 'your_active_leaf_class'
  # navigation.autogenerate_item_ids = false
  # navigation.auto_highlight = false
  # navigation.consider_item_names_as_safe = false

  # Define the primary navigation
  navigation.items do |primary|
    # primary.dom_attributes = {id: 'menu-id', class: 'menu-class'}
    # primary.auto_highlight = false

    primary.item :company, 'компания', page_path('company')
    # primary.item :career, 'карьера', page_path('career')
    primary.item :licences, 'лицензии', page_path('licenses')
    # primary.item :pressroom, 'пресс-центр', page_path('press_room')
    primary.item :contacts, 'контакты', page_path('contacts')
  end
end
