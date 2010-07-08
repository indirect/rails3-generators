require 'test_helper'

class MongoMapper::Generators::ModelGeneratorTest < Rails::Generators::TestCase
  destination File.join(Rails.root)
  tests MongoMapper::Generators::ModelGenerator

  setup :prepare_destination
  setup :copy_routes

  test "invoke" do
    run_generator

    assert_file "config/initializers/mongo_mapper.rb" do |initializer|
      assert_match /MongoMapper.connection = Mongo::Connection.new(\S+)/, initializer
    end
  end
end
