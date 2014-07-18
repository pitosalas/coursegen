function handle_helpful_link(yesno) {
  $.ajax({
    url: "http://0.0.0.0:3001/api/helpful/vote/",
    data: {url: "myuxyrl", value: yesno},
    dataType: "jsonp",
    success: function(data) { display_visit_stats(data); }}
)};

function display_visit_stats(response) {
  yes_votes = response.true;
  no_votes = response.false;
  if (yes_votes > 0 || no_votes > 0) {
    $("#helpful").html("Helpful votes so far: Yes: " + response.true + " No: " + response.false );
  }
}

$("#yes-link").click( function() { handle_helpful_link("yes");});
$("#no-link").click( function() { handle_helpful_link("no");});

function record_visit() {
  $.ajax({
    url: "http://0.0.0.0:3001/api/helpful/visiting/",
    data: {url: "myuxyrl"},
    dataType: "jsonp",
    success: function(data) { display_visit_stats(data) }}
)};

$(function() {
  record_visit();
});
