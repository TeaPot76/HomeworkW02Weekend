require("minitest/autorun")
require('minitest/rg')
require_relative("../guest")
require_relative("../drink")
require_relative("../room")
require_relative("../caraokeroom")
class GuestTest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Dan", 50.00, "Would?", 22)
    @guest2 = Guest.new("Bob", 2.00, "Would?", 22)
    @drink1 = Drink.new("Corona", 3.0, 2)
    @drink2 = Drink.new("Malbec", 5.0, 3)
    @drink3 = Drink.new("Coke", 2.0, 0)
    @drink4 = Drink.new("Tequila", 2.50, 2)
  end

  def test_guest_has_name
    assert_equal("Dan", @guest1.name())
  end

  def test_guest_has_money
    assert_equal(50.00, @guest1.money())
  end

  def test_guest_has_fav_song
    assert_equal("Would?", @guest1.fav_song())
  end

  def test_guest_has_age?
    assert_equal(22, @guest1.age())
  end

  def test_guest_can_pay_fee?()
    caraokeroom = Caraokeroom.new("RockBar", [], 10, [])
    assert_equal(true, @guest1.guest_can_pay_fee?(caraokeroom))
  end

  def test_guest_can_afford_drink?()
      assert_equal(true, @guest1.guest_can_afford_drink?(@drink1))
  end

  def test_guest_can_afford_drink?()
      assert_equal(false, @guest2.guest_can_afford_drink?(@drink1))
  end

  def test_buy_drink()
    @guest1.buy_drink(@drink2)
    @guest1.buy_drink(@drink2)
    @guest1.buy_drink(@drink2)
    @guest1.buy_drink(@drink2)
    @guest1.buy_drink(@drink2)
    @guest1.buy_drink(@drink2)
    @guest1.buy_drink(@drink2)
    assert_equal(15.0, @guest1.money())
  end

  def test_guest_bladder_fulness
    assert_equal(0, @guest1.bladder_fulness())
  end

  def test_guest_bladder_fulness__after_drink
    @guest1.buy_drink(@drink1)
    @guest1.buy_drink(@drink2)
    @guest1.buy_drink(@drink3)
    assert_equal(5, @guest1.bladder_fulness())
  end

end
