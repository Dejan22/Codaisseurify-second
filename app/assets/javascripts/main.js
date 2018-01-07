function createSong(name) {
  var newSong = { name: name
  var pathname = window.location.pathname + "/songs.json";
  };

  $.ajax({
    type: "POST",
    url: pathname,
    data: JSON.stringify({
      song: newSong,
    }),
    contentType: "application/json",
    dataType: "json"
  })
  .done(function(data) {

    var songId = data.id;

    var songTitle = $('<td></td>')
      .html(title);

    var deleteButton = $('<a class="btn btn-danger glyphicon glyphicon-trash song-delete"></a>')
    .attr('id', "song-" + songId)

    var deleteSong = $('<td style="text-align: right;"></td>')
    .append(deleteButton)

    var tableRow = $('<tr></td>')
      .attr('data-id', songId)
      .append(songTitle).append(deleteSong);

    $("#artistSongs").append( tableRow );

    bindClick(songId)
  })

  .fail(function(error) {
    error_message = error.responseJSON.name[0];
    showError(error_message);
  });
}

function showError(message) {
    var errorElement = $('<span class= "help-blocg"></span>')
    .attr("id", "error_message")
    .addClass("error")
    .html(message);

    $("#formgroup-song")
      .addClass("has-error")
      .append(errorHelpBlock);
}

function deleteSong(songId) {
  var artistShowId = $('#artist-id');
  var artistId = artistShowId.data('id');

  $.ajax({
    type: "DELETE",
    url: "/artists/" + artistId + "/songs/" + songId + ".json",
    contentType: "application/json",
    dataType: "json"})

}

function submitDelete(event) {
  event.preventDefault();
  songId = $(this).parent().data('id')
  $(this).parent().remove()
  deleteSong(songId);
}

function deleteAllSongs(event) {
  event.preventDefault();
  $.each($(".song-id"), function(index, song) {
    $song = $(song);
    songId = $(song).data('id');
    $song.remove();
    deleteSong(songId);
  });
}

function submitSong(event) {
  event.preventDefault();
  var title = $("#new-song").val();
  createSong(title);
  $("#new-song").val(null);
}

function resetErrors() {
  $("#error_message").remove();
  $("#formgroup-song").removeClass("has-error");
}

$(document).ready(function() {
  $("form").bind('submit', submitSong);
  $(".destroy-song").on('click', submitDelete);
  $(".delete-all").on('click', deleteAllSongs);
});
