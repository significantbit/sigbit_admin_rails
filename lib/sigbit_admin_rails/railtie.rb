require 'sigbit_admin_rails/helpers/application_helper'
require 'sigbit_admin_rails/helpers/sidebar_helper'

module SigbitAdminRails
  class Railtie < Rails::Railtie
    initializer "my_gem.view_helpers" do
      ActionView::Base.send :include, ApplicationHelper
      ActionView::Base.send :include, SidebarHelper
    end
  end
end
