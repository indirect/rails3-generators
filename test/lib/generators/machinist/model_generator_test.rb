require 'test_helper'

class Machinist::Generators::ModelGeneratorTest < Rails::Generators::TestCase
  destination File.join(Rails.root)
  tests Rails::Generators::ModelGenerator
  arguments %w(Account name:string age:integer -r machinist)

  setup :prepare_destination
  setup :copy_routes

  test "invoke when fixture replacement is given" do
    run_generator
    assert_file "test/blueprints/accounts.rb"
    assert_file "config/initializers/machinist.rb"
    assert_no_file "test/fixtures/accounts.yml"
  end

  test "invoke when fixture replacement is given with custom dir" do
    content = run_generator %w(Account name:string age:integer -r machinist --dir custom/blueprints)
    assert_file "custom/blueprints/accounts.rb"
    assert_file "config/initializers/machinist.rb"
    assert_no_file "test/fixtures/accounts.yml"
  end
  
  test "invoke when fixture replacement is given with custom file extenstion" do
    content = run_generator %w(Account name:string age:integer -r machinist --extension i.like.using.blueprint)
    assert_file "test/blueprints/accounts.i.like.using.blueprint"
  end
end
