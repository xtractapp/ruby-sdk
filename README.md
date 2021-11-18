# XpensifySDK

This gem is the official library provided by Xpensify to interact with our API.

You can read the API docs directly from [here](https://xpensifyapi.docs.apiary.io).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'xpensify_sdk'
```

And then execute:

```bash
$> bundle
```

Or install it yourself as:

```bash
$> gem install xpensify_sdk
```

## Usage

First you need to configure your api key obtained from the platform:

```ruby
XpensifySDK.configure do |config|
  config.api_key = 'API_KEY'
end
```

Also you can pass the key when creating the client directly:

```ruby
client = XpensifySDK::Client.new(api_key: 'API_KEY')
```

Then you can create a client and start making requests. We provide a convenient way to do this:

### Get invoices

```ruby
client = XpensifySDK::Client.new
invoices = client
    .invoices
    .client_tax_id('SOME_TAX_ID')
    .call

invoices.each do |invoice|
  puts invoice.id
  puts invoice.products
end
```

These are all the filtering options:

```ruby
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
accounted ('pending', 'in_progress', 'completed', 'with_errors')
imputed (true, false)
```

### Get an invoice

```ruby
client = XpensifySDK::Client.new
invoice = client.invoice(ID)

puts invoice.id
puts invoice.products
```

### Errors

You can check [here](https://github.com/Xpensify/ruby-sdk/blob/master/lib/xpensify_sdk/error.rb) all the error classes that the library raises.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Xpensify/ruby-sdk.
