var GRID_SIZE = 30;
var PLAYER1_KEY = 68; // D
var PLAYER2_KEY = 76; // L

var startTime = null;
var sessionId = null;

$(function() {

  generate_grid(GRID_SIZE);
  give_player_hints(PLAYER1_KEY, PLAYER2_KEY);

  $('.game').hide();
  $('.form-inline').hide();
  open_new_session('#player1', '#player2', '#race_start');


  $(document).on('keyup', function(event) {
      // d = 68
      // l = 76
      if (event.which == PLAYER1_KEY) {
        update_player_position("player1", 1);
      }
      if (event.which == PLAYER2_KEY) {
        update_player_position("player2", 1);
      }
    });
});

function open_new_session(player1Id, player2Id, buttonId) {

  var dataString = JSON.stringify({
    players: [
    { name: $(player1Id).val() },
    { name: $(player2Id).val() }
    ]
  });

  $.get( "http://wagon-race-api.herokuapp.com/game/session/new", function(data) {
   console.log("Page chargée !");
   sessionId = data['session_id'];
   console.log(sessionId)
   $('.form-inline').show();

    $(buttonId).on('click', function (e) {
      $.ajax({
        type: "POST",
        url : 'http://wagon-race-api.herokuapp.com/game/session/' + sessionId + '/new',
        data: dataString,
        contentType: 'application/json',
        success: function(data) {
        startTime = new Date();
        console.log("les joueurs ont bien été authentifiés !");
        $('.game').show();
        $('.form-inline').hide();
        }
      });
    });
  });
};

function update_player_position(player, number) {
  var cases  = $('#' + player + '_race td'),
  length = cases.length,
  previous_position = cases.siblings('.active').index();

  cases.removeClass('active');
  cases.eq(previous_position + number).addClass('active');

  console.log(previous_position + number, length);
  if ((previous_position + number) >= length) {
    var endTime = new Date();
    var time = endTime - startTime;
    postWinner(player, time);
    alert(player + ' has won !');
    reset();
  }
}

function postWinner(player, time) {

  var dataString = JSON.stringify({
    winner: player == "player1" ? 1 : 2,
    elapsed_time: "" + time
  });

  console.log(dataString);

  $.ajax({
    type: "POST",
    url: 'http://wagon-race-api.herokuapp.com/game/' + sessionId + '/results',
    data: dataString,
    contentType: 'application/json',
    success: function(data) {
      console.log('results successfully sent to server!');
    }
  });
}

function generate_grid(size) {
  for (var i = 0; i < size - 1; i++) {
    $('#player1_race').append('<td></td>').addClass("game");
    $('#player2_race').append('<td></td>').addClass("game");
  }
}

function give_player_hints(player1_key, player2_key) {
  $('#player1_hint').html('Player 1: Hit <strong>' + String.fromCharCode(player1_key) + '</strong>').addClass("game");
  $('#player2_hint').html('Player 2: Hit <strong>' + String.fromCharCode(player2_key) + '</strong>').addClass("game");
}

function reset() {
  $('.racer_table td').removeClass('active');
  $('#player1_race td:first-child').addClass('active');
  $('#player2_race td:first-child').addClass('active');
}
