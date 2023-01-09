require 'xtract_sdk/error'
require 'xtract_sdk/client'
require 'xtract_sdk/http_client'
require 'xtract_sdk/version'

module XtractSDK
  @config = {
    api_key: nil
  }

  def self.configure
    yield self
  end

  def self.api_key=(api_key)
    @config[:api_key] = api_key
  end

  def self.config
    @config
  end
end
