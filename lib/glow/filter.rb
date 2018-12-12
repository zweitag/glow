require 'active_support/concern'

module Glow
  module Filter
    extend ActiveSupport::Concern
    included do
      after_action    :flash_to_headers
      class_attribute :glow_request_formats
    end

    def flash_to_headers
      return unless flash.any? && flash_to_headers?
      return if flash[:skip_glow] and flash.delete(:skip_glow)

      type, message = flash.first
      # Use URI-Encoding to make sure header value is ASCII-only and
      # we can easily decode this using decodeURI in JavaScript.
      response.headers['X-Message'] = URI.encode(message.to_s)
        response.headers['X-Message-Type'] = type.to_s
      flash.discard  # don't want the flash to appear when you reload page
    end

    def flash_to_headers?
      request.xhr? ||
      glow_request_formats? && glow_request_formats.include?(request.format.to_sym)
    end


    module ClassMethods
      def headerize_flash_for *formats
        self.glow_request_formats = formats
      end
    end

  end
end
