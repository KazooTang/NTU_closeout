# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('.scrollable').bind 'mousewheel DOMMouseScroll', (e) ->
    e0 = e.originalEvent
    delta = e0.wheelDelta or -e0.detail
    console.log 'meow'
    @scrollTop -= delta
    e.preventDefault()
