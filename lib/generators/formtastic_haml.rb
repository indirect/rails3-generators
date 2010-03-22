module FormtasticHaml
  module Generators
    module TemplatePath
      def source_root
        @_formtastic_source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'formtastic_haml', generator_name, 'templates'))
      end
    end
  end
end
