require 'xpensify_sdk/error'
require 'xpensify_sdk/client'
require 'xpensify_sdk/http_client'
require 'xpensify_sdk/version'

module XpensifySDK
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
