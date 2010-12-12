require 'generators/active_model'

module ActiveModel
  module Generators
    class ModelGenerator < Base
      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"

      check_class_collision

      def create_model_file
        template 'model.rb', File.join('app/models', class_path, "#{file_name}.rb")
      end
      
      def read_properties?
        attributes.any?{|attr| attr.type == :read }
      end

      def read_properties
        attributes.select{|attr| attr.type == :read}.map{|attr| ":#{attr.name}" }.join(",")
      end

      def write_properties?
        attributes.any?{|attr| attr.type == :write }
      end

      def write_properties
        attributes.select{|attr| attr.type == :write }.map{|attr| ":#{attr.name}" }.join(",")
      end

      def accessor_properties?
        attributes.any?{|attr| attr.type == :all }
      end

      def accessor_properties
        attributes.select{|attr| attr.type == :all }.map{|attr| ":#{attr.name}" }.join(",")
      end

      hook_for :test_framework
    end
  end
end
