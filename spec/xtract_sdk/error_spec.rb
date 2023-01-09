describe XtractSDK::Error do
  describe '.raise_from_code!' do
    subject(:result) { described_class.raise_from_code!(code) }

    context 'with code 404' do
      let(:code) { 404 }

      it 'throws an error' do
        expect { result }.to raise_error(XtractSDK::Error::NotFound)
      end
    end

    context 'with other code' do
      let(:code) { 500 }

      it 'throws an error' do
        expect { result }.to raise_error('Response code 500 from API')
      end
    end
  end
end
