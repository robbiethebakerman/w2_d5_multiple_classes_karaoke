require("minitest/autorun")
require("minitest/rg")
require_relative("../room")
require_relative("../guest")
require_relative("../song")
require_relative("../bar")

class RoomTest < MiniTest::Test

  def setup
    @song_born_to_run = Song.new("Born to Run")
    @song_hey_ya = Song.new("Hey Ya")
    @guest_bruce = Guest.new("Bruce Springsteen", 100, @song_hey_ya)
    @guest_usain = Guest.new("Usain Bolt", 2, @song_born_to_run)
    @guest_kate = Guest.new("Kate Bush", 10, @song_hey_ya)
    @bar = Bar.new()
    @room_dungeon = Room.new("Dungeon", 5, @bar)
    @room_closet = Room.new("Closet", 1, @bar)
  end

  def test_room_has_name
    assert_equal("Dungeon", @room_dungeon.name)
  end

  def test_room_has_capacity
    assert_equal(1, @room_closet.capacity)
  end

  def test_room_has_bar
    assert_equal(@bar, @room_closet.bar)
  end

  def test_add_song
    @room_closet.add_song(@song_hey_ya)
    assert_equal(1, @room_closet.songs.length)
  end

  def test_check_in
    @room_dungeon.check_in(@guest_bruce)
    assert_equal(1, @room_dungeon.guests.length)
    assert_equal(95, @guest_bruce.money)
  end

  def test_check_in__fails__cannot_afford_entry_fee
    @room_dungeon.check_in(@guest_usain)
    assert_equal(0, @room_dungeon.guests.length)
  end

  def test_check_in__fails__cannot_afford_entry_fee__error_msg
    result = @room_dungeon.check_in(@guest_usain)
    assert_equal("Guest cannot be checked in. Guest cannot afford entry. Guest has £2, which is less than the entry fee of £5.", result)
  end

  def test_check_in__fails__room_full
    @room_closet.check_in(@guest_bruce)
    @room_closet.check_in(@guest_kate)
    assert_equal([@guest_bruce], @room_closet.guests)
  end

  def test_check_in__fails__room_full__error_msg
    @room_closet.check_in(@guest_bruce)
    result = @room_closet.check_in(@guest_kate)
    assert_equal("Guest cannot be checked in. Room has reached its maximum capacity of 1. No more guests can be checked in until one is removed.", result)
  end

  def test_check_out
    @room_dungeon.check_in(@guest_bruce)
    @room_dungeon.check_out(@guest_bruce)
    assert_equal(0, @room_dungeon.guests.length)
  end

end
