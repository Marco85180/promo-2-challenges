/*
  *
  * TODO: add your code here!
  *
*/

$(document).ready(function() {
  $("#message").hide();
  $("#message").slideDown("slow");
});


$("#message-wrapper").click(function( event ) {
  event.preventDefault();
  $( "#message" ).slideUp("slow");

  $("#message-wrapper").hover(function(){
    $( "#message" ).slideDown( 100 );
  },
  function(){
    $( "#message" ).slideUp( 500 );
  })

});
