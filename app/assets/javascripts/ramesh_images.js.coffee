$ ->
  image_url_list = []
  image_time_list = []
  day = $('#dayStr').val()
  framePosition = $('#framePosition')
  playButton = $('#playButton')

  $.get '/images/list', { image_date: day }, (data) ->
    return if data.error
    image_url_list = data.image_list.map (image) -> image.url
    image_time_list = data.image_list.map (image) -> image.time

  currentPosition = -> Number.parseInt framePosition.val()

  refreshPlaybackView = (position) ->
    $('#imageAtTime').attr 'src', image_url_list[position]
    $('#positionTime').text image_time_list[position]
    $('#positionAt').text position + 1

  framePosition.change -> refreshPlaybackView currentPosition()

  play = (position, refreshRate) ->
    framePosition.val position
    refreshPlaybackView position
    nextPosition = position + 1

    if nextPosition >= image_url_list.length
      playButton.attr 'disabled', false
      return

    setTimeout ->
      play nextPosition, refreshRate
    , refreshRate

  playButton.click ->
    playButton.attr 'disabled', true
    play currentPosition(), 1000
