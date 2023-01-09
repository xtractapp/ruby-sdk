require 'ostruct'

module XtractSDK
  module Invoices
    class Result
      include Enumerable

      BATCH_SIZE = 40

      def initialize(options, api_key, client)
        @options = options
        @api_key = api_key
        @client = client
        reset_cursors!
      end

      def each
        if block_given?
          while (element = read_from_page_or_fetch)
            yield element
          end
          reset_cursors!
        else
          to_enum(:each)
        end
      end

      private

      def reset_cursors!
        @page = 0
        @total_pages = 1
        @page_cursor = BATCH_SIZE
        @buffer = []
      end

      def read_from_page_or_fetch
        fetch_data if @page_cursor == BATCH_SIZE

        element = @buffer[@page_cursor]
        return nil unless element

        @page_cursor += 1
        element
      end

      def fetch_data
        response = make_request if @page < @total_pages
        @buffer = parse_response(response)
        @page_cursor = 0
      end

      def parse_response(response)
        return [] if response.nil?

        Error.raise_from_code!(response.code) if response.code != 200
        # TODO: use dry-rb structs instead of OpenStruct
        parsed = JSON.parse(response.body.to_s, object_class: OpenStruct) # rubocop:disable Style/OpenStructUse
        @total_pages = parsed.total_pages
        parsed.data
      end

      def make_request
        @page += 1
        @client.invoices(@api_key, @options.merge(page: @page, per_page: BATCH_SIZE))
      end
    end
  end
end
