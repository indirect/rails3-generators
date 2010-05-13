require 'generators/simple_form_erb'
require 'generators/erb/scaffold/scaffold_generator'

module SimpleFormErb
  module Generators
    class ScaffoldGenerator < Erb::Generators::ScaffoldGenerator
      extend TemplatePath

      def copy_layout_file
        return unless options[:layout]
        template "layout.html.erb",
                 File.join("app/views/layouts", controller_class_path, "#{controller_file_name}.html.erb")
      end
      
      def copy_shared_files
        template "_form_errors.html.erb",
                 File.join("app/views/shared", "_form_errors.html.erb")
      end

      protected

      def copy_view(view)
        if view =~ /^_.*/
          template "#{view}.html.erb", File.join("app/views", controller_file_path, "#{view}.html.erb")
        else
          super view
        end
      end

    end
  end
end