require 'test_helper'

class SimpleForm::Generators::FormBuilderGeneratorTest < Rails::Generators::TestCase
  destination File.join(Rails.root)
  tests Rails::Generators::ScaffoldGenerator

  setup :prepare_destination
  setup :copy_routes

  test "should invoke form builder and output haml form" do
    run_generator %w(product_line title:string price:integer --template-engine haml --form-builder simple_form)
    assert_file "app/views/product_lines/_form.html.haml"
  end

  test "should invoke form builder and output erubis form" do
    run_generator %w(product_line title:string price:integer --template-engine erubis --form-builder simple_form)
    assert_file "app/views/product_lines/_form.html.erb"
  end
end
