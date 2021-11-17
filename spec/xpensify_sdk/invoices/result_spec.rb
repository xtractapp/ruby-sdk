describe XpensifySDK::Invoices::Result do
  subject(:result) { described_class.new(options, api_key, client) }

  let(:options) { {} }
  let(:api_key) { 'test' }
  let(:client) { MockHTTPClient.new(3, 200) }

  describe '.each' do
    it 'returns all the elements' do
      ids = []
      result.each { |invoice| ids << invoice.id }
      expect(ids).to eq((0..119).to_a)
    end
  end
end
