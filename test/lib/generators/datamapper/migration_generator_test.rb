require 'test_helper'
require 'lib/generators/datamapper/testing_helper'

class Datamapper::Generators::MigrationGeneratorTest < Rails::Generators::TestCase
  destination File.join(Rails.root)
  tests Datamapper::Generators::MigrationGenerator

  setup :prepare_destination
  setup :copy_routes

  test "invoke with name of migration" do      
    name = 'account'    
    run_generator [name]   
    assert_file "db/migrate/create_#{name}.rb" do |migration|      
      assert_match /up do/, migration      
      assert_match /down do/, migration
      assert_match /modify_table :#{name.tableize}/, migration      
    end
  end
end
