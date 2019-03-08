require("minitest/autorun")
require('minitest/rg')
require_relative("../guest")
require_relative("../room")
class GuestTest < MiniTest::Test

  def setup
    @guest = Guest.new("Dan", 50.00, "Would?")

  end

  def test_guest_has_name
    assert_equal("Dan", @guest.name())
  end
  def test_guest_has_money
    assert_equal(50.00, @guest.money())
  end
  def test_guest_has_fav_song
    assert_equal("Would?", @guest.fav_song())
  end

  #
  def test_guest_can_pay_fee?()
  room = Room.new("RockBar", [], [])
  assert_equal(true, @guest.guest_can_pay_fee?(room))
  end

end
