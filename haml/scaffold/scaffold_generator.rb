require 'generators/haml'
require 'rails/generators/erb/scaffold/scaffold_generator'

module Haml
  module Generators
    class ScaffoldGenerator < Erb::Generators::ScaffoldGenerator
      extend TemplatePath
      
      def copy_layout_file
        return unless options[:layout]
        template "layout.haml.erb",
                 File.join("app/views/layouts", controller_class_path, "#{controller_file_name}.haml")
      end

      protected

        def copy_view(view)
          template "#{view}.haml.erb", File.join("app/views", controller_file_path, "#{view}.haml")
        end

    end
  end
end
