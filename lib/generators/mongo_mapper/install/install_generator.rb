require 'generators/mongo_mapper'

module MongoMapper
  module Generators
    class InstallGenerator < Base
      class_option  :host,      :type => :string, :default => 'localhost',        :desc => "Name of the Mongo host use"

      def create_files
        template "mongo_mapper.rb" , "config/initializers/mongo_mapper.rb"
        template "database.mongo.yml" , "config/database.mongo.yml"
        say "Please ensure Gemfile contains: gem '#{orm_gem_name}', '>=0.8.2'"
        say "For production enviroment DB configuration, set environment variables as indicated in config/database.mongo.yml"
      end

      protected

        def database
          name
        end

        def orm_gem_name
          "mongo_mapper"
        end

        def host
          options[:host] || 'localhost'
        end
    end
  end
end
