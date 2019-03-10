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
    # @song2 = Song.new("Iron Man", "Black Sabbath")
    # @song3 = Song.new("Run to the Hills", "Iron Maiden")
    # @song4 = Song.new("About the Girl", "Alice in Chains")
    @guest1 = Guest.new("Dan", 50.00, "Would?", 22)
    @guest2 = Guest.new("Bob", 40.00, "Iron Man", 23)
    @guest3 = Guest.new("Eddie", 100.00, "About the Girl", 24)
    @guest4 = Guest.new("Luca", 80.00, "Whisky in the Jar", 25)
    list = [@song1, @song2, @song3, @song4]
    guests = [@guest1, @guest2, @guest3, @guest4]
    drinks =[ @drink1, @drink2, @drink3, @drink4]
    @drink1 = Drink.new("Corona", 3.0, 8)
    @drink2 = Drink.new("Malbec", 5.0, 3)
    @drink3 = Drink.new("Coke", 2.0, 0)
    @drink4 = Drink.new("Tequila", 2.50, 2)
    @barroom = Barroom.new("DrinkingPad", guests, drinks)
    @guest5 = Guest.new("Zita", 70.00, "BlaBla", 27)
    @guest6 = Guest.new("Bob", 70.00, "BlaBla", 28)
    guests2 = [@guest1, @guest2, @guest3, @guest4, @guest5, @guest6]

  end

  def test_room_has_name
    assert_equal("DrinkingPad", @barroom.name())
  end

  def test_room_has_guest
    assert_equal(4, @barroom.guests.length())
  end

  def test_room_length
    assert_equal(4, @barroom.guests.length())
  end

  def test_bar_has_till
    assert_equal(200.00, @barroom.till())
  end

  def test_bar_has_drinking_age
    assert_equal(18, @barroom.drinking_age())
  end



    def test_amount_of_drinks
      assert_equal(4, @barroom.drinks.length)
    end

    def test_serve_drink()
    @guest2.buy_drink(@drink2)
    assert_equal(205.00, @barroom.till )
    end

    def test_serve_drink()
    # @guest2.fav_drink = "Malbec"
    @barroom.drinks.include?(@drink2)
    @guest2.buy_drink(@drink2)
    assert_equal(35.00, @guest2.money)
    end

    def test_serve_drink__not_enough_money()
    @barroom.drinks.include?(@drink2)
    @guest2.buy_drink(@drink2)
    @guest2.buy_drink(@drink2)
    @guest2.buy_drink(@drink2)
    @guest2.buy_drink(@drink2)
    @guest2.buy_drink(@drink2)
    @guest2.buy_drink(@drink2)
    @guest2.buy_drink(@drink2)
    @guest2.buy_drink(@drink2)
    assert_equal(0.00, @guest2.money)
    end


        def test_serve_drink__bladder()
        @barroom.drinks.include?(@drink2)
        @guest2.buy_drink(@drink2)
        @guest2.buy_drink(@drink2)
        @guest2.buy_drink(@drink2)
        @guest2.buy_drink(@drink2)
        @guest2.buy_drink(@drink2)
        @guest2.buy_drink(@drink2)
        @guest2.buy_drink(@drink2)
        @guest2.buy_drink(@drink2)
        assert_equal(24, @guest2.bladder_fulness)
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

def test_guest_leave_room()
    @barroom.guests.delete(@guest5)
    assert_equal(4, @room.guests.length())
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
    @barroom.leave_room(@guest5)
    assert_equal(4, @barroom.guests.length())
end


end
