require 'test_helper'
require 'lib/generators/mongo_mapper/testing_helper'

class MongoMapper::Generators::ModelGeneratorTest < Rails::Generators::TestCase
  destination File.join(Rails.root)
  tests MongoMapper::Generators::ModelGenerator

  setup :prepare_destination
  setup :copy_routes

  test "invoke with model name" do
    content = run_generator %w(Account)

    assert_file "app/models/account.rb" do |account|
      assert_class "Account", account do |klass|
        assert_match /include MongoMapper::Document/, klass
      end
    end
  end
  
  test "invoke with model name and attributes" do
    content = run_generator %w(Account name:string age:integer)

    assert_file "app/models/account.rb" do |account|
      assert_class "Account", account do |klass|
        assert_match /key :name, String/, klass
        assert_match /key :age, Integer/, klass        
      end
    end
  end  
  
  test "invoke with model name and --embedded option" do
    content = run_generator %w(Account --embedded)

    assert_file "app/models/account.rb" do |account|
      assert_class "Account", account do |klass|
        assert_match /include MongoMapper::EmbeddedDocument/, klass
      end
    end
  end  
     
  test "invoke with model name and --timestamps option" do
    content = run_generator %w(Account --timestamps)

    assert_file "app/models/account.rb" do |account|
      assert_class "Account", account do |klass|
        assert_match /timestamps!/, klass
      end
    end
  end  

  test "invoke with model name and --version option" do
    content = run_generator %w(Account --version)

    assert_file "app/models/account.rb" do |account|
      assert_class "Account", account do |klass|
        assert_match /include Versioned/, klass
      end
    end
  end  


  test "invoke with model name and --parent option" do
    content = run_generator %w(Admin --parent User)

    assert_file "app/models/admin.rb" do |account|
      assert_class "Admin", account do |klass| 
        assert_no_match /include MongoMapper::Document/, klass
        assert_match /<\s+User/, klass
      end
    end
  end      
end
