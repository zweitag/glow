window.Glow =
  flash: (type, message) -> $(document).trigger 'glow:flash', { type, message }

$(document).ajaxComplete (evt, xhr, options) ->
  Glow.flash type, message if type = xhr.getResponseHeader('X-Message-Type') and message = xhr.getResponseHeader('X-Message')

window.Flash =
  fire: Glow.flash
  # convenience methods
  success: (message) -> Glow.flash 'success', message
  notice: (message) -> Glow.flash 'notice', message
  error: (message) -> Glow.flash 'error', message
