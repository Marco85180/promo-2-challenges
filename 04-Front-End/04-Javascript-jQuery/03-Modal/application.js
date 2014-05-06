$(document).ready(function() {

  $('img').on('click', function (){
    var $overlay = $('<div>').addClass('overlay');

    $overlay.hide().appendTo($('body')).fadeIn('slow');

    var $photo = $('<img>').attr({
      src:"surf.jpg"
    }).addClass('photo');

    $photo.hide().appendTo($('body')).fadeIn('slow');

    $overlay.on('click', function(){
      $($photo).add($overlay).fadeOut('slow', function() {
        $(this).remove();
      });
    })
  })

});