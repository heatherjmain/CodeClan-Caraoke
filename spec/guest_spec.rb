require("minitest/autorun")
require("minitest/rg")
require_relative("../guest")

class TestGuest < MiniTest::Test

  def setup
    @guest_1 = Guest.new("Susie")
    @guest_2 = Guest.new("Tom")
    @guest_3 = Guest.new("John")
    @guest_4 = Guest.new("Sarah")
  end

  def test_guests
    assert_equal("Susie", @guest_1.name)
    assert_equal("Tom", @guest_2.name)
    assert_equal("John", @guest_3.name)
    assert_equal("Sarah", @guest_4.name)
  end



end
