# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


#$(document).ready ->
#	max_length = 140

#	$('#micropost_content').keyup ->
#		box = $(this).val()
#		main = box.length * 100
#		value = main / max_length
#		characters_left = max_length - (box.length)
#		$('#count').html 'characters left: ' + characters_left
#		if box.length <= max_length
#			$('#bar').animate { 'width': value + '%' }, 1
#			$('#bar').css 'background-color', '#5fbbde'
#		else
#			$('#bar').css 'background-color', 'red'
#			$('#bar').css 'width', '100%'
#   false

#return



$(document).on 'page:change', ->
	max_length = 140

	$('#micropost_content').keyup ->
		box = $(this).val()
		main = box.length * 100
		value = main / max_length
		characters_left = max_length - (box.length)
		$('#count').html 'characters left: ' + characters_left
		if box.length <= max_length
			$('#bar').animate { 'width': value + '%' }, 1
			$('#bar').css 'background-color', '#5fbbde'
		else
			$('#bar').css 'background-color', 'red'
			$('#bar').css 'width', '100%'
   false

return