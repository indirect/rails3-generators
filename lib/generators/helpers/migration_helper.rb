require 'rails/generators/migration'

module Rails3Generators
  module MigrationHelper
    include Rails::Generators::Migration

    attr_accessor :migration_number

    module ClassMethods          
      def migration_lookup_at(dirname) #:nodoc:
        Dir.glob("#{dirname}/[0-9]*_*.rb")
      end

      def migration_exists?(dirname, file_name) #:nodoc:
        migration_lookup_at(dirname).grep(/\d+_#{file_name}.rb$/).first
      end

      def current_migration_number(dirname) #:nodoc:
        migration_lookup_at(dirname).collect do |file|
          File.basename(file).split("_").first.to_i
        end.max.to_i
      end

      def next_migration_number(dirname) #:nodoc:
        orm = Rails.configuration.generators.options[:rails][:orm]
        require "rails/generators/#{orm}"
        "#{orm.to_s.camelize}::Generators::Base".constantize.next_migration_number(dirname)         
      rescue
        raise NotImplementedError
      end
    end         

    def self.included(base) #:nodoc: 
      base.extend ClassMethods      
    end
       
   
    def run_migration(options)
      run "rails g migration #{options}"
    end

    protected
    
      def model_exists?(name)
        File.exists?(File.join(Rails.root, "app/models/#{name}.rb"))
      end
    
      def model_file(name)                          
        File.join(Rails.root, "app/models/#{name}.rb")        
      end    
  end
end

