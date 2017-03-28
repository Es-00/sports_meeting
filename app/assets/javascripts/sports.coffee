# all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load", ->
  $('.ui.dropdown')
    .dropdown()
  $('#soccer').on "click", ->
    location.href="/soccer"
  $('#basketball').on "click", ->
    location.href="/basketball"
  $('#badminton').on "click", ->
    location.href="/badminton"
  $('#pingpong').on "click", ->
    location.href="/pingpong"
  $('#billiard').on "click", ->
    location.href="/billiard"
  $('#interest').on "click", ->
    location.href="/interest"
  $('.baozou').on "click", ->
    $('#baozou').submit()
  $('.sanwei').on "click", ->
    $('#sanwei').submit()
  $('.qingchun').on "click", ->
    $('#qingchun').submit()
