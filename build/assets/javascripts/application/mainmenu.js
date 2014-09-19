$('document').ready( function() {
     if ($('li.nested_link ul a').hasClass('selected')) {
         $('li.nested_link > a').addClass('selected');
     }
     $(function () {
        $('ul.menu li ul').hide();
        var link = $('ul.menu li a.nested_link');
        link.click(function (e) {
            var $message = $('ul.menu li ul');

            if ($message.css('display') != 'block') {
                $message.fadeIn();
                link.append('<span class="corners"></span>');
                link.css({'border-width': '3px', 'border-style': 'solid', 'border-color': '#f2594b', 'border-bottom-color': 'white', 'border-radius': '5px 5px 0 0'});
                link.addClass('open');
                $('span.corners').css('width', link.outerWidth() +'px');

                var yourClick = true;
                $(document).on('click.myEvent', function (e) {
                    if (!yourClick && $(e.target).closest('ul.menu li ul').length == 0) {
                        $message.fadeOut(50);
                        setTimeout( function() {
                            $('.corners').remove();
                        }, 50);

                        link.css({'border-color': '', 'border-radius': '5px'});
                        link.removeClass('open');

                        $(document).unbind('click.myEvent');
                    }
                    yourClick = false;
                });
            }

            e.preventDefault();
        });
    });

    setTimeout( function() {
        $('ul.menu li a:not(".selected")').each(function () {
            $(this).mouseover(function () {
                $(this).closest('ul.menu--main').find('a:not(".open"):not(".selected")').stop().animate({opacity: '0.5'}, 100);
                $(this).stop().animate({opacity: '1'}, 100);
                if ($(this).hasClass('open')) {
                    $(this).siblings().mouseover(function () {
                            $(this).siblings().css('opacity', '1');
                        }
                    );
                }
            });
            $(this).mouseout(function () {
                $(this).closest('ul').find('a:not(".open"):not(".selected")').stop().animate({opacity: '0.7'}, 100);
            });
        });
    }, 1);


});
