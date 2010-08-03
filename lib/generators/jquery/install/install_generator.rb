require 'generators/jquery'

module Jquery
  module Generators
    class InstallGenerator < Rails::Generators::Base
      extend TemplatePath
      class_option :jqueryui, :type => :boolean, :default => false, :desc => "Indicates when to Include JQueryUI (minified version; source: Google Libraries API)"

      def download_jquery_files
        %w(controls.js dragdrop.js effects.js prototype.js rails.js).each do |js|
          remove_file "public/javascripts/#{js}"
        end

        # Downloading latest jQuery.min
        get "http://code.jquery.com/jquery-latest.min.js", "public/javascripts/jquery.js"

        # Downloading latest jQuery drivers
        get "http://github.com/rails/jquery-ujs/raw/master/src/rails.js", "public/javascripts/rails.js"
      end
      
      def download_jqueryui_files
        # Downloading latest jQueryUI minified
        get "http://ajax.googleapis.com/ajax/libs/jqueryui/1/jquery-ui.min.js", "public/javascripts/jqueryui.js" if options.jqueryui?
      end
      
      def show_readme
        readme "README"
      end
    end
  end
end
