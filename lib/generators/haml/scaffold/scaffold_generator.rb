require 'generators/haml'
require 'rails/generators/erb/scaffold/scaffold_generator'

module Haml
  module Generators
    class ScaffoldGenerator < Erb::Generators::ScaffoldGenerator
      extend TemplatePath

      def copy_layout_file
        return unless options[:layout]
        template "layout.haml.erb",
                 File.join("app/views/layouts", controller_class_path, "#{controller_file_name}.html.haml")
      end
      
      def copy_view_files
        views = available_views
        views.delete("index") if options[:singleton]

        views.each do |view|
          template "#{view}.haml.erb", File.join("app/views", controller_file_path, "#{view}.html.haml")
        end
      end

    end
  end
end
