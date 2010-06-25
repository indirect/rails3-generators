require 'generators/mustache'
require 'rails/generators/erb/scaffold/scaffold_generator'

class Mustache
  module Generators
    class ScaffoldGenerator < Erb::Generators::ScaffoldGenerator
      extend TemplatePath

      # TODO Layout files? snusnu claims his template engine supports layouts:
      # http://github.com/defunkt/mustache/issues/#issue/3/comment/263445

      def copy_view_files
        views = available_views
        views.delete("index") if options[:singleton]

        views.each do |view|                  
          template "#{view}.rb.erb", 
                   File.join("app/views", controller_file_path, "#{view}.rb")
          template "#{view}.html.mustache.erb", 
                   File.join("app/templates", 
                             controller_file_path, 
                             "#{view}.html.mustache")
        end
        template "_form.html.mustache.erb", 
                   File.join("app/templates", 
                             controller_file_path, 
                             "_form.html.mustache")
      end
      
      private
      
      def available_views
        %w(index edit show new)
      end

    end
  end
end
