require 'test_helper'
require 'lib/generators/datamapper/testing_helper'

class Datamapper::Generators::ObserverGeneratorTest < Rails::Generators::TestCase
  destination File.join(Rails.root)
  tests Datamapper::Generators::ObserverGenerator

  setup :prepare_destination
  setup :copy_routes

  test "invoke with model name" do
    name = 'account'
    content = run_generator %w(Account)

    assert_file "app/models/#{name}_observer.rb" do |account|
      assert_class "Account", account do |klass|
        assert_match /include DataMapper::Observer/, klass
        assert_match /observe\s+#{name.camelize}/, klass
      end
    end
  end
end
