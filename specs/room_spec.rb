require("minitest/autorun")
require("minitest/rg")
require_relative("../room")
require_relative("../guest")
require_relative("../song")

class RoomTest < MiniTest::Test

  def setup
    @song_born_to_run = Song.new("Born to Run")
    @song_hey_ya = Song.new("Hey Ya")
    @guest_bruce = Guest.new("Bruce Springsteen", 100, @song_hey_ya)
    @guest_usain = Guest.new("Usain Bolt", 2, @song_born_to_run)
    @room_dungeon = Room.new("Dungeon", 5)
    @room_closet = Room.new("Closet", 1)
  end

  def test_room_has_name
    assert_equal("Dungeon", @room_dungeon.name)
  end

  def test_room_has_capacity
    assert_equal(1, @room_closet.capacity)
  end

  def test_add_song
    @room_closet.add_song(@song_hey_ya)
    assert_equal(1, @room_closet.songs.length)
  end

end
