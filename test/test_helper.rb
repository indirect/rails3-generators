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

def generator_list
  {
    :rails        => ['scaffold', 'controller'],
    :mustache     => ['scaffold', 'controller', 'install'],
    :haml         => ['scaffold', 'controller', 'install'],
    :erubis       => ['scaffold'],
    :simple_form  => ['scaffold'],
    :formtastic   => ['scaffold'], 
    :datamapper   => ['model', 'observer', 'migration'],
    :mongomapper  => ['model', 'observer'],
    :mongo_mapper => ['model', 'observer', 'install'],
    :mongoid      => ['model', 'install'],
    :factory_girl => ['model'],
    :machinist    => ['model'],
    :authlogic    => ['session'],
    :jquery       => ['install'],
    :koala        => ['install'], 
    :shoulda      => ['controller']
  }
end

def path_prefix
  case name
  when :rails
    'rails/generators'
  else
    'generators'     
  end
end

generator_list.each do |name, generators|
  generators.each do |generator_name|
    require File.join(path_prefix(name), name, generator_name, "#{generator_name}_generator")
  end    
end

