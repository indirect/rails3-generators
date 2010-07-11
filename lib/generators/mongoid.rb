require 'rails/generators/named_base'
require 'rails/generators/active_model'

module Mongoid
  module Generators
    class Base < Rails::Generators::NamedBase #:nodoc:

      def self.source_root
        @_mongoid_source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'mongoid', generator_name, 'templates'))
      end
    end
  end
end

module Rails
  module Generators
    class GeneratedAttribute #:nodoc:
      def type_class
        return 'DateTime' if type.to_s == 'datetime'
        return type.to_s.camelcase
      end
    end
  end
end
