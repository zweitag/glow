require 'glow/filter'
require 'rails/railtie'
require 'action_controller'

module Glow
  class Railtie < Rails::Railtie
    initializer 'glow' do
      ActiveSupport.on_load :action_controller do
        include Glow::Filter
      end
    end
  end
end
