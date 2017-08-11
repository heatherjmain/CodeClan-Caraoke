require("minitest/autorun")
require("minitest/rg")
require_relative("../song")

class TestSong < MiniTest::Test

  def setup
    @song_1 = Song.new("I Will Survive", "Gloria Gaynor")
    @song_2 = Song.new("Son of a Preacher Man", "Dusty Springfield")
  end

  def test_song_1
    assert_equal("I Will Survive", @song_1.title())
    assert_equal("Gloria Gaynor", @song_1.artist())
  end

  def test_song_2
    assert_equal("Son of a Preacher Man", @song_2.title())
    assert_equal("Dusty Springfield", @song_2.artist())
  end

end
