# Contains methods for menu links display
module BannerHelper

  def render_banner type, title=nil
    content_for :banner do
      content_tag :div, class: 'banner banner--'+type.to_s  do
        if title
          content_tag :h3, class: 'banner__title' do
            title.to_s
          end
        end
      end

    end
  end
end