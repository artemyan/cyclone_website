(function() {
  $(document).ready(function() {
    return $('.js-license').on('click', function() {
      var href, image, lightbox_container;
      href = this.href;
      lightbox_container = document.createElement('div');
      lightbox_container.className = 'lightbox';
      image = document.createElement('img');
      image.src = href;
      lightbox_container.appendChild(image);
      document.getElementsByTagName('body')[0].appendChild(lightbox_container);
      $('.lightbox').on('click', function() {
        return $('.lightbox').remove();
      });
      return false;
    });
  });

}).call(this);
