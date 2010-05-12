require 'generators/simple_form'
require 'rails/generators/named_base'

module SimpleFormHaml
  module Generators
    class ControllerGenerator < Rails::Generators::NamedBase
      extend TemplatePath
      
      argument :actions, :type => :array, :default => [], :banner => "action action"

      def create_view_files
        base_path = File.join("app/views", class_path, file_name)
        empty_directory base_path

        actions.each do |action|
          @action = action
          @path   = File.join(base_path, "#{action}.html.haml")

          template 'view.html.haml', @path
        end
      end
    end
  end
end
