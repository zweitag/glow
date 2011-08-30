module Glow
  if ::Rails.version < "3.1"
    require 'glow/railtie'
  else
    require 'glow/engine'
  end
  require 'glow/version'
end
