lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'xtract_sdk/version'
require 'date'

Gem::Specification.new do |spec|
  spec.name          = 'xtract-sdk'
  spec.version       = XtractSDK::VERSION
  spec.authors       = ['Alejandro Bezdjian']
  spec.email         = ['alejandro.bezdjian@klarna.com']
  spec.summary       = "SDK to connect with Xtract's API"
  spec.description   = "SDK to connect with Xtract's API"
  spec.homepage      = 'https://github.com/xtractapp/ruby-sdk'
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec)/}) }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec)/})
  spec.require_paths = ['lib']
  spec.license       = 'MIT'

  spec.add_dependency 'http', '~> 5.0'

  spec.add_development_dependency 'bundler', '~> 2.2'
  spec.add_development_dependency 'rake', '~> 13.0'
end
