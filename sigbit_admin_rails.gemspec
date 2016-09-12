$LOAD_PATH.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'sigbit_admin_rails'
  s.version     = '0.0.5'
  s.date        = '2016-07-06'
  s.summary     = "Significant Bit Admin template for Rails applications"
  s.description = "Gem for including sigbit-admin and helpers for Rails applications"
  s.authors     = ["Ante Wall", "Andreas Antonsson", "Johan André"]
  s.email       = ['antewall@gmail.com']
  s.homepage    =
    'http://rubygems.org/gems/sigbit_admin_rails'
  s.license       = 'ISC'
  s.files = Dir["{app,config,assets,db,lib}/**/*"]

  s.add_dependency('bourbon', '~> 4.2.7')
  s.add_dependency('bootstrap', '~> 4.0.0.alpha3')
end

