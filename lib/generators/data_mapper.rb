require 'rails/generators/named_base'
require 'rails/generators/migration'
require 'rails/generators/active_model'

require 'generators/helpers/migration_helper'

module DataMapper
  module Generators
    class Base < Rails::Generators::NamedBase #:nodoc:
      include Rails3Generators::MigrationHelper
      # include Rails::Generators::Migration

      def self.source_root
        @_datamapper_source_root ||= File.expand_path(File.join(File.dirname(__FILE__),
                                                      'data_mapper', generator_name, 'templates'))
      end

      protected

        # Datamapper does not care if migrations have the same name as long as
        # they have different ids. 
        #
        def migration_exists?(dirname, file_name) #:nodoc:
          false
        end

        # Implement the required interface for Rails::Generators::Migration.
        #
        def next_migration_number(dirname) #:nodoc:
          if options[:id]
            "%.3d" % options[:id]
          else
            "%.3d" % (current_migration_number(dirname) + 1)
          end
        end
    end

    class ActiveModel < Rails::Generators::ActiveModel #:nodoc:
      def self.all(klass)
        "#{klass}.all"
      end

      def self.find(klass, params=nil)
        "#{klass}.get(#{params})"
      end

      def self.build(klass, params=nil)
        if params
          "#{klass}.new(#{params})"
        else
          "#{klass}.new"
        end
      end

      def save
        "#{name}.save"
      end

      def update_attributes(params=nil)
        "#{name}.update(#{params})"
      end

      def errors
        "#{name}.errors"
      end

      def destroy
        "#{name}.destroy"
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
