(function() {
  $(document).ajaxComplete(function(evt, xhr, options) {
    $('body').append(xhr.getResponseHeader('X-Message'));
    return $(document).trigger('glow:flash', {
      type: xhr.getResponseHeader('X-Message-Type'),
      message: xhr.getResponseHeader('X-Message')
    });
  });
  window.Glow = {
    flash: function(type, message) {
      return $(document).trigger('glow:flash', {
        type: type,
        message: message
      });
    }
  };
  window.Flash = {
    fire: Glow.flash,
    success: function(message) {
      return Glow.flash('success', message);
    },
    notice: function(message) {
      return Glow.flash('notice', message);
    },
    error: function(message) {
      return Glow.flash('error', message);
    }
  };
}).call(this);
