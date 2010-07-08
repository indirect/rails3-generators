require 'test_helper'

class Mongomapper::Generators::ObserverGeneratorTest < Rails::Generators::TestCase
  destination File.join(Rails.root)
  tests Mongomapper::Generators::ObserverGenerator

  setup :prepare_destination
  setup :copy_routes

  test "invoke with name Account" do
    name = 'account'
    run_generator name
    File.join('app/models', name, "#{name}_observer.rb")
  end
end
