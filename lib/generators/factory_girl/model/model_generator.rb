require 'generators/factory_girl'

module FactoryGirl
  module Generators
    class ModelGenerator < Base
      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"
      class_option :dir, :type => :string, :default => "test/factories", :desc => "The directory where the factories should go"
      
      def create_fixture_file
        version = nil
        begin
          require 'factory_girl/version'
          version = FactoryGirl::VERSION.to_i
        rescue LoadError
          require 'factory_girl'
          version = Factory::VERSION.to_i
        rescue Object => e
          raise "Please install Factory_girl or add it to your Gemfile"
        end
        
        template "fixtures.#{version}.rb", File.join(options[:dir], "#{table_name}.rb")
      end
    end
  end
end
