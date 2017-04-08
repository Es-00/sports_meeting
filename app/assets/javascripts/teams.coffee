# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "turbolinks:load", ->
  $('#groups,#advance,#final').on "click", ->
    $("#groups,#advance,#final").removeClass("active")
    $(this).addClass("active")
    $("input[name='compete']").val($(this).attr("id"))
    $("#compete_form").submit()
