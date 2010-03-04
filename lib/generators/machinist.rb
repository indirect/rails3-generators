require 'rails/generators/named_base'

module Machinist
  module Generators
    class Base < Rails::Generators::NamedBase #:nodoc:
      def self.source_root
        @_machinist_source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'machinist', generator_name, 'templates'))
      end
    end
  end
end