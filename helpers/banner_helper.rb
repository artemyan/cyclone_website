# Contains methods for menu links display
module BannerHelper

  def render_banner type, title=nil
    content_for :banner do
      content_tag :div, class: "banner banner--#{type}" do
        unless title.blank?
          content_tag :h3, title, class: 'banner__title'
        else
          ''
        end
      end

    end
  end
end