require 'slim'
Slim::Engine.disable_option_validator!


# Layout paths
set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'
set :fonts_dir, 'assets/fonts'
set :partials_dir, 'partials'
set :layouts_dir, 'layouts'


# Custom helpers
require 'lib/category_presenter'
require 'lib/facility_presenter'
require 'lib/license_presenter'
require 'lib/city_presenter'
activate :category_presenter
activate :facility_presenter
activate :license_presenter
activate :city_presenter


require 'lib/dir_manager.rb'
activate :dir_manager

require 'lib/current_link_indicator.rb'
activate :current_link_indicator

require 'lib/breadcrumbs_presenter.rb'
activate :breadcrumbs_presenter

# External plugins and extensions
activate :directory_indexes

# Routing
page '/404.html', layout: 'empty'
page 'programmes/*', layout: 'facility'
page 'hitech/*', layout: 'facility'
page 'engineering/*', layout: 'facility'
page 'exploitation/*', layout: 'facility'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
