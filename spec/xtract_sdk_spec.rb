describe XtractSDK do
  describe '.configure' do
    let(:api_key) { 'test' }

    before do
      described_class.configure { |config| config.api_key = api_key }
    end

    it 'sets the api_key correctly' do
      expect(described_class.config[:api_key]).to eq(api_key)
    end
  end
end
