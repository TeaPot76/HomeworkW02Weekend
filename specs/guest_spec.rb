require("minitest/autorun")
require('minitest/rg')
require_relative("../guest")
require_relative("../room")
require_relative("../caraokeroom")
class GuestTest < MiniTest::Test

  def setup
    @guest = Guest.new("Dan", 50.00, "Would?", 22)
    @drinks = ["wine", "beer"]
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

  def test_guest_has_age?
    assert_equal(22, @guest.age())
  end

  #
  def test_guest_can_pay_fee?()
  caraokeroom = Caraokeroom.new("RockBar", [], 10, [])
  assert_equal(true, @guest.guest_can_pay_fee?(caraokeroom))
  end

  def test_default_fav_drink()

    assert_equal(nil, @guest.fav_drink())
  end

  def test_fav_drink()
    @guest.fav_drink = "beer"
    assert_equal("beer", @guest.fav_drink())
  end


end
