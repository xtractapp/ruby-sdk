class MockHTTPClient
  HTTPResponseMock = Struct.new(:code, :body)

  def initialize(total_pages, code)
    @total_pages = total_pages
    @status_code = code
  end

  def invoices(_api_key, options) # rubocop:disable Metrics/MethodLength
    page = options[:page]
    per_page = options[:per_page]

    range_start = (page - 1) * per_page
    range_end = page * per_page

    body = {
      data: (range_start..range_end).map { |n| { id: n } },
      page: page,
      per_page: per_page,
      total_pages: @total_pages
    }.to_json

    HTTPResponseMock.new(@status_code, body)
  end
end
