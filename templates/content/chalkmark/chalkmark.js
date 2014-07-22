function handle_helpful_link(yesno) {
  $.ajax({
    url: "http://chalkmark.herokuapp.com/api/helpful/vote/",
    data: {url: document.title, value: yesno},
    dataType: "jsonp",
    success: function(data) { display_visit_stats(data); }}
)};

function display_visit_stats(response) {
  yes_votes = response.true;
  no_votes = response.false;
  if (yes_votes > 0 || no_votes > 0) {
    $("#helpful").addClass("text-center").html("<small>votes so far: Yes: " + response.true + " No: " + response.false  + "</small>");
  }
}

$("#yes-link").click( function() { handle_helpful_link("yes");});
$("#no-link").click( function() { handle_helpful_link("no");});

function record_visit() {
  $.ajax({
    url: "http://chalkmark.herokuapp.com/api/helpful/visiting/",
    data: {url: document.title},
    dataType: "jsonp",
    success: function(data) { display_visit_stats(data) }}
)};

$(function() {
  record_visit();
});
