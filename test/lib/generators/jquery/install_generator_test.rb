require 'test_helper'

class Jquery::Generators::InstallGeneratorTest < Rails::Generators::TestCase
  destination File.join(Rails.root)
  tests Jquery::Generators::InstallGenerator
  arguments []

  setup :prepare_destination

  test 'jquery is installed' do
    run_generator

    %w(jquery.js rails.js).each { |js| assert_file "public/javascripts/#{js}" }
    %w(controls.js dragdrop.js effects.js prototype.js).each { |js| assert_no_file "public/javascripts/#{js}" }
  end
  
  test 'jquery is installed with jqueyui' do
    run_generator %w(--ui)

    %w(jquery.js jqueryui.js rails.js).each { |js| assert_file "public/javascripts/#{js}" }
    %w(controls.js dragdrop.js effects.js prototype.js).each { |js| assert_no_file "public/javascripts/#{js}" }
  end
end
