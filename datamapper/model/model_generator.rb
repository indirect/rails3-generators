require 'generators/datamapper'

module Datamapper
  module Generators
    class ModelGenerator < Base
      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"
      class_option :id, :type => :numeric, :desc => "The id to be used in the migration"

      check_class_collision

      class_option :migration,  :type => :boolean
      class_option :timestamps, :type => :boolean
      class_option :parent,     :type => :string, :desc => "The parent class for the generated model"

      def create_migration_file
        if options[:migration] && options[:parent].nil?
          file_name = "create_#{file_path.gsub(/\//, '_').pluralize}"
          migration_template "migration.rb", "db/migrate/#{file_name}.rb"
        end
      end

      def create_model_file
        template 'model.rb', File.join('app/models', class_path, "#{file_name}.rb")
      end

      hook_for :test_framework
    end
  end
end
