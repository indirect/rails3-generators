require 'generators/mongo_mapper'

module MongoMapper
  module Generators
    class InstallGenerator < Base            
      # include ThorExtensions

      # argument      :database,  :type => :string, :default => 'mongo_db_default', :desc => "Name of the Mongo database to use"            
      class_option  :host,      :type => :string, :default => 'localhost',        :desc => "Name of the Mongo host use"

      def create_files
        template "mongo_mapper.rb" , "config/initializers/mongo_mapper.rb"
        template "database.mongo.yml" , "config/database.mongo.yml"
        say "Please ensure Gemfile contains: gem 'mongo_mapper'"
        say "For production enviroment DB configuration, set environment variables as indicated in config/mongo_database.yml"        
      end
      
      protected
      
      def database
        name
      end

      def orm_gem_name
        "mongoid"
      end 
      
      def host
        options[:host] || 'localhost'
      end
    end
  end
end
