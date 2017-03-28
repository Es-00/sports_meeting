# all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load", ->
  $('.ui.dropdown')
    .dropdown()
   $('#soccer').on "click", ->
     $('#zuqiu').submit();
   $('#basketball').on "click", ->
     $('#lanqiu').submit();
   $('#badminton').on "click", ->
     $('#yumaoqiu').submit();
   $('#pingpong').on "click", ->
     $('#pingpang').submit();
   $('#billiard').on "click", ->
     $('#taiqiu').submit();
   $('#interest').on "click", ->
     $('#quwei').submit();
  $('.baozou').on "click", ->
    $('#baozou').submit()
  $('.sanwei').on "click", ->
    $('#sanwei').submit()
  $('.qingchun').on "click", ->
    $('#qingchun').submit()
