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

# Asserts the given class exists in the given content. When a block is given,
# it yields the content of the class.
#
#   assert_file "test/functional/accounts_controller_test.rb" do |controller_test|
#     assert_class "AccountsControllerTest", controller_test do |klass|
#       assert_match /context "index action"/, klass
#     end
#   end
#
def assert_class(klass, content)
  assert content =~ /class #{klass}(\(.+\))?(.*?)\nend/m, "Expected to have class #{klass}"
  yield $2.strip if block_given?
end

require 'rails/generators/rails/scaffold/scaffold_generator'
require 'rails/generators/rails/controller/controller_generator'

# require 'generators/mustache/install/install_generator'
require 'generators/mustache/scaffold/scaffold_generator'
require 'generators/mustache/controller/controller_generator'

require 'generators/haml/install/install_generator'
require 'generators/haml/scaffold/scaffold_generator'
require 'generators/haml/controller/controller_generator'
require 'generators/erubis/scaffold/scaffold_generator'

require 'generators/simple_form/scaffold/scaffold_generator'
require 'generators/formtastic/scaffold/scaffold_generator'

require 'generators/datamapper/migration/migration_generator'
require 'generators/datamapper/model/model_generator'
require 'generators/datamapper/observer/observer_generator'
require 'generators/mongomapper/model/model_generator'
require 'generators/mongomapper/observer/observer_generator'

require 'generators/factory_girl/model/model_generator'
require 'generators/machinist/model/model_generator'

require 'generators/authlogic/session/session_generator'

require 'generators/jquery/install/install_generator'

require 'generators/koala/install/install_generator'

require 'generators/shoulda/controller/controller_generator'
