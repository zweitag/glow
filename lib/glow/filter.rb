require 'active_support/concern'

module Glow
  module Filter
    extend ActiveSupport::Concern
    included do
      after_filter :flash_to_headers
    end
    module InstanceMethods
      def flash_to_headers
        return unless request.xhr? && flash.present? # respects Ajax requests only
        response.headers['X-Message'] = flash_message.unpack('U*').map{ |i| "&##{i};" }.join
        response.headers['X-Message-Type'] = flash_type
        flash.discard  # don't want the flash to appear when you reload page
      end
    end
  end
end
