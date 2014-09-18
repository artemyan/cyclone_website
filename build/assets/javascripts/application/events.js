(function() {
  $(function() {
    var $main, min_height, possible_height;
    $main = $(".js-home-menu");
    if ($main.length) {
      min_height = '660';
      possible_height = $(window).height() - $main.offset().top;
      if (possible_height > min_height) {
        $main.css({
          height: possible_height
        });
      }
      if (possible_height <= min_height) {
        return $main.css({
          height: min_height
        });
      }
    }
  });

}).call(this);
