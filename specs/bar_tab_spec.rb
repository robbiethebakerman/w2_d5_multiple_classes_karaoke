require("minitest/autorun")
require("minitest/rg")
require_relative("../room")
require_relative("../guest")
require_relative("../song")
require_relative("../bar_tab")

class BarTabTest < MiniTest::Test

  def setup
    @room_dungeon = Room.new("The Dungeon", 4)
    @bar_tab_dungeon = BarTab.new(@room_dungeon)
  end

  def test_bar_tab_has_room
    assert_equal(@room_dungeon, @bar_tab_dungeon.room)
  end

end
