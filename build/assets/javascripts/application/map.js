(function() {
  $(function() {
    var calculate_popup_coords;
    $(document).off('click', '.js-map-pointer');
    if ($('.js-map-pointer').length) {
      calculate_popup_coords = function(elem) {
        var $pointer, $target, pointer_x, pointer_y, target, target_height, target_width, target_x, target_y;
        $pointer = $(elem);
        target = $pointer.data('target');
        $target = $(".js-map-popup[data-target='" + target + "']");
        target_height = $target[0].clientHeight;
        target_width = $target.outerWidth();
        pointer_x = parseInt($pointer.css('left'));
        pointer_y = parseInt($pointer.css('top'));
        target_x = pointer_x - target_width / 2;
        target_y = pointer_y - target_height - 32 - 11;
        $target.css({
          left: "" + target_x + "px",
          top: "" + target_y + "px"
        });
        return $target;
      };
      $(document).on('click', '.js-map-pointer', function(e) {
        var $target, target;
        e.preventDefault();
        target = $(e.target).data('target');
        $target = $(".js-map-popup[data-target='" + target + "']");
        calculate_popup_coords(e.target);
        $('.js-map-popup').not($target).removeClass('visible').addClass('invisible');
        $target.toggleClass('visible', 'invisible');
        return $(document).one('click', 'body', function(e) {
          var $clicked;
          $clicked = $(e.target);
          if (!($clicked.closest('.js-map-pointer').length || $clicked.closest('.js-map-popup').length)) {
            $('.js-map-popup').not($target).removeClass('visible').addClass('invisible');
            return $target.toggleClass('visible', 'invisible');
          }
        });
      });
      return $(document).on('click', '.js-popup-close', function(e) {
        return $(e.target).closest('.js-popup').removeClass('visible').addClass('invisible');
      });
    }
  });

}).call(this);
