(function() {
  $(function() {
    var $main, margin_left, min_height, possible_height, window_width;
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
        $main.css({
          height: min_height
        });
      }
      console.log(window_width = $(window).width());
      console.log(margin_left = (1200 - window_width) / 2);
      return $main.find('.js-home-menu-bg').css({
        width: "" + window_width + "px",
        'margin-left': "" + margin_left + "px"
      });
    }
  });

}).call(this);
