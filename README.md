# Glow

Glowing flashes! Okay... not really. This simply adds handling of the
Flash Hash in Javascript. Depends on jQuery.

## Usage

Any flash messages set in ajax responses fire a `glow:flash`
event on `document`.

```ruby
flash[:notice] = 'Ajax man!'
respond_to do |format|
  format.js { head :ok }
end
```

Handle it any way you want:

```javascript
$(document).bind('glow:flash', function(evt, flash) {
  alert(flash.type);
  alert(flash.message);
});
```

Also adds a `Flash` object that enables you to fire `glow:flash`.

    Flash.success('Yeah this worked!');
    Flash.error('Something went wrong!');
    Flash.notice('This is a flash message');

    Flash.fire('type', 'message');

This can be used to unify your Flash message handling (also in non-xhr
responses).

    <% flash.each do |type, message| %>
      <%= javascript_tag "Flash.fire('#{type}', '#{message}')" %>
    <% end %>

If you want to skip the glow after_filter just set `flash[:skip_glow]`.


You can also use glow with APIs by using `headerize_flash_for` and passing
in the request formats you want the flash messages passed back.

``` ruby
class API::Base < ActionController::Base
  headerize_flash_for :json
end
```

Controllers inheriting from a controller using `headerize_format_for` will
inherit the capability or it can be overridden.

``` ruby
class API::JSON < API::Base
  # will headerize flash for JSON requests
end

class API::XML < API::Base
  headerize_flash_for :xml
  # will NOT headerize flash for JSON requests
  # but will headerize flash for XML requests
end
```



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

### Rails >=3.1 (including Rails 4)

Add

    //=require glow

to your manifest.

## License

See MIT-LICENSE.
