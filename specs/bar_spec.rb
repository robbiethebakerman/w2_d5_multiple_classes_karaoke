require("minitest/autorun")
require("minitest/rg")
require_relative("../room")
require_relative("../guest")
require_relative("../song")
require_relative("../bar")
require_relative("../drink")

class BarTest < MiniTest::Test

  def setup
    @bar = Bar.new
    @drink_white_russian = Drink.new("White Russian", 6.00)
  end

  def test_create_bar
    assert_equal(Bar, @bar.class)
  end

  def test_get_bar_money
    assert_equal(0, @bar.money)
  end

  def test_add_drink
    @bar.add_drink(@drink_white_russian)
    assert_equal(1, @bar.drinks.length)
  end

  def test_add_money
    @bar.add_money(4)
    assert_equal(4, @bar.money)
  end

  def test_remove_drink
    @bar.add_drink(@drink_white_russian)
    @bar.remove_drink(@drink_white_russian)
    assert_equal(0, @bar.drinks.length)
  end

end
