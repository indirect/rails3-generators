require 'test_helper'

class Mongomapper::Generators::ObserverGeneratorTest < Rails::Generators::TestCase
  destination File.join(Rails.root)
  tests Mongomapper::Generators::ObserverGenerator

  setup :prepare_destination
  setup :copy_routes

  test "invoke" do
    flunk "I don't use Mongomapper. If you use it please add tests."
  end
end
