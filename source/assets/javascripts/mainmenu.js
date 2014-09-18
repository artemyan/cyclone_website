$('document').ready( function() {
    $('ul.menu li a').each( function() {
        $(this).mouseover( function(){
            $(this).closest('ul.menu--main').find('a').css('color', '#f2836b');
            $(this).css('color', '#b31a09');
        });
        $(this).mouseout( function(){
            $(this).closest('ul').find('a').css('color', '#c0392b');
        });
    });

    $(function () {
        $('ul.menu li ul').hide();
        var link = $('ul.menu li a.nested_link');
        link.click(function (e) {
            var $message = $('ul.menu li ul');

            if ($message.css('display') != 'block') {
                $message.fadeIn("slow");
                link.append('<span class="corners"></span>');
                link.css('border-bottom-color', 'white');
                $('span.corners').css('width', link.width + 6 +'px');

                var yourClick = true;
                $(document).bind('click.myEvent', function (e) {
                    if (!yourClick && $(e.target).closest('ul.menu li ul').length == 0) {
                        $message.fadeOut("slow");
                        link.remove('<span class="corners"></span>');
                        link.css('border-bottom-color', '#f2594b');
                        $(document).unbind('click.myEvent');
                    }
                    yourClick = false;
                });
            }

            e.preventDefault();
        });
    });
});