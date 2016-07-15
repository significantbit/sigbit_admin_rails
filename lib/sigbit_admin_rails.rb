require 'bourbon'
require 'bootstrap'

module SigbitAdminRails
  class Engine < ::Rails::Engine
    # Get rails to add app, lib, vendor to load path
    initializer 'sigbit_admin_rails.assets.precompile' do |app|
      %w(stylesheets javascripts fonts images).each do |sub|
        app.config.assets.paths << root.join('assets', sub).to_s
      end
    end
  end
end
require 'sigbit_admin_rails/railtie' if defined?(Rails)
