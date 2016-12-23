require 'sigbit_admin_rails/helpers/application_helper'
require 'sigbit_admin_rails/helpers/sidebar_helper'
require 'sigbit_admin_rails/helpers/page_header_helper'

module SigbitAdminRails
  class Railtie < Rails::Railtie
    initializer 'sigbit_admin_rails.view_helpers' do
      ActionView::Base.send :include, ApplicationHelper
      ActionView::Base.send :include, SidebarHelper
      ActionView::Base.send :include, PageHeaderHelper
    end
  end
end
