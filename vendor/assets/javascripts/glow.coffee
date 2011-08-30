$(document).ajaxComplete (evt, xhr, options) ->
  $('body').append(xhr.getResponseHeader('X-Message'))
  $(document).trigger 'glow:flash', type: xhr.getResponseHeader('X-Message-Type'), message: xhr.getResponseHeader('X-Message')

window.Glow =
  flash: (type, message) -> $(document).trigger 'glow:flash', { type, message }

window.Flash =
  fire: Glow.flash
  # convenience methods
  success: (message) -> Glow.flash 'success', message
  notice: (message) -> Glow.flash 'notice', message
  error: (message) -> Glow.flash 'error', message
