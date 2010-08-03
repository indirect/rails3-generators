require 'test_helper'
require 'lib/generators/mongoid/testing_helper'

class Mongoid::Generators::InstallGeneratorTest < Rails::Generators::TestCase
  destination File.join(Rails.root)
  tests Mongoid::Generators::InstallGenerator

  setup :prepare_destination
  setup :copy_routes

  test "invoke" do
    run_generator ['test-db']

    assert_file "config/initializers/mongoid.rb" do |initializer|
      assert_match /Mongo::Connection.new(\S+)/, initializer
    end
  end
end
