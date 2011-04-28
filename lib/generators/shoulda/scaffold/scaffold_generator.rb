require 'generators/shoulda'

module Shoulda
  module Generators
    class ScaffoldGenerator < Base
      include Rails::Generators::ResourceHelpers

      check_class_collision :suffix => 'ControllerTest'

      def create_controller_file
        template 'scaffold.rb', File.join('test/functional', controller_class_path, "#{controller_file_name}_controller_test.rb")
      end
    end
  end
end
