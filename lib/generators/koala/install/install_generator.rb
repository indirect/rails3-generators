require 'generators/koala'

module Koala
  module Generators
    class InstallGenerator < Rails::Generators::Base
      extend TemplatePath

      def copy_config_file
        template "config/facebook.yml.tt", "config/facebook.yml"
      end

      def copy_initializer_file
        template "config/initializers/koala.rb.tt", "config/initializers/koala.rb"
      end

      def copy_helper_file
        template "app/helpers/facebook_helper.rb.tt", "app/helpers/facebook_helper.rb"
      end

    end
  end
end
