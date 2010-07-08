require 'generators/mongomapper'
require 'generators/helpers/model_helper'

module MongoMapper
  module Generators
    class ModelGenerator < Base

      argument      :attributes, :type => :array, :default => [], :banner => "field:type field:type#, posfixing with '#' marks attribute to be indexed"

      class_option  :embedded, :type => :boolean, :aliases => "-E", :desc => "Embedded document"

      check_class_collision

      class_option :timestamps, :type => :boolean
      class_option :parent,     :type => :string, :desc => "The parent class"

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
    
    def self.source_root
      @source_root ||= File.expand_path('../templates', __FILE__)
    end

    def self.banner
      "#{$0} mongo_mapper:#{generator_name} #{self.arguments.map{ |a| a.usage }.join(' ')} [options]"
    end
      
    end
  end
end