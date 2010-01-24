require 'rails/generators/named_base'

module Authlogic
  module Generators
    class Base < Rails::Generators::NamedBase
      def self.source_root
        @_authlogic_source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'authlogic', generator_name, 'templates'))
      end
    end
  end
end