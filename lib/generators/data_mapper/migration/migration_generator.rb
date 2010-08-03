require 'generators/data_mapper'

module DataMapper
  module Generators
    class MigrationGenerator < Base
      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"
      class_option :id, :type => :numeric, :desc => "The id to be used in this migration"

      def create_migration_file
        set_local_assigns!
        migration_template "migration.rb", "db/migrate/#{file_name}.rb"
      end

      protected
        attr_reader :migration_action

        def set_local_assigns!
          if file_name =~ /^(add|remove|drop)_.*_(?:to|from)_(.*)/
            @migration_action = $1 == 'add' ? 'add' : 'drop'
            @table_name       = $2.pluralize
          end
        end

    end
  end
end
