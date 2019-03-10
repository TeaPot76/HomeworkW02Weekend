require("minitest/autorun")
require('minitest/rg')
require_relative("../song")
require_relative("../room")

class SongTest < MiniTest::Test

  def setup
    @song = Song.new("Would?", "Alice in Chains")
  end

  def test_song_has_title
    assert_equal("Would?", @song.title())
  end

  def test_song_has_performer
    assert_equal("Alice in Chains", @song.performer())
  end
end
