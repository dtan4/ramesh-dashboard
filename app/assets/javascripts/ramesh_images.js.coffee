$ ->
  image_url_list = []
  image_time_list = []
  day = $('#dayStr').val()
  framePosition = $('#framePosition')

  $.get '/images/list', { image_date: day }, (data) ->
    return if data.error
    image_url_list = data.image_list.map (image) -> image.url
    image_time_list = data.image_list.map (image) -> image.time

  framePosition.change ->
    position = Number.parseInt framePosition.val()
    $('#imageAtTime').attr 'src', image_url_list[position]
    $('#positionTime').text image_time_list[position]
    $('#positionAt').text position + 1
