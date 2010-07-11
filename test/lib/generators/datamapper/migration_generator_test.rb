require 'test_helper'
require 'rake'
require 'lib/generators/datamapper/testing_helper'

class Datamapper::Generators::MigrationGeneratorTest < Rails::Generators::TestCase
  destination File.join(Rails.root)
  tests Datamapper::Generators::MigrationGenerator

  setup :prepare_destination
  setup :copy_routes

  test "invoke with name of migration" do      
    name = 'account'    
    run_generator %w{Account}    
    migration_name = FileList[File.join(Rails.root, "db/migrate/*_#{name}.rb")].first
    if migration_name
      assert_file migration_name do |migration|      
        assert_match /up do/, migration      
        assert_match /down do/, migration
      end
    else
      fail "No migration generated for #{name}"
    end
  end

  test "invoke with name and attributes" do      
    name = 'account'    
    run_generator %w{Account name:string}    
    migration_name = FileList[File.join(Rails.root, "db/migrate/*_#{name}.rb")].first
    if migration_name
      assert_file migration_name do |migration|      
        assert_match /up do/, migration      
        assert_match /down do/, migration
        assert_match /modify_table :#{name.tableize}/, migration      
      end
    else
      fail "No migration generated for #{name}"
    end
  end

end
