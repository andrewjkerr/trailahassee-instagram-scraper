function swap_image() {
    $.get("/screensaver/new_image", function(data){
      if (data.img_url != "NO_SWAP") {
        var node = $("#" + Math.floor(Math.random() * 12));
        node.fadeOut('fast', function () {
          node.attr('src', data.img_url);
          node.fadeIn('fast');
        });
      }
      setTimeout( swap_image, 2500 );
    });
}

swap_image();  // <-- start it off
