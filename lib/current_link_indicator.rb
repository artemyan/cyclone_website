# Adds a method which checks whether link is active or not
# @note is used in main menu for example
class CurrentLinkIndicator < Middleman::Extension
  def initialize(app, options_hash={}, &block)
    super
  end

  helpers do
    def current_link_to(label, url)
      if url == '/'
        current = url == '/' && request.path == 'index.html'
      else
        current = "/#{request.path}".include?(url)
      end
      "<a href='#{url}' #{current ? 'class="selected menu__nested__link"' : 'class="not-selected menu__nested__link"' }>#{label}</a>"
    end

  end

end

::Middleman::Extensions.register(:current_link_indicator, CurrentLinkIndicator)