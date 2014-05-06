/*
  *
  * TODO: add your code here!
  *
*/

$(document).ready(function() {
  $("#message").hide().delay(500).slideDown("slow");
});


$("#message-wrapper").click(function(event) {
  event.preventDefault();
  $("#message").slideUp("slow");
  $("#message-wrapper").hover(function(){
    $("#message").stop(true, false).slideDown(100);
    },
  function(){
  $("#message").stop(true, false).slideUp(500);
  })
});
