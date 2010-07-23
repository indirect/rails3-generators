require 'test_helper'
require 'lib/generators/mongo_mapper/testing_helper'

class MongoMapper::Generators::ObserverGeneratorTest < Rails::Generators::TestCase
  destination File.join(Rails.root)
  tests MongoMapper::Generators::ObserverGenerator

  setup :prepare_destination
  setup :copy_routes

  test "invoke with name Account" do
    name = 'account'
    run_generator [name]
    assert_file "app/models/#{name}_observer.rb" do |file_content|
      assert_class "Account", file_content do |klass|
        assert_match /< MongoMapper::Observer/, klass        
      end
    end    
  end
end
