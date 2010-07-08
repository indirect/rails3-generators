require 'generators/authlogic'

module Authlogic
  module Generators
    class SessionGenerator < Base
      desc "Builds an Authlogic session model"
      
      check_class_collision
      
      def create_session_file
        template 'session.rb', File.join('app', 'models', class_path, "#{file_name}.rb")
      end
      
      # HACK: make test_framework generator for this generator.
      hook_for :test_framework, :as => :model
    end
  end
end

