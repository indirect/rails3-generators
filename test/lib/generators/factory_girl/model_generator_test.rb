require 'test_helper'

class FactoryGirl::Generators::ModelGeneratorTest < Rails::Generators::TestCase
  destination File.join(Rails.root)
  tests Rails::Generators::ModelGenerator
  arguments %w(Account name:string age:integer -r factory_girl)

  setup :prepare_destination
  setup :copy_routes

  test "invoke when fixture replacement is given" do
    run_generator
    assert_file "test/factories/accounts.rb"
    assert_no_file "test/fixtures/accounts.yml"
  end

  test "invoke when fixture replacement is given with custom dir" do
    content = run_generator %w(Account name:string age:integer -r factory_girl --dir custom/factories)
    assert_file "custom/factories/accounts.rb"
    assert_no_file "test/fixtures/accounts.yml"
  end
end
