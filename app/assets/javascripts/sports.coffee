# all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load", ->
  $('.ui.dropdown')
    .dropdown()
  $('#soccer').on "click", ->
    $("select[name='title']").val("足球");
    $('#search_form').submit();
  $('#basketball').on "click", ->
    $("select[name='title']").val("篮球");
    $('#search_form').submit();
  $('#badminton').on "click", ->
    $("select[name='title']").val("羽毛球");
    $('#search_form').submit();
  $('#pingpong').on "click", ->
    $("select[name='title']").val("乒乓球");
    $('#search_form').submit();
  $('#billiard').on "click", ->
    $("select[name='title']").val("台球");
    $('#search_form').submit();
  $('#interest').on "click", ->
    location.href="/interest"

  $("#all").on "click", ->
    $('#search_form').submit();
  $(".interest.item").on "click", ->
    $(".interest_hidden,.teamtwo,.others,.status").hide();
  $(".non-interest.item").on "click", ->
    $(".interest_hidden,.teamtwo,.others,.status").show();


  $('.qingchun').on "click", ->
    $("input[name='category']").val("舞动青春");
    $('#interest_form').submit();
  $('.baozou').on "click", ->
    $("input[name='category']").val("暴走大礼包");
    $('#interest_form').submit();
  $('.sanwei').on "click", ->
    $("input[name='category']").val("三维弹球");
    $('#interest_form').submit();
