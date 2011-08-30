require 'active_support/concern'

module Glow
  module Filter
    extend ActiveSupport::Concern
    included do
      after_filter :flash_to_headers
    end
    module InstanceMethods
      def flash_to_headers
        return unless flash.any? && request.xhr?
        type, message = flash.first
        response.headers['X-Message'] = message.to_s.unpack('U*').map{ |i| "&##{i};" }.join
        response.headers['X-Message-Type'] = type.to_s
        flash.discard  # don't want the flash to appear when you reload page
      end
    end
  end
end
