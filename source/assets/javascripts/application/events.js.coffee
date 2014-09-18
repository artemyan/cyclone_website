$ ->
  # задаем высоту блоку с главным меню и кнопками для него
  # если высота блока больше, чем высота экрана, то делаем так,чтобы был скролл
  #
  # а если высота блока меньше,чем высота экрана,то выставляем блоку такую высоту,
  # чтобы картинка доходила до конца экрана и не было скролла
  $main = $(".js-home-menu")
  if $main.length
    # берем высоту экспериментально. В будущем когда отрефакторим svg, можно сделать автоматическую подстройку
    min_height = '660'
    possible_height = $(window).height() - $main.offset().top

    $main.css(height: possible_height) if possible_height > min_height
    $main.css(height: min_height) if possible_height <= min_height

