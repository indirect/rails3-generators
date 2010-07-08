# require 'thor-ext'
require 'rails/generators/base'

module Mongoid
  module Generators
    class SetupGenerator < Rails::Generators::Base            

      argument      :database,  :type => :string, :default => 'mongo_db_default', :desc => "Name of the Mongo database to use"            
      class_option  :host,      :type => :string, :default => 'localhost',        :desc => "Name of the Mongo host use"

      def create_files
        template "mongoid.rb" , "config/initializers/mongoid.rb" 
        template 'database.mongo.yml', "config/database.mongo.yml"   
        puts "Please ensure Gemfile contains: gem '#{orm_gem_name}'"
        say "For production enviroment DB configuration, set environment variables as indicated in config/mongo_database.yml"        
      end
      
      protected

      def orm_gem_name
        "mongoid"
      end 
              
      def host
        options[:host] || 'localhost'
      end

    end
  end
end
