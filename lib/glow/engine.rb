require 'glow/filter'
require 'rails/engine'
require 'action_controller'

module Glow
  class Engine < Rails::Engine
    config.to_prepare do
      ::ActionController::Base.send :include, Glow::Filter
    end
  end
end
