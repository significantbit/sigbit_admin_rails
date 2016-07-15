require 'sigbit_admin_rails/helpers/application_helper'
require 'sigbit_admin_rails/helpers/sidebar_helper'

module SigbitAdminRails
  class Railtie < Rails::Railtie
    initializer 'sigbit_admin_rails.view_helpers' do
      ActionView::Base.send :include, ApplicationHelper
      ActionView::Base.send :include, SidebarHelper
    end
  end
end
