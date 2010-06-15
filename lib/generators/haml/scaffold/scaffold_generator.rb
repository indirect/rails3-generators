require 'generators/haml'
require 'rails/generators/erb/scaffold/scaffold_generator'

module Haml
  module Generators
    class ScaffoldGenerator < Erb::Generators::ScaffoldGenerator
      extend TemplatePath

      def copy_view_files
        views = available_views
        views.delete("index") if options[:singleton]

        views.each do |view|
          filename = filename_with_extensions(view)
          template template_filename_with_extensions(view), File.join("app/views", controller_file_path, filename)
        end
      end

      protected

        def handler
          :haml
        end

        def template_filename_with_extensions(name)
          [name, format, handler, :erb].compact.join(".")
        end
    end
  end
end
