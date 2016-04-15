$ ->
  $('#cart .fi-x').click (e) ->
    e.preventDefault()
    $this = $(this).closest('a')
    url = $this.data('url')
    $.ajax url: url, type: 'DELETE', success: (data) ->
      $('.cart-count').html(data.cart_count)
      $('.cart-total').html(data.cart_total)
      $this.closest('.cart-row').slideUp()

$ ->
  $('form[data-remote]').on 'ajax:success', (e, data) ->
    e.preventDefault()
    $('.cart-count').html(data)
    # $('.flash-msg').html(data)

