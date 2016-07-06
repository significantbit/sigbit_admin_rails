module SigbitAdminRails
  class Engine < ::Rails::Engine
    # Get rails to add app, lib, vendor to load path
  end
end
require 'sigbit_admin_rails/railtie' if defined?(Rails)

