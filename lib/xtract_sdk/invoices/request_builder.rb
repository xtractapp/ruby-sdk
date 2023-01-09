require_relative 'result'

module XtractSDK
  module Invoices
    class RequestBuilder
      VALID_PARAMS = %i[
        client_business_name
        client_tax_id
        provider_business_name
        provider_tax_id
        date_from
        date_to
        expiration_date_from
        expiration_date_to
        number
        electronic_authorization_id
        created_at_from
        created_at_to
        accounted
        imputed
      ].freeze

      def initialize(api_key, options = {})
        @api_key = api_key
        @options = options
      end

      VALID_PARAMS.each do |param|
        define_method param do |value = nil|
          return @options[param] if value.nil?

          @options[param] = value
          self
        end
      end

      def with_market_rate(from = nil, to = nil)
        return @options[:with_market_rate] if from.nil? && to.nil?

        @options[:with_market_rate] = "#{from}-#{to}"
        self
      end

      def call
        XtractSDK::Invoices::Result.new(@options, @api_key, HTTPClient)
      end
    end
  end
end
