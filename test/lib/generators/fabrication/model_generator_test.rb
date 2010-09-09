require 'test_helper'

class Fabrication::Generators::ModelGeneratorTest < Rails::Generators::TestCase
  destination File.join(Rails.root)
  tests Rails::Generators::ModelGenerator
  arguments %w(Account name:string age:integer -r fabrication)

  setup :prepare_destination
  setup :copy_routes

  test "invoke when fixture replacement is given" do
    run_generator
    assert_file "test/fabricators/accounts.rb"
    assert_no_file "test/fixtures/accounts.yml"
  end

  test "invoke when fixture replacement is given with custom dir" do
    content = run_generator %w(Account name:string age:integer -r fabrication --dir custom/fabricators)
    assert_file "custom/fabricators/accounts.rb"
    assert_no_file "test/fixtures/accounts.yml"
  end
end
