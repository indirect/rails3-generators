require 'generators/mongoid'
require 'generators/helpers/model_helper'

module Mongoid
  module Generators
    class ModelGenerator < Base
      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"  
      
      class_option :embedded_in,  :type => :string,   :aliases => "-E",  :desc => "Class name of document this document is embedded in"
      class_option :parent,       :type => :string,   :aliases => "-P",  :desc => "Class name of parent document"
      class_option :timestamps,   :type => :boolean,  :aliases => "-T",  :desc => "Add timestamps created_at and updated_at", :default => false
      class_option :version,      :type => :boolean,  :aliases => "-V",  :desc => "Add versioning", :default => false      
                                 
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
        options[:embedded_in]
      end

      def parent?
        options[:parent]
      end

      def timestamps?
        options[:timestamps]
      end

      def version?
        options[:version]
      end

      def embedded_statement
        "embedded_in :#{options[:embedded_in].underscore}, :inverse_of => :#{class_name.pluralize.underscore}"
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