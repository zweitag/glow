# Glow

Glowing flashes! Okay... not really. This simply adds handling of the
Fash Hash in Javascript. Depends on jQuery.

## Usage

Any flash messages set in ajax responses fire a `glow:flash`
event on `document`.

    flash[:notice] = 'Ajax man!'
    respond_to do |format|
      format.js { head :ok }
    end

Handle it any way you want:

    $(document).bind('glow:flash', function(evt, flash) {
      alert(flash.type);
      alert(flash.message);
    }

Also adds a `Flash` object that enables you to fire `glow:flash`.

    Flash.success('Yeah this worked!');
    Flash.error('Something went wrong!');
    Flash.notice('This is a flash message');

    Flash.fire('type', 'message');

This can be used to unify your Flash message handling (also in non-xhr
responses).

  <% flash.each |type, message| %>
    <%= javascript_tag "Flash.fire('#{type}', '#{message}')" %>
  <% end %>

## Installation

In your gemfile add

    gem "glow"

.

### Rails 3.0

Run

    rails generate glow:install

Then add

    javascipt_include_tag 'glow'

to your layout.

### Rails 3.1

TODO

## License

See MIT-LICENSE.

## TODO

- Test in 3.1
- Automatically add //= require glow to application.js in 3.1 (via
  generator)
