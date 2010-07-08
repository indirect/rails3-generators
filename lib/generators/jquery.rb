module Jquery
  module Generators
    module TemplatePath
      def source_root
        @_jquery_source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'jquery', generator_name, 'templates'))
      end
    end
  end
end