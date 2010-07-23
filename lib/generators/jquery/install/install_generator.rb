require 'generators/jquery'

module Jquery
  module Generators
    class InstallGenerator < Rails::Generators::Base
      extend TemplatePath

      def download_jquery_files
        %w(controls.js dragdrop.js effects.js prototype.js rails.js).each do |js|
          remove_file "public/javascripts/#{js}"
        end

        # Downloading latest jQuery.min
        get "http://code.jquery.com/jquery-latest.min.js", "public/javascripts/jquery.js"

        # Downloading latest jQuery drivers
        get "http://github.com/rails/jquery-ujs/raw/master/src/rails.js", "public/javascripts/rails.js"
      end
      
      def show_readme
        readme "README"
      end
    end
  end
end
