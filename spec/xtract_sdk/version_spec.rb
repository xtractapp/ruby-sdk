describe XtractSDK do
  let(:version) { described_class::VERSION }

  it 'is the correct version' do
    expect(version).to eq('0.0.3')
  end
end
