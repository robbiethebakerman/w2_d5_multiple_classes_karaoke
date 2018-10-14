require("minitest/autorun")
require("minitest/rg")
require_relative("../room")
require_relative("../guest")
require_relative("../song")
require_relative("../bar")
require_relative("../drink")

class DrinkTest < MiniTest::Test

  def setup
    @drink_guiness = Drink.new("Guiness", 3.50)
  end

  def test_drink_has_type
    assert_equal("Guiness", @drink_guiness.type)
  end

  def test_drink_has_cost
    assert_equal(3.50, @drink_guiness.cost)
  end

end
