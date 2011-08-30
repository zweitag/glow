require 'rails'

module Glow
  module Generators
    class InstallGenerator < ::Rails::Generators::Base

      desc "This generator installs glow.js. You must inclu"
      class_option :ui, :type => :boolean, :default => false, :desc => "Include jQueryUI"
      source_root File.expand_path('../../../../../vendor/assets/javascripts', __FILE__)

      def copy_glow
        say_status("copying", "glow", :green)
        copy_file "glow.js", "public/javascripts/glow.js"
        say("Please include glow.js in your layout")
      end

    end
  end
end if ::Rails.version < "3.1"
