require 'generators/shoulda'

module Shoulda
  module Generators
    class ModelGenerator < Base
      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"
      class_option :dir, :type => :string, :default => "test/unit", :desc => "The directory where the model tests should go"
      
      def create_model_test_file
        template 'model.rb', File.join(options[:dir], "#{singular_name}_test.rb")
      end
      
      hook_for :fixture_replacement
    end
  end
end
