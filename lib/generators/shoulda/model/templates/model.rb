require 'test_helper'

class <%= singular_name %>Test < Test::Unit::TestCase
  should "be valid" do
    assert <%= singular_name %>.new.valid?
  end
end
