require("minitest/autorun")
require('minitest/rg')
require_relative("../barroom")
require_relative("../room")
require_relative("../drink")
require_relative("../song")
require_relative("../guest")
require_relative("../caraokeroom")

class BarroomTest < MiniTest::Test

  def setup

    @song1 = Song.new("Would?", "Alice in Chains")
    @guest1 = Guest.new("Dan", 50.00, "Would?", 22)
    @guest2 = Guest.new("Bob", 40.00, "Iron Man", 23)
    @guest3 = Guest.new("Eddie", 100.00, "About the Girl", 24)
    @guest4 = Guest.new("Luca", 0.00, "Whisky in the Jar", 25)
    list = [@song1, @song2, @song3, @song4]
    guests = [@guest1, @guest2, @guest3, @guest4]

    @drink1 = Drink.new("Corona", 3.0, 8)
    @drink2 = Drink.new("Malbec", 5.0, 3)
    @drink3 = Drink.new("Coke", 2.0, 0)
    @drink4 = Drink.new("Tequila", 2.50, 2)
    @drink5 = Drink.new("Whisky", 2.50, 2)
    drinks =[ @drink1, @drink2, @drink3, @drink4]
    @barroom = Barroom.new("DrinkingPad", guests, drinks)
    @guest5 = Guest.new("Zita", 70.00, "BlaBla", 17)
    @guest6 = Guest.new("Bob", 70.00, "BlaBla", 28)
    guests2 = [@guest1, @guest2, @guest3, @guest4, @guest5, @guest6]
  end

  def test_room_has_name
    assert_equal("DrinkingPad", @barroom.name())
  end

  def test_room_number_of_guests
    assert_equal(4, @barroom.number_of_guests())
  end

  def test_bar_has_till
    assert_equal(200.00, @barroom.till())
  end

  def test_bar_has_drinking_age
    assert_equal(18, @barroom.drinking_age())
  end

  def test_amount_of_drinks
    assert_equal(4, @barroom.amount_of_drinks)
  end

  def test_serve_drink__till_increase()
    @barroom.serve_drink(@drink2, @guest2)
    assert_equal(205.00, @barroom.till)
  end

  def test_serve_drink__till_does_not_increase_not_enough_money()
    @barroom.serve_drink(@drink2, @guest4)
    assert_equal(200.00, @barroom.till)
  end

  def test_serve_drink__till_does_not_increase_too_young()
    @barroom.serve_drink(@drink2, @guest5)
    assert_equal(200.00, @barroom.till)
  end

  def test_serve_drink__till_does_not_increase_no_drink()
    @barroom.serve_drink(@drink5, @guest2)
    assert_equal(200.00, @barroom.till)
  end

  def test_serve_drink__include()
    result = @barroom.drinks.include?(@drink2)
    assert_equal(true, result)
  end

  def test_serve_drink__do_not_include()
    result = @barroom.drinks.include?(@drink5)
    assert_equal(false, result)
  end

  def test_add_guest()
      @barroom.add_guest(@guest5)
      assert_equal(5, @barroom.guests.length)
  end

  def test_guest_leave_room_full_bladder__true
    @guest2.buy_drink(@drink1)
    @guest2.buy_drink(@drink1)
    @guest2.buy_drink(@drink1)
    @guest2.buy_drink(@drink1)
    assert_equal(true, @barroom.guests.include?(@guest2))
    @barroom.guest_leave_room_full_bladder(@guest2)
    assert_equal(false, @barroom.guests.include?(@guest2))
  end

  def test_guest_leave_room_full_bladder__false
    @guest2.buy_drink(@drink1)
    @guest2.buy_drink(@drink1)
    assert_equal(true, @barroom.guests.include?(@guest2))
    @barroom.guest_leave_room_full_bladder(@guest2)
    assert_equal(true, @barroom.guests.include?(@guest2))
  end

  def test_room_full__returns_true
      @barroom.add_guest(@guest6)
      @barroom.add_guest(@guest7)
      @barroom.add_guest(@guest8)
      assert_equal(true, @barroom.room_full?)
  end

  def test_room_full__returns_false
     @barroom.guests.delete(@guest3)
     @barroom.guests.delete(@guest2)
     @barroom.guests.delete(@guest1)
     assert_equal(false, @barroom.room_full?)
  end


  def test_guest_leave_room()
      @barroom.leave_room(@guest4)
      assert_equal(3, @barroom.number_of_guests())
      assert_equal(false, @barroom.guests.include?(@guest4))
  end

end
