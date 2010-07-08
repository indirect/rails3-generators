require 'test_helper'

class Haml::Generators::InstallGeneratorTest < Rails::Generators::TestCase
  destination File.join(Rails.root)
  tests Haml::Generators::InstallGenerator
  arguments []

  setup :prepare_destination

  test 'haml is installed' do
    run_generator

    assert_file "config/initializers/haml.rb"
  end
end
