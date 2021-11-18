require_relative 'invoices/request_builder'

module XpensifySDK
  class Client
    def initialize(api_key: nil)
      @api_key = api_key || XpensifySDK.config[:api_key]
    end

    def invoices(params = {})
      XpensifySDK::Invoices::RequestBuilder.new(@api_key, params)
    end

    def invoice(id)
      response = HTTPClient.invoice(id, @api_key)
      Error.raise_from_code!(response.code) if response.code != 200
      # TODO: use dry-rb structs instead of OpenStruct
      JSON.parse(response.body.to_s, object_class: OpenStruct) # rubocop:disable Style/OpenStructUse
    end

    def update_invoice(id, options)
      response = HTTPClient.update_invoice(id, options, @api_key)
      Error.raise_from_code!(response.code) if response.code != 200
      :ok
    end
  end
end
