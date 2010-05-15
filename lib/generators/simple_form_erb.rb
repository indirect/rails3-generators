module SimpleFormErb
  module Generators
    module TemplatePath
      def source_root
        @_simple_form_source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'simple_form_erb', generator_name, 'templates'))
      end
    end
  end
end
