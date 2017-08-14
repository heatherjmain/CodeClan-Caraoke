require("minitest/autorun")
require("minitest/rg")
require_relative("../room")
require_relative("../guest")
require_relative("../song")


class TestRoom < MiniTest::Test

  def setup
    #Rooms
    @room_1 = Room.new(1, 5, [], [], 5, 0)
    @room_2 = Room.new(2, 10, [], [], 10, 0)

    #Guests
    @guest_1 = Guest.new("Susie", 10)
    @guest_2 = Guest.new("Tom", 20)
    @guest_3 = Guest.new("John", 30)
    @guest_4 = Guest.new("Sarah", 40)
    @guest_5 = Guest.new("Adam", 50)
    @guest_6 = Guest.new("Louise", 60)
    @guest_7 = Guest.new("Sam", 3)

    #Songs
    @song_1 = Song.new("I Will Survive", "Gloria Gaynor")
    @song_2 = Song.new("Son of a Preacher Man", "Dusty Springfield")
  end

  def test_room_1
    assert_equal(1, @room_1.number())
    assert_equal(5, @room_1.capacity())
    assert_equal([], @room_1.singers())
    assert_equal([], @room_1.playlist())
    assert_equal(5, @room_1.ticket_price())
  end

  def test_room_2
    assert_equal(2, @room_2.number())
    assert_equal(10, @room_2.capacity())
    assert_equal([], @room_2.singers())
    assert_equal([], @room_2.playlist())
    assert_equal(10, @room_2.ticket_price())
  end


  def test_add_singer__1
    # arrange
    # act
    @room_1.add_singer(@guest_1)
    # assert
    assert_equal("Susie", @room_1.singers()[0].name)
  end

  def test_add_singer__2
    # arrange
    # act
    @room_1.add_singer(@guest_1)
    @room_1.add_singer(@guest_2)
    # assert
    assert_equal("Susie", @room_1.singers()[0].name)
    assert_equal("Tom", @room_1.singers()[1].name)
  end


  def test_remove_guest
    @room_1.add_singer(@guest_1)
    @room_1.add_singer(@guest_2)

    @room_1.remove_singer(@guest_1)
    assert_equal("Tom", @room_1.singers()[0].name)
  end

  def test_everyone_go_home
    @room_1.add_singer(@guest_1)
    @room_1.add_singer(@guest_2)

    @room_1.empty_room()
    assert_equal([], @room_1.singers())
  end


  def test_add_song__1
    @room_1.add_song(@song_1)
    assert_equal(1, @room_1.playlist.length())
  end

  def test_add_song__2
    @room_1.add_song(@song_1)
    @room_1.add_song(@song_2)
    assert_equal(2, @room_1.playlist.length())
  end

  def remove_song
    @room_1.add_song(@song_1)
    @room_1.add_song(@song_2)

    @room_1.remove.song(@song_1)
    assert_equal(1, @room_1.playlist().length())
  end


  def test_at_capacity
    @room_1.add_singer(@guest_1)
    @room_1.add_singer(@guest_2)
    @room_1.add_singer(@guest_2)
    @room_1.add_singer(@guest_4)
    @room_1.add_singer(@guest_5)


    assert_equal(5, @room_1.singers().length())
    expected = "I\'m sorry, Room 1 is full at the moment.   Please try later."
    assert_equal(expected, @room_1.add_singer(@guest_6))
  end


  def test_insufficient_funds
    expected = "I\'m sorry.  Entry costs £5.  You do not have enough money!"
    assert_equal(expected, @room_1.add_singer(@guest_7))
  end


  def test_ticket_price_paid
    @room_1.add_singer(@guest_1)
    guest_funds = 5
    ticket_takings = 5
    assert_equal(guest_funds, @room_1.singers()[0].funds())
    assert_equal(ticket_takings, @room_1.takings())

  end


end
