require 'glow/filter'
require 'rails/railtie'
require 'action_controller'

module Glow
  class Railtie < Rails::Railtie
    config.to_prepare do
      ::ActionController::Base.send :include, Glow::Filter
    end
  end
end
