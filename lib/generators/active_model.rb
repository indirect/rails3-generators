require 'rails/generators/named_base'
require 'rails/generators/migration'
require 'rails/generators/active_model'

require 'generators/helpers/migration_helper'

module ActiveModel
  module Generators
    class Base < Rails::Generators::NamedBase #:nodoc:

      def self.source_root
        @_activemodel_source_root ||= File.expand_path(File.join(File.dirname(__FILE__),
                                                      'active_model', generator_name, 'templates'))
      end

    end

    class ActiveModel < Rails::Generators::ActiveModel #:nodoc:
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
