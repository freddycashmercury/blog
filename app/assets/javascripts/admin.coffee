# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
#
#
$(document).on "change", "select, input[type=checkbox]", (e) ->
  $(this).parents("tr").children("form").submit()
