require 'test_helper'

class <%= class_name %>Test < Test::Unit::TestCase
  should "be valid" do
    assert <%= class_name %>.new.valid?
  end
end
