require("minitest/autorun")
require("minitest/rg")
require_relative("../takings")

class TestTakings < MiniTest::Test

  def setup
    @ticket_takings = Takings.new(0, 0)
    @bar_takings = Takings.new(0, 0)
  end


  def test_ticket_takings
    assert_equal(0, @ticket_takings.room_1())
    assert_equal(0, @ticket_takings.room_2())
  end

  def test_bar_takings
    assert_equal(0, @bar_takings.room_1())
    assert_equal(0, @bar_takings.room_2())
  end


end
