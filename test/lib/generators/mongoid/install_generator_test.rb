require 'test_helper'

class Mongoid::Generators::SetupGeneratorTest < Rails::Generators::TestCase
  destination File.join(Rails.root)
  tests Mongoid::Generators::SetupGenerator

  setup :prepare_destination
  setup :copy_routes

  test "invoke" do
    run_generator

    assert_file "config/initializers/mongoid.rb" do |initializer|
      assert_match /Mongo::Connection.new(\S+)/, initializer
    end
  end
end
