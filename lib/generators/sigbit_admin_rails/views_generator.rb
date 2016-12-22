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
      desc "Copies Devise views to your application."

      argument :scope, required: false, default: nil,
        desc: "The scope to copy views to"

      hook_for :form_builder, aliases: "-b",
        desc: "Form builder to be used",
        default: defined?(SimpleForm) ? "simple_form_for" : "form_for"
    end
  end
end
