$ ->
  image_url_list = []
  day = $('#dayStr').val()
  framePosition = $('#framePosition')

  $.get '/images/list', { image_date: day }, (data) ->
    return if data.error
    image_url_list = data.image_url_list

  framePosition.change ->
    $('#imageAtTime').attr 'src', image_url_list[Number.parseInt framePosition.val()]
