# all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load", ->
  $('.ui.dropdown')
    .dropdown()
  $('#soccer').on "click", ->
    $("select[name='search[title]']").val("足球");
    $('#search_form').submit();
  $('#basketball').on "click", ->
    $("select[name='search[title]']").val("篮球");
    $('#search_form').submit();
  $('#badminton').on "click", ->
    $("select[name='search[title]']").val("羽毛球");
    $('#search_form').submit();
  $('#pingpong').on "click", ->
    $("select[name='search[title]']").val("乒乓球");
    $('#search_form').submit();
  $('#billiard').on "click", ->
    $("select[name='search[title]']").val("台球");
    $('#search_form').submit();
  $('#interest').on "click", ->
    location.href="/interest"
  if document.body.clientWidth < 650
    $(".computer-only").hide()

  $("#sport_status").on "change", ->
    if $("#sport_status").val() == "未开始"
      $(".interest_hidden,.score").hide()
    else if  $("#sport_status").val() == "已结束"
      $(".interest_hidden,.score").show()

  $("#all").on "click", ->
    $('#search_form').submit();
  $(".interest.item").on "click", ->
    $(".interest_hidden,.teamtwo,.others").remove();
    $(".status").hide()


  $('.qingchun').on "click", ->
    $("input[name='category']").val("舞动青春");
    $('#interest_form').submit();
  $('.baozou').on "click", ->
    $("input[name='category']").val("暴走大礼包");
    $('#interest_form').submit();
  $('.sanwei').on "click", ->
    $("input[name='category']").val("三维弹球");
    $('#interest_form').submit();

  $('#board_submit').on "click", ->
    $("#edit_category_4").submit();
  $(".list.layout.link.icon").on "click", ->
    $('.ui.labeled.icon.sidebar')
      .sidebar('toggle')
