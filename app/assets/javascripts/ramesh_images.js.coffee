$ ->
  image_url_list = []
  image_time_list = []
  day = $('#dayStr').val()
  framePosition = $('#framePosition')
  playButton = $('#playButton')
  forwardButton = $('#forwardButton')
  fastForwardButton = $('#fastForwardButton')
  toStartButton = $('#toStartButton')
  toEndButton = $('#toEndButton')

  $.get '/images/list', { image_date: day }, (data) ->
    return if data.error
    image_url_list = data.image_list.map (image) -> image.url
    image_time_list = data.image_list.map (image) -> image.time

  imageCount = -> image_url_list.length

  refreshPlaybackView = (position) ->
    $('#imageAtTime').attr 'src', image_url_list[position]
    $('#positionTime').text image_time_list[position]
    $('#positionAt').text position + 1

  currentPosition = -> Number.parseInt framePosition.val()
  setPosition = (position) -> framePosition.val position

  moveToPosition = (position) ->
    setPosition position
    refreshPlaybackView position

  framePosition.change -> refreshPlaybackView currentPosition()

  play = (position, refreshRate) ->
    moveToPosition position
    nextPosition = position + 1

    if nextPosition >= imageCount()
      playButton.attr 'disabled', false
      return

    setTimeout ->
      play nextPosition, refreshRate
    , refreshRate

  playButton.click ->
    playButton.attr 'disabled', true
    play currentPosition(), 1000

  forwardButton.click ->
    playButton.attr 'disabled', true
    play currentPosition(), 500

  fastForwardButton.click ->
    playButton.attr 'disabled', true
    play currentPosition(), 250

  toStartButton.click -> moveToPosition 0
  toEndButton.click -> moveToPosition imageCount() - 1
