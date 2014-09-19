window.onload = ->
  if document.getElementById("YMapsID")
    # Создает экземпляр карты и привязывает его к созданному контейнеру
    map = new YMaps.Map(document.getElementById("YMapsID"))

    # Устанавливает начальные параметры отображения карты: центр карты и коэффициент масштабирования
    map.setCenter new YMaps.GeoPoint(30.293048,59.965835), 12 #12

    s = new YMaps.Style();
    s.iconStyle = new YMaps.IconStyle();
    s.iconStyle.href = '/assets/images/map-marker.png'
    s.iconStyle.size = new YMaps.Point(32, 40);
    s.iconStyle.offset = new YMaps.Point(-16, -40);

    placemark = new YMaps.Placemark(new YMaps.GeoPoint(30.293048,59.965835), {hideIcon: false, style: s}); #
    placemark.name = "ООО «ЦИКЛОН»";
    placemark.description = "Санкт-Петербург, Левашовский пр., 12, лит. А, Офис 615";

  #  // Добавляет метку на карту
    map.addOverlay(placemark);
    map.addControl(new YMaps.Zoom());