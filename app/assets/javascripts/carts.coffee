$(document).ready ->
$("#add_to_cart").on("ajax:success", (e, data, status, xhr) ->
    $("#new_article").append xhr.responseText
    ).on "ajax:error", (e, xhr, status, error) ->
$("#new_article").append "<p>ERROR</p>"
