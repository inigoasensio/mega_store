$ ->
  braintree.setup("<%= @client_token %>", 'dropin', { container: 'payment-form' })
