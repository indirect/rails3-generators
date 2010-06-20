require 'generators/jquery'

module Jquery
  module Generators
    class InstallGenerator < Rails::Generators::Base
      extend TemplatePath

      def copy_initializer_files
        template "config/initializers/jquery.rb.tt", "config/initializers/jquery.rb"
      end

      def download_jquery_files
        %w(controls.js dragdrop.js effects.js prototype.js rails.js).each do |prototype|
          remove_file "public/javascripts/#{prototype}"
        end

        # Downloading latest jQuery.min
        get "http://code.jquery.com/jquery-latest.min.js", "public/javascripts/jquery.js"

        # Downloading latest jQuery drivers
        get "http://github.com/rails/jquery-ujs/raw/master/src/rails.js", "public/javascripts/rails.js"
      end
    end
  end
end
