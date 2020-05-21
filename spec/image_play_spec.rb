require 'spec_helper'
require 'minitest/autorun'

class InitializeTest < Minitest::Test
  def test_returns_a_path
    assert ImagePlay::Image.initialize("Whatever!") !=nil
  end
end



