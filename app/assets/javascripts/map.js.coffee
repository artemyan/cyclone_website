$ ->
  $(document).on('page:update', ->

    # убираем обработку кликов перед тем как повесить новые,
    # чтобы избавиться от двойных-тройных срабатываний
    # после множественной перезагрузки страницы
    $(document).off('click', '.js-map-pointer')

    # при загрузке страницы расчитываем координаты каждого popup с ссылками на объекты
    # делаем задержку в отрисовке в 1сек, чтобы не было не верно расчитанных высот у попапов со списком объектов
    # по не известной причине, высота всех объектов оказывается выше, чем через секунду
    if $('.js-map-pointer').length

      # высчитываем координаты для всплывающего окна
      # передаем маркер,по которому кликнули
      # поиск подходящего всплывающего окна происходит внутри метода
      calculate_popup_coords = (elem) ->
        $pointer = $(elem)
        target = $pointer.data('target')

        # блок-popup
        $target = $(".js-map-popup[data-target='#{target}']")

        target_height = $target[0].clientHeight
        target_width = $target.outerWidth()
        pointer_x = parseInt($pointer.css('left'))
        pointer_y = parseInt($pointer.css('top'))

        target_x = pointer_x - target_width / 2
        # вычитаем высоту pointer и стрелки у popup
        target_y = pointer_y - target_height - 32 - 11
        $target.css({ left: "#{target_x}px", top: "#{target_y}px" })

        $target



      # обрабатываем клики по pointer на карте
      $(document).on('click', '.js-map-pointer', (e) ->
        e.preventDefault()
        target = $(e.target).data('target')
        $target = $(".js-map-popup[data-target='#{target}']")
        calculate_popup_coords(e.target)
        $('.js-map-popup').not($target).removeClass('visible').addClass('invisible')
        $target.toggleClass('visible', 'invisible')

        $(document).one('click', 'body', (e) ->
          $clicked = $(e.target)
          unless $clicked.closest('.js-map-pointer').length || $clicked.closest('.js-map-popup').length
            $('.js-map-popup').not($target).removeClass('visible').addClass('invisible')
            $target.toggleClass('visible', 'invisible')
        )
      )


      # обрабатываем клики по кнопке «закрыть» в popup
      $(document).on('click', '.js-popup-close', (e) ->
        $(e.target).closest('.js-popup').removeClass('visible').addClass('invisible')
      )
  )