# XtractSDK

This gem is the official library provided by Xtract to interact with our API.

You can read the API docs directly from [here](https://xtractapi.docs.apiary.io).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'xtract-sdk'
```

And then execute:

```bash
$> bundle
```

Or install it yourself as:

```bash
$> gem install xtract-sdk
```

## Usage

First you need to configure your api key obtained from the platform:

```ruby
XtractSDK.configure do |config|
  config.api_key = 'API_KEY'
end
```

Also you can pass the key when creating the client directly:

```ruby
client = XtractSDK::Client.new(api_key: 'API_KEY')
```

Then you can create a client and start making requests. We provide a convenient way to do this:

### Get invoices

```ruby
client = XtractSDK::Client.new
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
client = XtractSDK::Client.new
invoice = client.invoice(ID)

puts invoice.id
puts invoice.products
```

### Update an invoice

```ruby
client = XtractSDK::Client.new
client.update_invoice(ID, { accounted: 'completed' }) #=> :ok
```

### Errors

You can check [here](https://github.com/xtractapp/ruby-sdk/blob/master/lib/xtract_sdk/error.rb) all the error classes that the library raises.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/xtractapp/ruby-sdk.
