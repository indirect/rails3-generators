require 'generators/mongoid'
require 'generators/helpers/model_helper'

module Mongoid
  module Generators
    class ModelGenerator < Base
      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"  

      class_option :parent, :type => :string, :aliases => "-P",
                              :desc => "Class name of parent document embedded in"

      class_option :version, :type => :boolean, :aliases => "-V", :default => false
                              :desc => "Add versioning"

      class_option :timestamps, :type => :boolean, :aliases => "-T", :default => true
                              :desc => "Add timestamps"

      class_option  :embedded, :type => :string, :aliases => "-E", :desc => "Embedded document class"
                                 
      def initialize(*args, &block)
        super   
        # from helpers/model_helper
        parse_model_atributes
      end

      def create_model_file
        template 'model.rb', "app/models/#{singular_name}.rb"        
      end

      protected  

      include Rails3Generators::Helpers::Model

      def embedded?
        options[:embedded]
      end

      def parent?
        options[:parent]
      end

      def timestamps?
        options[:timestamps]
      end

      def embedded_statement
        "embedded_in :#{options[:embedded].underscore}, :inverse_of => :#{class_name.pluralize.underscore}"
      end

      def version_statement
        "include Mongoid::Versioning"
      end

      def timestamps_statement
        "include Mongoid::Timestamps"
      end     
    end
  end
end