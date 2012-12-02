window.Glow =
  flash: (type, message) -> $(document).trigger 'glow:flash', { type, message }

$(document).ajaxComplete (evt, xhr, options) ->
  type = xhr.getResponseHeader('X-Message-Type')
  message = xhr.getResponseHeader('X-Message')
  Glow.flash type, $('<div/>').html(message).text() if type and message

window.Flash =
  fire: Glow.flash
  # convenience methods
  success: (message) -> Glow.flash 'success', message
  notice: (message) -> Glow.flash 'notice', message
  error: (message) -> Glow.flash 'error', message
