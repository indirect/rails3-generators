require 'generators/mongoid'

module Mongoid
  module Generators
    class ModelGenerator < Base
      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"

      check_class_collision

      class_option :timestamps, :type => :boolean, :default => true
      class_option :parent,     :type => :string, :desc => "The parent class for the generated model" 
      class_option :versioning, :type => :boolean, :default => false, :desc => "Enable mongoid versioning"
      
      def create_model_file
        template 'model.rb', File.join('app/models', class_path, "#{file_name}.rb")
      end

      hook_for :test_framework
    end
  end
end