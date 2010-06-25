require 'test_helper'

class Mustache::Generators::ScaffoldGeneratorTest < Rails::Generators::TestCase
  destination File.join(Rails.root)
  tests Rails::Generators::ScaffoldGenerator
  arguments %w(product_line title:string price:integer --template-engine mustache)

  setup :prepare_destination
  setup :copy_routes

  test "should generate mustache views for each action" do
    run_generator
    %w(index edit new show).each { |view| assert_file "app/views/product_lines/#{view}.rb" }
  end
  
  test "should generate mustache templates for each action" do
    run_generator
    %w(index edit new show).each { |view| assert_file "app/templates/product_lines/#{view}.html.mustache" }
  end
  
  test "should place attribute tags in the mustache template for show action" do
    run_generator
    assert_file "app/templates/product_lines/show.html.mustache",
                %r({{title}})
    assert_file "app/templates/product_lines/show.html.mustache",
                %r({{price}})
  end
  
  test "should place 'listing' loop tags in the mustache template for index action" do
    run_generator
    assert_file "app/templates/product_lines/index.html.mustache",
                %r({{#listing}})
    assert_file "app/templates/product_lines/index.html.mustache",
                %r({{/listing}})
  end
  
end

