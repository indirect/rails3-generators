require 'generators/haml'

module Haml
  module Generators
    class InstallGenerator < Rails::Generators::Base
      extend TemplatePath
      
      def copy_initializer_files
        inside "config" do
          empty_directory "initializers", :verbose => false

          inside "initializers" do
            template "haml.rb.tt", "haml.rb"
          end
        end
      end
      
    end
  end
end