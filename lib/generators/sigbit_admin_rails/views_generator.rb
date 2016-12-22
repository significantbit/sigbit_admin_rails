require 'rails/generators/base'

module SigbitAdminRails
  module Generators
    module ViewPathTemplates
      extend ActiveSupport::Concern
      included do
        argument :scope, required: false, default: nil,
          desc: "The scope to copy views to"

        class_option :form_builder, aliases: "-b"

        public_task :copy_views
      end

      def copy_views
        view_directory :sessions
        view_directory :passwords
      end

      protected

      def view_directory(name, _target_path = nil)
        directory name.to_s, _target_path || "#{target_path}/#{name}" do |content|
          if scope
            content.gsub "devise/shared/links", "#{plural_scope}/shared/links"
          else
            content
          end
        end
      end

      def target_path
        @target_path ||= "app/views/#{plural_scope ||= :devise}"
      end

      def plural_scope
        @plural_scope ||= scope.presence && scope.underscore.pluralize
      end
    end

    class FormForGenerator < Rails::Generators::Base #:nodoc:
      include ViewPathTemplates
      source_root File.expand_path("../../templates/form_for", __FILE__)
      desc "Copies default Devise views to your application."
    end

    class SimpleFormForGenerator < Rails::Generators::Base #:nodoc:
      include ViewPathTemplates
      source_root File.expand_path("../../templates/simple_form_for", __FILE__)
      desc "Copies simple form enabled views to your application."
    end

    class ViewsGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Copies Devise views to your application."

      argument :scope, required: false, default: nil,
        desc: "The scope to copy views to"

      hook_for :form_builder, aliases: "-b",
        desc: "Form builder to be used",
        default: defined?(SimpleForm) ? "simple_form_for" : "form_for"

      def copy_devise_layout
        copy_file "layouts/devise.html.erb", "app/views/layouts/devise.html.erb"
      end

      def setup_devise_initializer
        insert_into_file "config/initializers/devise.rb", before: 'Devise.setup do |config|' do
          <<~BLOCK 
            Rails.application.config.to_prepare do
              Devise::SessionsController.layout "devise"
              Devise::RegistrationsController.layout proc { |controller| user_signed_in? ? "application" : "devise" }
              Devise::ConfirmationsController.layout "devise"
              Devise::UnlocksController.layout "devise"
              Devise::PasswordsController.layout "devise"
            end
          BLOCK
        end
      end

    end
  end
end
