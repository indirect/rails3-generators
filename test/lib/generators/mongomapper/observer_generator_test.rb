require 'test_helper'
require 'lib/generators/mongomapper/testing_helper'

class Mongomapper::Generators::ObserverGeneratorTest < Rails::Generators::TestCase
  destination File.join(Rails.root)
  tests Mongomapper::Generators::ObserverGenerator

  setup :prepare_destination
  setup :copy_routes

  test "invoke with name Account" do
    name = 'account'
    run_generator [name]
    file_name = File.join('app/models', name, "#{name}_observer.rb")
    assert_file file_name do |file_content|
      assert_class "Account", file_content do |klass|
        assert_match /< MongoMapper::Observer/, klass        
      end
    end    
  end
end
