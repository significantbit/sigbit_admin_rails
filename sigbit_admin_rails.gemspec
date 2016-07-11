$LOAD_PATH.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'sigbit_admin_rails'
  s.version     = '0.0.3'
  s.date        = '2016-07-06'
  s.summary     = "Sigbit Admin template for rails"
  s.description = "Gem for includeing sigbit-admin and helpers for rails applications"
  s.authors     = ["Ante Wall"]
  s.email       = ['antewall@gmail.com']
  s.files = Dir["{app,config,lib,vendor}/**/*"]
  s.homepage    =
    'http://rubygems.org/gems/sigbit_admin_rails'
  s.license       = 'ISC'
  s.require_paths = %w(lib)
end

