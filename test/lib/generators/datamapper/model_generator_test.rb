require 'test_helper'

class Datamapper::Generators::ModelGeneratorTest < Rails::Generators::TestCase
  destination File.join(Rails.root)
  tests Datamapper::Generators::ModelGenerator

  setup :prepare_destination
  setup :copy_routes

  test "invoke with no arguments" do
    run_generator
  end

  test "invoke with model name" do
    content = run_generator %w(Account)

    assert_file "app/models/account.rb" do |account|
      assert_class "Account", account do |klass|
        assert_match /include DataMapper::Resource/, klass
        assert_match /property :id, Serial/, klass        
      end
    end
  end

  test "invoke with model name and attributes" do
    content = run_generator %w(Account name:string age:integer)

    assert_file "app/models/account.rb" do |account|
      assert_class "Account", account do |klass|
        assert_match /property :name, String/, klass
        assert_match /property :age, Integer/, klass        
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

  test "invoke with model name and --parent option" do
    content = run_generator %w(Admin --parent User)

    assert_file "app/models/admin.rb" do |account|
      assert_class "Admin", account do |klass|
        assert_no_match /property :id, Serial/, klass
        assert_match /\s+<\s+User/, klass        
      end
    end
  end
end
