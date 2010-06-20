require 'test_helper'

class Jquery::Generators::InstallGeneratorTest < Rails::Generators::TestCase
  destination File.join(Rails.root)
  tests Jquery::Generators::InstallGenerator
  arguments []

  setup :prepare_destination

  test 'jquery is installed' do
    run_generator

    assert_file "config/initializers/jquery.rb"
    %w(jquery.js rails.js).each { |js| assert_file "public/javascripts/#{js}" }
    %w(controls.js dragdrop.js effects.js prototype.js).each { |js| assert_no_file "public/javascripts/#{js}" }
  end
end
