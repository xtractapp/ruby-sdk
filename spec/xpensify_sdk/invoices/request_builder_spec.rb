describe XpensifySDK::Invoices::RequestBuilder do
  subject(:builder) { described_class.new(nil, params) }

  let(:params) { {} }

  context 'when params is not empty' do
    let(:params) do
      {
        client_business_name: 'client_business_name',
        client_tax_id: 'client_tax_id',
        provider_business_name: 'provider_business_name',
        provider_tax_id: 'provider_tax_id',
        date_from: 'date_from',
        date_to: 'date_to',
        expiration_date_from: 'expiration_date_from',
        expiration_date_to: 'expiration_date_to',
        number: 'number',
        electronic_authorization_id: 'electronic_authorization_id',
        created_at_from: 'created_at_from',
        created_at_to: 'created_at_to',
        accounted: 'accounted',
        imputed: 'imputed'
      }
    end

    it 'sets the correct client_business_name value from params' do
      expect(builder.client_business_name).to eq('client_business_name')
    end

    it 'sets the correct client_tax_id value from params' do
      expect(builder.client_tax_id).to eq('client_tax_id')
    end

    it 'sets the correct provider_business_name value from params' do
      expect(builder.provider_business_name).to eq('provider_business_name')
    end

    it 'sets the correct provider_tax_id value from params' do
      expect(builder.provider_tax_id).to eq('provider_tax_id')
    end

    it 'sets the correct date_from value from params' do
      expect(builder.date_from).to eq('date_from')
    end

    it 'sets the correct date_to value from params' do
      expect(builder.date_to).to eq('date_to')
    end

    it 'sets the correct expiration_date_from value from params' do
      expect(builder.expiration_date_from).to eq('expiration_date_from')
    end

    it 'sets the correct expiration_date_to value from params' do
      expect(builder.expiration_date_to).to eq('expiration_date_to')
    end

    it 'sets the correct number value from params' do
      expect(builder.number).to eq('number')
    end

    it 'sets the correct electronic_authorization_id value from params' do
      expect(builder.electronic_authorization_id).to eq('electronic_authorization_id')
    end

    it 'sets the correct created_at_from value from params' do
      expect(builder.created_at_from).to eq('created_at_from')
    end

    it 'sets the correct created_at_to value from params' do
      expect(builder.created_at_to).to eq('created_at_to')
    end

    it 'sets the correct accounted value from params' do
      expect(builder.accounted).to eq('accounted')
    end

    it 'sets the correct imputed value from params' do
      expect(builder.imputed).to eq('imputed')
    end
  end

  describe '.client_business_name' do
    it 'sets the correct client_business_name value from params' do
      builder.client_business_name('client_business_name')
      expect(builder.client_business_name).to eq('client_business_name')
    end
  end

  describe '.client_tax_id' do
    it 'sets the correct client_tax_id value from params' do
      builder.client_tax_id('client_tax_id')
      expect(builder.client_tax_id).to eq('client_tax_id')
    end
  end

  describe '.provider_business_name' do
    it 'sets the correct provider_business_name value from params' do
      builder.provider_business_name('provider_business_name')
      expect(builder.provider_business_name).to eq('provider_business_name')
    end
  end

  describe '.provider_tax_id' do
    it 'sets the correct provider_tax_id value from params' do
      builder.provider_tax_id('provider_tax_id')
      expect(builder.provider_tax_id).to eq('provider_tax_id')
    end
  end

  describe '.date_from' do
    it 'sets the correct date_from value from params' do
      builder.date_from('date_from')
      expect(builder.date_from).to eq('date_from')
    end
  end

  describe '.date_to' do
    it 'sets the correct date_to value from params' do
      builder.date_to('date_to')
      expect(builder.date_to).to eq('date_to')
    end
  end

  describe '.expiration_date_from' do
    it 'sets the correct expiration_date_from value from params' do
      builder.expiration_date_from('expiration_date_from')
      expect(builder.expiration_date_from).to eq('expiration_date_from')
    end
  end

  describe '.expiration_date_to' do
    it 'sets the correct expiration_date_to value from params' do
      builder.expiration_date_to('expiration_date_to')
      expect(builder.expiration_date_to).to eq('expiration_date_to')
    end
  end

  describe '.number' do
    it 'sets the correct number value from params' do
      builder.number('number')
      expect(builder.number).to eq('number')
    end
  end

  describe '.electronic_authorization_id' do
    it 'sets the correct electronic_authorization_id value from params' do
      builder.electronic_authorization_id('electronic_authorization_id')
      expect(builder.electronic_authorization_id).to eq('electronic_authorization_id')
    end
  end

  describe '.created_at_from' do
    it 'sets the correct created_at_from value from params' do
      builder.created_at_from('created_at_from')
      expect(builder.created_at_from).to eq('created_at_from')
    end
  end

  describe '.created_at_to' do
    it 'sets the correct created_at_to value from params' do
      builder.created_at_to('created_at_to')
      expect(builder.created_at_to).to eq('created_at_to')
    end
  end

  describe '.accounted' do
    it 'sets the correct accounted value from params' do
      builder.accounted('accounted')
      expect(builder.accounted).to eq('accounted')
    end
  end

  describe '.imputed' do
    it 'sets the correct imputed value from params' do
      builder.imputed('imputed')
      expect(builder.imputed).to eq('imputed')
    end
  end

  describe '.with_market_rate' do
    it 'sets the correct imputed value from params' do
      builder.with_market_rate('usd', 'uyu')
      expect(builder.with_market_rate).to eq('usd-uyu')
    end
  end

  describe '.call' do
    it 'returns an instance of Result' do
      expect(builder.call.class).to eq(XpensifySDK::Invoices::Result)
    end
  end
end
