#
 all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$('#soccer').click(function(){
location.href="/sports/soccer";
})
$('#basketball').click(function(){
location.href="/sports/basketball";
})
$('#badminton').click(function(){
location.href="/sports/badminton";
})
$('#pingpong').click(function(){
location.href="/sports/pingpong";
})

$('#billiard').click(function(){
location.href="/sports/billiard";
})
$('#interest').click(function(){
location.href="/sports/interest";
})

$(document).on "turbolinks:load", ->
  $('.ui.dropdown')
    .dropdown()
