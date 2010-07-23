require 'test_helper'
require 'lib/generators/mongoid/testing_helper'

class Mongoid::Generators::ModelGeneratorTest < Rails::Generators::TestCase
  destination File.join(Rails.root)
  tests Mongoid::Generators::ModelGenerator

  setup :prepare_destination
  setup :copy_routes

  test "invoke with model name" do
    content = run_generator %w(Account)

    assert_file "app/models/account.rb" do |account|
      assert_class "Account", account do |klass|
        assert_match /Mongoid::Document/, klass
      end
    end
  end
  
  test "invoke with model name and attributes" do
    content = run_generator %w(Account name:string age:integer)

    assert_file "app/models/account.rb" do |account|
      assert_class "Account", account do |klass|
        assert_match /field :name, :type => String/, klass
        assert_match /field :age, :type => Integer/, klass        
      end
    end
  end  
  
  test "invoke with model name and --embedded_in option" do
    content = run_generator %w(Room --embedded-in House)

    assert_file "app/models/room.rb" do |account|
      assert_class "Room", account do |klass|
        assert_match /embedded_in :house, :inverse_of => :rooms/, klass
      end
    end
  end  
     
  test "invoke with model name and --timestamps option" do
    content = run_generator %w(Account --timestamps)

    assert_file "app/models/account.rb" do |account|
      assert_class "Account", account do |klass|
        assert_match /include Mongoid::Timestamps/, klass
      end
    end
  end  

  test "invoke with model name and --version option" do
    content = run_generator %w(Account --version)

    assert_file "app/models/account.rb" do |account|
      assert_class "Account", account do |klass|
        assert_match /include Mongoid::Versioning/, klass
      end
    end
  end  

  test "invoke with model name and --parent option" do
    content = run_generator %w(Admin --parent User)

    assert_file "app/models/admin.rb" do |account|
      assert_class "Admin", account do |klass|
        assert_no_match /Mongoid::Document/, klass
        assert_match /<\s+User/, klass
      end
    end
  end
end
