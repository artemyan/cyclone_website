# Adds a method which adds breadcrumbs to a view
class BreadcrumbsPresenter < Middleman::Extension

  def initialize(app, options_hash={}, &block)
    super
  end

  helpers do

    # Renders breadcrumbs
    # @note is used in map view and others
    # @param page [] current page
    def breadcrumbs(page)
      hierarchy = [page]
      hierarchy.unshift hierarchy.first.parent while hierarchy.first.parent
      hierarchy.collect do |hierarchy_page|
        # Use ordinary title if not detailed otherwise
        title = if hierarchy_page.data.breadcrumb_title.present?
          hierarchy_page.data.breadcrumb_title
        elsif hierarchy_page.data.title.present?
          hierarchy_page.data.title
        else
          # @example
          #   "kzs_spb"
          request.path.split("/").pop(2).first
        end
        # For last page show only a title
        if hierarchy_page == hierarchy.last
          content_tag(:span) do
            title
          end
        else
          link_to title, "/#{hierarchy_page.path}"
        end
      end[0...-1].join(h ' > ')
    end
  end
end

::Middleman::Extensions.register(:breadcrumbs_presenter, BreadcrumbsPresenter)