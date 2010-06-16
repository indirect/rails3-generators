require 'test_helper'

class Datamapper::Generators::ObserverGeneratorTest < Rails::Generators::TestCase
  destination File.join(Rails.root)
  tests Datamapper::Generators::MigrationGenerator

  setup :prepare_destination
  setup :copy_routes

  test "invoke migration" do
    flunk "I don't use datamapper. If you use it please add tests."
  end
end
