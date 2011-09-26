require 'glow/filter'
require 'rails/engine'
require 'action_controller'

module Glow
  class Engine < Rails::Engine
    initializer 'glow' do
      ActiveSupport.on_load :action_controller do
        include Glow::Filter
      end
    end
  end
end
