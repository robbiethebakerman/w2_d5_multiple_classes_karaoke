require("minitest/autorun")
require("minitest/rg")
require_relative("../guest")
require_relative("../song")
require_relative("../room")
require_relative("../bar")
require_relative("../drink")

class GuestTest < MiniTest::Test

  def setup
    @song = Song.new("Virus with Shoes")
    @guest_rihanna = Guest.new("Rihanna", 50, @song)
    @guest_kanye = Guest.new("Kanye West", 1, @song)
    @bar = Bar.new
    @room = Room.new("The Attic", 10, @bar)
    @drink_wine = Drink.new("Finest wine in Scotland", 4.00)
  end

  def test_guest_has_name
    assert_equal("Rihanna", @guest_rihanna.name)
  end

  def test_guest_has_money
    assert_equal(50, @guest_rihanna.money)
  end

  def test_guest_has_favourite_song
    assert_equal(@song, @guest_rihanna.fave_song)
  end

  def test_can_afford_entry__true
    assert_equal(true, @guest_rihanna.can_afford_entry())
  end

  def test_can_afford_entry__false
    assert_equal(false, @guest_kanye.can_afford_entry())
  end

  def test_cheer_fave_song__true
    @room.add_song(@song)
    result = @guest_kanye.cheer_fave_song(@room)
    assert_equal("OMG OMG OMG I love this song!", result)
  end

  def test_cheer_fave_song__false
    result = @guest_kanye.cheer_fave_song(@room)
    assert_nil(result)
  end

  def test_buy_drink
    @bar.add_drink(@drink_wine)
    @guest_rihanna.buy_drink(@room, @drink_wine)
    assert_equal(46.00, @guest_rihanna.money)
    assert_equal(4.00, @bar.money)
    assert_equal(0, @bar.drinks.length)
    assert_equal(1, @room.drinks_sold_from_room)
    assert_equal(1, @guest_rihanna.drinks_purchased)
  end

  def test_buy_drink__not_enough_money
    @bar.add_drink(@drink_wine)
    @guest_kanye.buy_drink(@room, @drink_wine)
    assert_equal(1, @guest_kanye.money)
    assert_equal(0, @bar.money)
    assert_equal(1, @bar.drinks.length)
    assert_equal(0, @room.drinks_sold_from_room)
    assert_equal(0, @guest_kanye.drinks_purchased)
  end

  def test_buy_drink__not_enough_money__error_message
    @bar.add_drink(@drink_wine)
    result = @guest_kanye.buy_drink(@room, @drink_wine)
    assert_equal("Kanye West cannot afford the drink. They have £1 and the drink is £4.0.", result)
  end

  def test_buy_drink__drink_not_in_bar
    @guest_rihanna.buy_drink(@room, @drink_wine)
    assert_equal(50, @guest_rihanna.money)
    assert_equal(0, @bar.money)
    assert_equal(0, @bar.drinks.length)
    assert_equal(0, @room.drinks_sold_from_room)
    assert_equal(0, @guest_rihanna.drinks_purchased)
  end

  def test_buy_drink__drink_not_in_bar__error_message
    result = @guest_rihanna.buy_drink(@room, @drink_wine)
    assert_equal("The bar does not have Finest wine in Scotland.", result)
  end

end
