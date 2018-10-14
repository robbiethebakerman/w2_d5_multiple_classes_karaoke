require("minitest/autorun")
require("minitest/rg")
require_relative("../room")
require_relative("../guest")
require_relative("../song")
require_relative("../bar")

class BarTest < MiniTest::Test

  def setup
    @bar = Bar.new
  end

  def test_create_bar
    assert_equal(Bar, @bar.class)
  end

  def test_get_bar_money
    assert_equal(0, @bar.money)
  end

end
