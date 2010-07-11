require 'generators/mongomapper'

module Mongomapper
  module Generators
    class ObserverGenerator < Base
      check_class_collision :suffix => "Observer"

      def create_observer_file
        template 'observer.rb', File.join('app/models', class_path, "#{file_name}_observer.rb")
        # file_name = File.join('app/models', class_path, "#{file_name}_observer.rb")
        # template 'observer.rb', file_name
      end

      hook_for :test_framework
    end
  end
end
