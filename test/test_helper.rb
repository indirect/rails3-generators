require 'rubygems'
require 'test/unit'
require 'rails/all'
require 'rails/generators'
require 'rails/generators/test_case'

class TestApp < Rails::Application
  config.root = File.dirname(__FILE__)
end
Rails.application = TestApp

module Rails
  def self.root
    @root ||= File.expand_path(File.join(File.dirname(__FILE__), '..', 'tmp', 'rails'))
  end
end
Rails.application.config.root = Rails.root

# Call configure to load the settings from
# Rails.application.config.generators to Rails::Generators
Rails::Generators.configure!

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

def copy_routes
  routes = File.expand_path(File.join(File.dirname(__FILE__), 'fixtures', 'routes.rb'))
  destination = File.join(Rails.root, "config")
  FileUtils.mkdir_p(destination)
  FileUtils.cp File.expand_path(routes), destination
end

require 'rails/generators/rails/scaffold/scaffold_generator'
require 'rails/generators/rails/controller/controller_generator'

require 'generators/haml/install/install_generator'
require 'generators/haml/scaffold/scaffold_generator'
require 'generators/haml/controller/controller_generator'

require 'generators/erubis/scaffold/scaffold_generator'

require 'generators/simple_form/scaffold/scaffold_generator'

