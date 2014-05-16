# coding: utf-8
module SectionHelper

  # рисуем пагон на странице
  # содержит изображение и заголовок на погоне
  def section_strap
    img = section_strap_data[:image]
    title = section_strap_data[:title]
    content_tag :div, class: 'strap' do
      if title.present? || img.present?
        image_tag("straps/#{img}") +
        content_tag(:h3, title, class: 'strap-title')
      end
    end.html_safe
  end


  private

  # определяем имя погона и заголовок для погона
  # возвращаем объект типа { image: image_path, title: title }
  def section_strap_data
    img_name = ''
    title = ''
    id = params[:id].split('/')
    if id.include?('facilities') && id.last.include?('index')
      img_name = 'map.png'
      title = 'Карта наших объектов'
    elsif current_category.present?
      img_name = 'facilities.png'
      title = current_category.try(:title)
    else
      img_name = 'default.png'
    end
    { image: img_name, title: title }
  end


end