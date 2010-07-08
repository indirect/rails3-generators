require 'test_helper'

class MongoMapper::Generators::ObserverGeneratorTest < Rails::Generators::TestCase
  destination File.join(Rails.root)
  tests MongoMapper::Generators::ObserverGenerator

  setup :prepare_destination
  setup :copy_routes

  test "invoke" do
    flunk "I don't use Mongo Mapper. If you use it please add tests."
  end
end
