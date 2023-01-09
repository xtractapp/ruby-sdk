require 'http'

module XtractSDK
  class HTTPClient
    API_URL = 'https://api.xtract.app/api/v1'.freeze

    class << self
      def invoices(api_key, params)
        HTTP.get(
          "#{API_URL}/invoices",
          params: params,
          headers: build_headers(api_key)
        )
      end

      def invoice(id, api_key)
        HTTP.get(
          "#{API_URL}/invoices/#{id}",
          headers: build_headers(api_key)
        )
      end

      def update_invoice(id, params, api_key)
        HTTP.put(
          "#{API_URL}/invoices/#{id}",
          body: params.to_json,
          headers: build_headers(api_key)
        )
      end

      private

      def build_headers(api_key)
        { 'Authorization' => api_key, 'Content-type' => 'application/json' }
      end
    end
  end
end
