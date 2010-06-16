module MustacheGenerator
  module Generators
    module TemplatePath
      def source_root
        @_mustache_source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'mustache_generator', generator_name, 'templates'))
      end
    end
  end
end
