require 'test_helper'
require 'lib/generators/mongo_mapper/testing_helper'

class MongoMapper::Generators::InstallGeneratorTest < Rails::Generators::TestCase
  destination File.join(Rails.root)
  tests MongoMapper::Generators::InstallGenerator

  setup :prepare_destination
  setup :copy_routes

  test "invoke" do
    run_generator ['test-db']
    assert_file "config/initializers/mongo_mapper.rb" do |initializer|
      assert_match /MongoMapper.connection = Mongo::Connection.new(\S+)/, initializer
    end
  end
end
