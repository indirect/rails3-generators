require 'generators/mustache'

class Mustache
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      extend TemplatePath

      def copy_initializer_files
        copy_file "config/initializers/mustache.rb", "config/initializers/mustache.rb"
        copy_file "lib/mustache_rails.rb", "lib/mustache_rails.rb"
      end

    end
  end
end
