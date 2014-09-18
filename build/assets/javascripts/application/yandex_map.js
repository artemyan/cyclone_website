(function() {
  window.onload = function() {
    var map, placemark, s;
    map = new YMaps.Map(document.getElementById("YMapsID"));
    map.setCenter(new YMaps.GeoPoint(30.293048, 59.965835), 12);
    s = new YMaps.Style();
    s.iconStyle = new YMaps.IconStyle();
    s.iconStyle.href = '/assets/images/map-marker.png';
    s.iconStyle.size = new YMaps.Point(32, 40);
    s.iconStyle.offset = new YMaps.Point(-16, -40);
    placemark = new YMaps.Placemark(new YMaps.GeoPoint(30.293048, 59.965835), {
      hideIcon: false,
      style: s
    });
    placemark.name = "ООО «ЦИКЛОН»";
    placemark.description = "Санкт-Петербург, Левашовский пр., 12, лит. А, Офис 615";
    map.addOverlay(placemark);
    return map.addControl(new YMaps.Zoom());
  };

}).call(this);
