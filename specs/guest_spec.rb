require("minitest/autorun")
require("minitest/rg")
require_relative("../guest")
require_relative("../song")
require_relative("../room")
require_relative("../bar")

class GuestTest < MiniTest::Test

  def setup
    @song = Song.new("Virus with Shoes")
    @guest_rihanna = Guest.new("Rihanna", 50, @song)
    @guest_kanye = Guest.new("Kanye West", 0, @song)
    @bar = Bar.new
    @room = Room.new("The Attic", 10, @bar)
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

end
