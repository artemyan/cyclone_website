window.onload = function () {
    var paper = Raphael("main", 1200, 733);
    var btn_width = 367,
        btn_height = 319,
        btn_offset = 185,
        padding_left = 31,
        btns_top_offset = 336;


    var path_attrs = { stroke: '#f00', cursor: 'pointer', fill: '#f00', 'fill-opacity': 0.1 };
    var text_attrs = { font: '32px HighwaySansProBold', fill: '#ea675b', 'fill-opacity': 1, stroke: 0 };
    var img_attrs = {  };


    var left_bottom_coords = function(){
        var coords = 'M';
            coords += padding_left;
            coords += ',';
            coords += '336';

            coords += 'L';
            coords += btn_offset+padding_left;
            coords += ',';
            coords += 336+btn_height;
    
            coords += 'L';
            coords += btn_offset+padding_left+btn_width;
            coords += ',';
            coords += 336+btn_height;
    
            coords += 'L';
            coords += padding_left+btn_width;
            coords += ',';
            coords += 336;
    
            coords += 'Z';

            return coords;
    }();
    var left_top_coords = function(){
        var coords = 'M';
        coords += padding_left + btn_offset;
        coords += ',';
        coords += 0;

        coords += 'L';
        coords += padding_left;
        coords += ',';
        coords += btn_height;

        coords += 'L';
        coords += padding_left+btn_width;
        coords += ',';
        coords += btn_height;

        coords += 'L';
        coords += padding_left+btn_offset+btn_width;
        coords += ',';
        coords += 0;

        coords += 'Z';
        return coords;
    }();
    var right_top_coords = function(){
        var this_offset = padding_left*2 + btn_offset + btn_width + 3,
            coords = 'M';
        coords += this_offset;
        coords += ',';
        coords += 0;

        coords += 'L';
        coords += this_offset + btn_offset;
        coords += ',';
        coords += btn_height;

        coords += 'L';
        coords += this_offset + btn_offset + btn_width;
        coords += ',';
        coords += btn_height;

        coords += 'L';
        coords += this_offset + btn_width;
        coords += ',';
        coords += 0;

        coords += 'Z';
        return coords;
    }();
    var right_bottom_coords = function(){
        var this_offset = padding_left + btn_offset + btn_width + 3,
            coords = 'M';
        coords += this_offset + padding_left + btn_offset;
        coords += ',';
        coords += btns_top_offset;

        coords += 'L';
        coords += this_offset + padding_left;
        coords += ',';
        coords += btns_top_offset + btn_height;

        coords += 'L';
        coords += this_offset + padding_left+btn_width;
        coords += ',';
        coords += btns_top_offset + btn_height;

        coords += 'L';
        coords += this_offset + padding_left+btn_offset+btn_width;
        coords += ',';
        coords += btns_top_offset;

        coords += 'Z';
        return coords;
    }();
    var center_coords = function(){
        var coords = 'M';
        coords += padding_left + btn_offset + btn_width + padding_left/2 + 2;
        coords += ',';
        coords += padding_left/2 - 6;

        coords += 'L';
        coords += padding_left*1.6 + btn_width;
        coords += ',';
        coords += btns_top_offset - 10;

        coords += 'L';
        coords += padding_left + btn_offset + btn_width + padding_left/2 + 2;
        coords += ',';
        coords += btns_top_offset + btn_height - 6;

        coords += 'L';
        coords += padding_left*1.6 + btn_width + btn_width;
        coords += ',';
        coords += btns_top_offset - 10;

        coords += 'Z';
        return coords;
    }();

    var bg = paper.image("/assets/home-bg.jpg", 0, 0, 1200, 733);



//    var left_top_img = paper.image("/assets/home/ekspluatacia_i_to_objectov.png", padding_left, 0, 553, btn_height).attr(img_attrs);
    var left_bottom_img = paper.image("/assets/home/ekspluatacia_i_to_objectov.png", padding_left, btns_top_offset, 553, btn_height).attr(img_attrs).hide();
    var right_top_img = paper.image("/assets/home/ekspluatacia_i_to_objectov.png", padding_left*2 + btn_offset + btn_width + 3, 0, 553, btn_height).attr(img_attrs).hide();

    var left_top_txt = paper.text(180, 150, "ИНЖЕНЕРНЫЕ\nСИСТЕМЫ").attr(text_attrs).attr({ 'text-anchor': 'start' });
    var left_bottom_txt = paper.text(180, 500, "ЭКСПЛУАТАЦИЯ\nИ ТО ОБЪЕКТОВ").attr(text_attrs).attr({ 'text-anchor': 'start' });
    var right_top_txt = paper.text(780, 150, "ПРОГРАММНО-\nТЕХНИЧЕСКИЕ\nКОМПЛЕКСЫ").attr(text_attrs).attr({ 'text-anchor': 'start' });
    var right_bottom_txt = paper.text(780, 500, "ОБЪЕКТЫ\nМЕДИЦИНЫ").attr(text_attrs).attr({ 'text-anchor': 'start' });
    var center_txt = paper.text(600, 320, "КАРТА\nОБЪЕКТОВ").attr(text_attrs).attr({ 'text-anchor': 'middle' });

    var left_top_path = paper.path(left_top_coords).attr(path_attrs).attr({href: '//google.com'});
    var left_bottom_path = paper.path(left_bottom_coords).attr(path_attrs).attr({href: '//google.com'});
    var right_top_path = paper.path(right_top_coords).attr(path_attrs).attr({href: '//google.com'});
    var right_bottom_path = paper.path(right_bottom_coords).attr(path_attrs).attr({href: '//google.com'});
    var center_path = paper.path(center_coords).attr(path_attrs).attr({href: '//google.com'});




    function default_btn_styles(item){
        item.hide()
    };
    function default_txt_styles(item){
        item.attr(text_attrs);
    };

    function hover_btn_styles(item){
        item.show()
    };
    function hover_txt_styles(item){
        item.attr({ fill: '#fff', 'fill-opacity': 1 });
    };


    var path_hover = function(img, txt){
        if(img)
            hover_btn_styles(img);
        if(txt)
            hover_txt_styles(txt);
    };
    var path_unhover = function(img, txt){
        if(img)
            default_btn_styles(img);
        if(txt)
            default_txt_styles(txt);
    };


    left_top_path.hover(
        function(){path_hover(null, left_top_txt)},
        function(){path_unhover(null, left_top_txt)}
    );

    left_bottom_path.hover(
        function(){path_hover(left_bottom_img, left_bottom_txt)},
        function(){path_unhover(left_bottom_img, left_bottom_txt)}
    );

    right_top_path.hover(
        function(){path_hover(right_top_img, right_top_txt)},
        function(){path_unhover(right_top_img, right_top_txt)}
    );

    right_bottom_path.hover(
        function(){path_hover(null, right_bottom_txt)},
        function(){path_unhover(null, right_bottom_txt)}
    );

    center_path.hover(
        function(){path_hover(null, center_txt)},
        function(){path_unhover(null, center_txt)}
    );

    paper.safari();
};


jQuery(document).ready(function(){
    // выставляем задержку,т.к.после инициализации jquery сам raphael еще не отрисовывает текст
    setTimeout(function(){$('text').css({'text-decoration':'underline'});}, 500);
});