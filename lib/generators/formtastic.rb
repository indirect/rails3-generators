require 'rails/generators/named_base'

module Formtastic
  module Generators
    class Base < Rails::Generators::NamedBase #:nodoc:

      def self.source_root
        @_simple_form_source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'formtastic', generator_name, 'templates'))
      end
      protected

        def format
          :html
        end

        def handler
          :erb
        end

        def filename_with_extensions(name)
          [name, format, handler].compact.join(".")
        end

        def template_filename_with_extensions(name)
          [name, format, handler, :erb].compact.join(".")
        end
    end
  end
end
