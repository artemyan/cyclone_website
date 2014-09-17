$(document).ready ->

  $('.js-license').on 'click', ->
    href = this.href
    lightbox_container = document.createElement('div');
    lightbox_container.className = 'lightbox';
    image = document.createElement('img');
    image.src = href

    lightbox_container.appendChild(image);
    document.getElementsByTagName('body')[0].appendChild(lightbox_container);
    $('.lightbox').on 'click', ->
      $('.lightbox').remove()
    return false

