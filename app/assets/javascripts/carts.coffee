$(window).load ->
  $('#mycart .fi-x').click (e) ->
  e.preventDefault()
  $this = $(this).closest('a')
  url = $this.data('targeturl')
  $.ajax url: url, type: 'put', success: (data) ->
   $('.cart-count').html(data)
   $this.closest('.cart-row').slideUp()



$(document).ready ->
$("#add_to_cart").on("ajax:success", (e, data, status, xhr) ->
    $(".cart_button").append xhr.responseText
    ).on "ajax:error", (e, xhr, status, error) ->
$(".cart_button").append "<p>ERROR</p>"
