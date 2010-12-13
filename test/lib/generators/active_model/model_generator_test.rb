require 'test_helper'
require_generator :active_model  => ['model']

class ActiveModel::Generators::ModelGeneratorTest < Rails::Generators::TestCase
  destination File.join(Rails.root)
  tests ActiveModel::Generators::ModelGenerator

  setup :prepare_destination
  setup :copy_routes

  test "invoke with model name" do
    content = run_generator %w(Account)

    assert_file "app/models/account.rb" do |account|
      assert_class "Account", account do |klass|
        assert_match /include ActiveModel::Validations/, klass
        assert_match /include ActiveModel::Serialization/, klass
      end
    end
  end

  test "invoke with model name and accessors" do
    content = run_generator %w(Account name:all age:read color:write )

    assert_file "app/models/account.rb" do |account|
      assert_class "Account", account do |klass|
        assert_match /include ActiveModel::Validations/, klass
        assert_match /include ActiveModel::Serialization/, klass
        assert_match /attr_reader :age/, klass
        assert_match /attr_writer :color/, klass        
        assert_match /attr_accessor :name/, klass        
      end
    end
  end  
end
