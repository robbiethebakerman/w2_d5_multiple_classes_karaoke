require("minitest/autorun")
require("minitest/rg")
require_relative("../song")

class SongTest < MiniTest::Test

  def setup
    @song = Song.new("Deanna")
  end

  def test_song_has_title
    assert_equal("Deanna", @song.title)
  end

end
