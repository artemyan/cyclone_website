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
                $message.fadeIn(3000);
                link.append('<span class="corners"></span>');
                link.css({'border-width': '3px', 'border-style': 'solid', 'border-color': '#f2594b', 'border-bottom-color': 'white', 'color': '#B31A09', 'border-radius': '5px 5px 0 0'});
                link.addClass('open');
                $('span.corners').css('width', link.outerWidth() +'px');

                var yourClick = true;
                $(document).on('click.myEvent', function (e) {
                    if (!yourClick && $(e.target).closest('ul.menu li ul').length == 0) {
                        $message.fadeOut();
                        $('.corners').remove();
                        link.css({'border-color': 'transparent', 'border-radius': '5px'});
                        link.removeClass('open');

                        $(document).unbind('click.myEvent');
                    }
                    yourClick = false;
                });
            }

            e.preventDefault();
        });
    });

    $('ul.menu li a:not(".selected")').each( function() {
        $(this).mouseover( function(){
            $(this).closest('ul.menu--main').find('a:not(".selected")').css('color', '#f2836b');
            $(this).css('color', '#b31a09');
            if ($(this).hasClass('open')) {
                $(this).siblings().mouseover( function() {
                        $(this).siblings().css('color', '#b31a09');
                    }
                );
            }
        });
        $(this).mouseout( function(){
            $(this).closest('ul').find('a:not(".selected")').css('color', '#c0392b');
        });
    });
});
