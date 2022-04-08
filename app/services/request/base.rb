# frozen_string_literal: true

module Request
  class Base
    include HTTParty

    attr_accessor :error_message, :response, :code, :body
    attr_reader :resource

    def initialize(resource)
      @resource = resource
    end

    def post_to_url(product, url)
      unless Rails.env.production?
        Rails.logger.debug { "\r\n\r\n#{params}\r\n(is what we would have pushed)\r\n\r\n" }

        if product == "workforce"
          return "https://my.workforce.com/login"
        elsif product == "chilli"
          return "https://my.workforce.com/login"
        else
          return true
        end
      end

      self.response = call_operation(url)
      self.body = response.parsed_response
      self.code = response.code
      self.error_message = response.body
      success?(product)
    end

    def success_status_codes
      [200, 201]
    end

    def success?(product)
      if product == "workforce"
        return self.body["magic_link"] if success_status_codes.include?(code)
      elsif product == "chilli"
        return self.body["url"] if success_status_codes.include?(code)
      else
        return true if success_status_codes.include?(code)
      end

      Rails.logger.error(error_message)
      false
    end
  end
end
