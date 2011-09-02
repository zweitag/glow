(function() {
  window.Glow = {
    flash: function(type, message) {
      return $(document).trigger('glow:flash', {
        type: type,
        message: message
      });
    }
  };
  $(document).ajaxComplete(function(evt, xhr, options) {
    var message, type;
    if (type = xhr.getResponseHeader('X-Message-Type') && (message = xhr.getResponseHeader('X-Message'))) {
      return Glow.flash(type, message);
    }
  });
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
