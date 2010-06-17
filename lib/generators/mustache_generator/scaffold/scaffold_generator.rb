require 'generators/mustache_generator'
require 'rails/generators/erb/scaffold/scaffold_generator'

module MustacheGenerator
  module Generators
    class ScaffoldGenerator < Erb::Generators::ScaffoldGenerator
      extend TemplatePath

      # TODO Layout files? snusnu claims his template engine supports layouts:
      # http://github.com/defunkt/mustache/issues/#issue/3/comment/263445

      def copy_view_files
        views = available_views
        views.delete("index") if options[:singleton]

        # TODO More views!
        supported_views = %w(show)
        supported_views.each do |view|
          template "#{view}.rb.erb", 
                   File.join("app/views", controller_file_path, "#{view}.rb")
          template "#{view}.html.mustache.erb", 
                   File.join("app/templates", 
                             controller_file_path, 
                             "#{view}.html.mustache")
        end
        views -= supported_views
        
        # Until more views supported, create empty files
        views.each do |view|                  
          create_file File.join("app/views", 
                                controller_file_path, "#{view}.rb")
          create_file File.join("app/templates", 
                                controller_file_path,"#{view}.html.mustache")
        end
      end
      
      private
      
      def available_views
        %w(index edit show new)
      end

    end
  end
end
