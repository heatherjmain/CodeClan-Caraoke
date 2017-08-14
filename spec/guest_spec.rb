require("minitest/autorun")
require("minitest/rg")
require_relative("../guest")

class TestGuest < MiniTest::Test

  def setup
    @guest_1 = Guest.new("Susie", 10)
    @guest_2 = Guest.new("Tom", 20)
    @guest_3 = Guest.new("John", 30)
    @guest_4 = Guest.new("Sarah", 40)
    @guest_5 = Guest.new("Adam", 50)
    @guest_6 = Guest.new("Louise", 60)
    @guest_7 = Guest.new("Sam", 3)
  end

  def test_guests
    assert_equal("Susie", @guest_1.name)
    assert_equal("Tom", @guest_2.name)
    assert_equal("John", @guest_3.name)
    assert_equal("Sarah", @guest_4.name)
  end

  def test_fund_available
    assert_equal(10, @guest_1.funds())
  end



end
