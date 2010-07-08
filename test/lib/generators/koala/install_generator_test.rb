require 'test_helper'

class Koala::Generators::InstallGeneratorTest < Rails::Generators::TestCase
  destination File.join(Rails.root)
  tests Koala::Generators::InstallGenerator
  arguments []

  setup :prepare_destination

  test 'Koala is installed' do
    run_generator

    assert_file "config/facebook.yml"
    assert_file "config/initializers/koala.rb"
    assert_file "app/helpers/facebook_helper.rb"
  end
end
