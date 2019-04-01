# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  $('body').on 'click', '.export-btn', (e) ->
    uuid = generateUUID()

    # Disable Export btn
    $('.export-btn').html("Exporting...")
    $('.export-btn').addClass('disabled');

    # Append UUID to the URL
    URL = decodeURI(e.target.href + '?export_id=' + uuid;)

    # Subscribe to the channel
    window.ExportChannel.Subscribe(uuid, ->
      $.get encodeURI(URL)
      return
    )

# https://www.w3resource.com/javascript-exercises/javascript-math-exercise-23.php
generateUUID = ->
  d = new Date().getTime()
  'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace /[xy]/g, (c) ->
    r = (d + Math.random() * 16) % 16 | 0
    d = Math.floor(d / 16)
    (if c is 'x' then r else r & 0x3 | 0x8).toString 16
