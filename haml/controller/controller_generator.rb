require File.join(File.dirname(__FILE__), "..", "haml")

module Haml
  module Generators
    class ControllerGenerator < Base
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