module Koala
  module Generators
    module TemplatePath
      def source_root
        @_koala_source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'koala', generator_name, 'templates'))
      end
    end
  end
end
