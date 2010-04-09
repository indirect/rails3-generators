require 'generators/haml'
require 'rails/generators/named_base'

module Shoulda
  module Generators
    class ControllerGenerator < Rails::Generators::NamedBase
      
      argument :actions, :type => :array, :default => [], :banner => "action action"
      class_option :dir, :type => :string, :default => "test/functional", :desc => "The directory where the controller tests should go"

      def create_controller_file
        template 'controller.rb', File.join(options[:dir], "#{plural_name}_controller_test.rb")
      end

    end
  end
end