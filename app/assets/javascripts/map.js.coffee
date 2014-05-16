$ ->
  # при загрузке страницы расчитываем координаты каждого popup с ссылками на объекты
  # делаем задержку в отрисовке в 1сек, чтобы не было не верно расчитанных высот у попапов со списком объектов
  # по не известной причине, высота всех объектов оказывается выше, чем через секунду
  setTimeout( ->
    $.each($('.js-map-pointer'), (i ,elem) ->
      $pointer = $(elem)
      target = $pointer.data('target')

      # блок-popup
      console.log $target = $(".js-map-popup[data-target='#{target}']")

      console.log target_height = $target[0].clientHeight
      target_width = $target.outerWidth()
      pointer_x = parseInt($pointer.css('left'))
      pointer_y = parseInt($pointer.css('top'))

      target_x = pointer_x - target_width/2
      # вычитаем высоту pointer и стрелки у popup
      target_y = pointer_y - target_height - 32 - 11
      console.log "t_hght = #{target_height}, poi_y = #{pointer_y}, top = #{target_y}"
      $target.css({ left: "#{target_x}px", top: "#{target_y}px" })

    )
  ,1000)


  # обрабатываем клики по pointer на карте
  $(document).on('click', '.js-map-pointer', (e) ->
    e.preventDefault()
    target = $(e.target).data('target')
    $target = $(".js-map-popup[data-target='#{target}']")
    $('.js-map-popup').not($target).removeClass('visible').addClass('invisible')
    $target.toggleClass('visible', 'invisible')
  )


  # обрабатываем клики по кнопке «закрыть» в popup
  $(document).on('click', '.js-popup-close', (e) ->
    $(e.target).closest('.js-popup').removeClass('visible').addClass('invisible')
  )