require 'test_helper'

class Authlogic::Generators::SessionGeneratorTest < Rails::Generators::TestCase
  destination File.join(Rails.root)
  tests Authlogic::Generators::SessionGenerator
  arguments %w(user_session)

  setup :prepare_destination

  test 'Authlogic is installed' do
    content = run_generator
    assert_file "app/models/user_session.rb"
  end
end
