require 'test_helper'

class Mongomapper::Generators::ModelGeneratorTest < Rails::Generators::TestCase
  destination File.join(Rails.root)
  tests Mongomapper::Generators::ModelGenerator

  setup :prepare_destination
  setup :copy_routes

  test "invoke" do
    flunk "I don't use Mongomapper. If you use it please add tests."
  end
end
