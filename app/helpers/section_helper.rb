# coding: utf-8
module SectionHelper

  def section_strap
    img = section_strap_data[:image]
    title = section_strap_data[:title]
    content_tag :div, class: 'strap' do
      unless title.empty? || img.empty?
        image_tag("straps/#{img}") +
        content_tag(:h3, title, class: 'strap-title')
      end
    end.html_safe
  end

  private

  def section_strap_data
    img_name = ''
    title = ''
    _params = params[:id].split('/')
    if _params.include?('facilities') && _params.last.include?('index')
      img_name = 'map.png'
      title = 'Карта наших объектов'
    end
    { image: img_name, title: title }
  end

end