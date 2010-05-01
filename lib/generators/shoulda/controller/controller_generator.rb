require 'generators/shoulda'

module Shoulda
  module Generators
    class ControllerGenerator < Base
      argument :actions, :type => :array, :default => [], :banner => "action action"
      class_option :dir, :type => :string, :default => "test/functional", :desc => "The directory where the controller tests should go"
      
      check_class_collision :suffix => 'ControllerTest'

      def create_controller_file
        template 'controller.rb', File.join(options[:dir], "#{file_name}_controller_test.rb")
      end
    end
  end
end
