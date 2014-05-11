$ ->
  # при загрузке страницы расчитываем координаты каждого popup с ссылками на объекты
  $.each($('.js-map-pointer'), (e) ->
    $pointer = $(@)
    target = $pointer.data('target')
    $target = $(".js-map-popup[data-target='#{target}']")

    target_height = $target.outerHeight()
    target_width = $target.outerWidth()
    pointer_x = parseInt($pointer.css('left'))
    pointer_y = parseInt($pointer.css('top'))

    target_x = pointer_x - target_width/2
    # вычитаем высоту pointer и стрелки у popup
    target_y = pointer_y - target_height - 32 - 11

    $target.css({ left: "#{target_x}px", top: "#{target_y}px" })

  )

  # обрабатываем клики по pointer накарте
  $(document).on('click', '.js-map-pointer', (e) ->
    e.preventDefault()
    target = $(e.target).data('target')
    $target = $(".js-map-popup[data-target='#{target}']")
    $('.js-map-popup').not($target).removeClass('visible').addClass('invisible')
    $target.toggleClass('visible', 'invisible')
  )


  # обрабатываем клики по кнопке «закрыть» в popup
  $(document).on('click', '.js-popup-close', (e) ->
    $(e.target).closest('.js-popup').fadeOut(100)
  )