require("minitest/autorun")
require("minitest/rg")
require_relative("../room")
require_relative("../guest")
require_relative("../song")

class TestRoom < MiniTest::Test

  def setup
    @room_1 = Room.new(1, 5, [], [])
    @room_2 = Room.new(2, 10, [], [])
  end

  def test_room_1
    assert_equal(1, @room_1.number())
    assert_equal(5, @room_1.capacity())
    assert_equal([], @room_1.singers())
    assert_equal([], @room_1.playlist())
  end

  def test_room_2
    assert_equal(2, @room_2.number())
    assert_equal(10, @room_2.capacity())
    assert_equal([], @room_2.singers())
    assert_equal([], @room_2.playlist())
  end


  def test_add_singer__1
    # arrange
    guest = Guest.new("Susie")
    # act
    @room_1.add_singer(guest)
    # assert
    assert_equal("Susie", @room_1.singers()[0].name)
  end

  def test_add_singer__2
    # arrange
    guest_1 = Guest.new("Susie")
    guest_2 = Guest.new("Tom")
    # act
    @room_1.add_singer(guest_1)
    @room_1.add_singer(guest_2)
    # assert
    # assert
    assert_equal("Susie", @room_1.singers()[0].name)
    assert_equal("Tom", @room_1.singers()[1].name)
  end


  def test_remove_guest
    guest_1 = Guest.new("Susie")
    guest_2 = Guest.new("Tom")

    @room_1.add_singer(guest_1)
    @room_1.add_singer(guest_2)

    @room_1.remove_singer(guest_1)
    assert_equal("Tom", @room_1.singers()[0].name)
  end

  def test_everyone_go_home
    guest_1 = Guest.new("Susie")
    guest_2 = Guest.new("Tom")

    @room_1.add_singer(guest_1)
    @room_1.add_singer(guest_2)

    @room_1.empty_room()
    assert_equal([], @room_1.singers())
  end


  def test_add_song__1
    song_1 = Song.new("I Will Survive", "Gloria Gaynor")
    @room_1.add_song(song_1)
    assert_equal(1, @room_1.playlist.length())
  end

  def test_add_song__2
    song_1 = Song.new("I Will Survive", "Gloria Gaynor")
    song_2 = Song.new("Son of a Preacher Man", "Dusty Springfield")

    @room_1.add_song(song_1)
    @room_1.add_song(song_2)
    assert_equal(2, @room_1.playlist.length())
  end

  def remove_song
    song_1 = Song.new("I Will Survive", "Gloria Gaynor")
    song_2 = Song.new("Son of a Preacher Man", "Dusty Springfield")

    @room_1.add_song(song_1)
    @room_1.add_song(song_2)

    @room_1.remove.song(song_1)
    assert_equal(1, @room_1.playlist().length())
  end


end
