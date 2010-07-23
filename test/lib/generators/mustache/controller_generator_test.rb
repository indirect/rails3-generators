require 'test_helper'
require 'lib/generators/mustache/testing_helper'

class Mustache::Generators::ControllerGeneratorTest < Rails::Generators::TestCase
  destination File.join(Rails.root)
  tests Rails::Generators::ControllerGenerator
  arguments %w(Account foo bar --template-engine mustache)

  setup :prepare_destination
  setup :copy_routes

  test "should generate mustache views" do
    run_generator
    assert_file "app/views/account/foo.rb"
    assert_file "app/views/account/bar.rb"
  end

  test "should generate mustache views as classes with scoped names extending Mustache::Rails" do
    run_generator
    assert_file "app/views/account/foo.rb", 
                %r(class Account::Foo < Mustache::Rails)
    assert_file "app/views/account/bar.rb",
                %r(class Account::Bar < Mustache::Rails)
  end
  
  test "should generate mustache template files" do
    run_generator
    assert_file "app/templates/account/foo.html.mustache"
    assert_file "app/templates/account/bar.html.mustache"
  end
  
end
