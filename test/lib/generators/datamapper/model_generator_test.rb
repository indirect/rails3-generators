require 'test_helper'

class Datamapper::Generators::ModelGeneratorTest < Rails::Generators::TestCase
  destination File.join(Rails.root)
  tests Datamapper::Generators::ModelGenerator

  setup :prepare_destination
  setup :copy_routes

  test "invoke" do
    flunk "I don't use Datamapper. If you use it please add tests."
  end
end
