require 'test_helper'

class Mongoid::Generators::ModelGeneratorTest < Rails::Generators::TestCase
  destination File.join(Rails.root)
  tests Mongoid::Generators::ModelGenerator

  setup :prepare_destination
  setup :copy_routes

  test "invoke" do
    flunk "I don't use Mongoid. If you use it please add tests."
  end
end
