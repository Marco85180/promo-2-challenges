$(document).ready(function() {
  $(document).on('keyup', function(event) {
    // Detect which key was pressed and call the appropriate function
    if (event.which == 65) {
      $('#player1_race td.active')
      .removeClass('active')
      .next('td').addClass('active')};
    if (event.which == 80) {
      $('#player2_race td.active')
      .removeClass('active')
    .next('td').addClass('active')};
  });
});