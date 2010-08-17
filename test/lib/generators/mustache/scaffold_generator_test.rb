require 'test_helper'
require 'lib/generators/mustache/testing_helper'

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
  
  test "should generate a form partial mustache template" do
    run_generator
    assert_file "app/templates/product_lines/_form.html.mustache"
  end
  
  test "should generate mustache templates for each action" do
    run_generator
    %w(index edit new show).each { |view| assert_file "app/templates/product_lines/#{view}.html.mustache" }
  end
  
  ### SHOW
  
  test "should place methods for each attribute in the show view" do
    run_generator
    assert_file "app/views/product_lines/show.rb",
                %r(def title)
    assert_file "app/views/product_lines/show.rb",
                %r(def price)
  end

  test "should place methods for edit path and index path in the show view" do
    run_generator
    assert_file "app/views/product_lines/show.rb",
                %r(def edit_path)
    assert_file "app/views/product_lines/show.rb",
                %r(def index_path)
  end
  
  test "should place attribute tags in the mustache template for show action" do
    run_generator
    assert_file "app/templates/product_lines/show.html.mustache",
                %r(\{\{title\}\})
    assert_file "app/templates/product_lines/show.html.mustache",
                %r(\{\{price\}\})
  end
  
  test "should place tags for edit path and index path in the mustache template for show action" do
    run_generator
    assert_file "app/templates/product_lines/show.html.mustache",
                %r(\{\{edit_path\}\})
    assert_file "app/templates/product_lines/show.html.mustache",
                %r(\{\{index_path\}\})
  end
  
  ### INDEX
  
  test "should place methods for listing each item in the index view" do
    run_generator
    assert_file "app/views/product_lines/index.rb",
                %r(def listing)
  end

  test "should place methods for new path in the index view" do
    run_generator
    assert_file "app/views/product_lines/index.rb",
                %r(def new_path)
  end
  
  test "should place 'listing' loop tags in the mustache template for index action" do
    run_generator
    assert_file "app/templates/product_lines/index.html.mustache",
                %r(\{\{#listing\}\})
    assert_file "app/templates/product_lines/index.html.mustache",
                %r(\{\{/listing\}\})
  end
  
  test "should place a tag for each attribute in the mustache template for index action" do
    run_generator
    assert_file "app/templates/product_lines/index.html.mustache",
                %r(\{\{title\}\})
    assert_file "app/templates/product_lines/index.html.mustache",
                %r(\{\{price\}\})
  end
  
  test "should place a tag for the item's show link the mustache template for index action" do
    run_generator
    assert_file "app/templates/product_lines/index.html.mustache",
                %r(\{\{show_path\}\})
  end
  
  test "should place a tag for a new index link the mustache template for index action" do
    run_generator
    assert_file "app/templates/product_lines/index.html.mustache",
                %r(\{\{new_path\}\})
  end
  
  
  ### FORM partial
  
  test "should place attribute tags in the mustache template for form partial" do
    run_generator
    assert_file "app/templates/product_lines/_form.html.mustache",
                %r(\{\{title_label\}\})
    assert_file "app/templates/product_lines/_form.html.mustache",
                %r(\{\{title_text_field\}\})
    assert_file "app/templates/product_lines/_form.html.mustache",
                %r(\{\{price_text_field\}\})
    assert_file "app/templates/product_lines/_form.html.mustache",
                %r(\{\{price_label\}\})
  end
  
  
  ### NEW
  
  test "should place a method that returns a form tag to create item" do
    run_generator
    assert_file "app/views/product_lines/new.rb",
                %r(def product_line_form_tag\s*form_tag\(create_path,)
  end
  
  test "should place label and form input methods for each item attribute in the new view" do
    run_generator
    assert_file "app/views/product_lines/new.rb",
                %r(def title_label)
    assert_file "app/views/product_lines/new.rb",
                %r(def title_text_field)
    assert_file "app/views/product_lines/new.rb",
                %r(def price_label)
    assert_file "app/views/product_lines/new.rb",
                %r(def price_text_field)
  end

  test "should place methods for create path and index path in the new view" do
    run_generator
    assert_file "app/views/product_lines/new.rb",
                %r(def index_path)
    assert_file "app/views/product_lines/new.rb",
                %r(def create_path)
  end
  
  
  test "should place a new form tag in the mustache template for new action" do
    run_generator
    assert_file "app/templates/product_lines/new.html.mustache",
                %r(\{\{product_line_form_tag\}\})
  end
  
  test "should place tags for index path in the mustache template for new action" do
    run_generator
    assert_file "app/templates/product_lines/new.html.mustache",
                %r(\{\{index_path\}\})
  end


  ### EDIT
  
  test "should place a method that returns a form tag to update item in the edit view" do
    run_generator
    assert_file "app/views/product_lines/edit.rb",
                %r(def product_line_form_tag\s*form_tag\(update_path,)
  end
  
  test "should place label and form input methods for each item attribute in the edit view" do
    run_generator
    assert_file "app/views/product_lines/edit.rb",
                %r(def title_label)
    assert_file "app/views/product_lines/edit.rb",
                %r(def title_text_field)
    assert_file "app/views/product_lines/edit.rb",
                %r(def price_label)
    assert_file "app/views/product_lines/edit.rb",
                %r(def price_text_field)
  end

  test "should place methods for update path and show path in the edit view" do
    run_generator
    assert_file "app/views/product_lines/edit.rb",
                %r(def show_path)
    assert_file "app/views/product_lines/edit.rb",
                %r(def update_path)
  end
  
  
  test "should place a form tag in the mustache template for edit action" do
    run_generator
    assert_file "app/templates/product_lines/edit.html.mustache",
                %r(\{\{product_line_form_tag\}\})
  end
  
  test "should place tags for show path in the mustache template for edit action" do
    run_generator
    assert_file "app/templates/product_lines/edit.html.mustache",
                %r(\{\{show_path\}\})
  end
  
end

