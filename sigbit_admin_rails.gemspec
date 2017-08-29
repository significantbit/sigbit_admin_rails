$LOAD_PATH.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'sigbit_admin_rails'
  s.version     = '0.1.4'
  s.date        = '2017-02-21'
  s.summary     = "Significant Bit Admin template for Rails applications"
  s.description = "Gem for including sigbit-admin and helpers for Rails applications"
  s.authors     = ["Johan André", "Ante Wall", "Andreas Antonsson"]
  s.email       = ['info@significantbit.se']
  s.homepage    =
    'http://rubygems.org/gems/sigbit_admin_rails'
  s.license       = 'ISC'
  s.files = Dir["{app,config,assets,db,lib}/**/*"]

  s.add_dependency('bourbon', '~> 4.2.7')
  s.add_dependency('bootstrap', '~> 4.0.0.beta')
end
