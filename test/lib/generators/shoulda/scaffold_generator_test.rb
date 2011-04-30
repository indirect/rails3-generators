require 'test_helper'

class Shoulda::Generators::ScaffoldGeneratorTest < Rails::Generators::TestCase
  destination File.join(Rails.root)
  tests Rails::Generators::ScaffoldGenerator
  arguments %w(accounts --test-framework shoulda)

  setup :prepare_destination
  setup :copy_routes

  test "should invoke test framework" do
    run_generator
    assert_file "test/functional/accounts_controller_test.rb"
  end

  test "should create test class" do
    run_generator
    assert_file "test/functional/accounts_controller_test.rb" do |controller_test|
      assert_class "AccountsControllerTest", controller_test
    end
  end

  test "should create controller action tests" do
    run_generator
    assert_file "test/functional/accounts_controller_test.rb" do |controller_test|
      assert_class "AccountsControllerTest", controller_test do |klass|
        assert_match /context "index action"/, klass
        assert_match /context "show action"/, klass
        assert_match /context "new action"/, klass
        assert_match /context "create action"/, klass
        assert_match /context "edit action"/, klass
        assert_match /context "update action"/, klass
        assert_match /context "destroy action"/, klass
      end
    end
  end
end
