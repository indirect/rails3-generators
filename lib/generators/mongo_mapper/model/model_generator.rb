require 'generators/mongo_mapper'
require 'generators/helpers/model_helper'

module MongoMapper
  module Generators
    class ModelGenerator < Base

      argument      :attributes,  :type => :array, :default => [],      :banner => "field:type field:type#, posfixing with '#' marks attribute to be indexed"

      class_option :timestamps,   :type => :boolean, :aliases => "-T",  :desc => "Add timestamps created_at and updated_at", :default => false
      class_option :embedded,     :type => :boolean, :aliases => "-E",  :desc => "Embedded document", :default => false
      class_option :version,      :type => :boolean, :aliases => "-V",  :desc => "Add versioning",    :default => false
      class_option :parent,       :type => :string,  :aliases => "-P",  :desc => "Class name of parent document"

      # check_class_collision

      def initialize(*args, &block)
        super         
        # from helpers/model_helper        
        parse_model_attributes
      end

      def create_model_file
        template 'model.rb', "app/models/#{singular_name}.rb"        
      end

      protected 

      include Rails3Generators::Helpers::Model
      
      def embedded_statement
        "include MongoMapper::EmbeddedDocument"
      end

      def version_statement
        'include Versioned # see http://github.com/nathancolgate/versioned for 0.8 compatible version'
      end

      def version?
        options[:version]
      end        

      def embedded?
        options[:embedded]
      end

      def parent?
        options[:parent]
      end

      def timestamps?
        options[:timestamps]
      end

      def model_exists?
        File.exist? destination_path("app/models/#{singular_name}.rb")
      end        
      
      def singular_name
        model_name.underscore
      end

      def plural_name
        model_name.underscore.pluralize
      end

      def class_name
        model_name.camelize
      end

      def plural_class_name
        plural_name.camelize
      end 
      
      def model_columns_for_attributes
        class_name.constantize.columns.reject do |column|
          column.name.to_s =~ /^(id|created_at|updated_at)$/
        end
      end
    end
  end
end