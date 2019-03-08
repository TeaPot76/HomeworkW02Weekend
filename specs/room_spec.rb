require("minitest/autorun")
require('minitest/rg')
require_relative("../room")
require_relative("../song")
require_relative("../guest")

class RoomTest < MiniTest::Test

  def setup

    @song1 = Song.new("Would?", "Alice in Chains")
    @song2 = Song.new("Iron Man", "Black Sabbath")
    @song3 = Song.new("Run to the Hills", "Iron Maiden")
    @song4 = Song.new("About the Girl", "Alice in Chains")
    @guest1 = Guest.new("Dan", 50.00, "Would?")
    @guest2 = Guest.new("Bob", 40.00, "Iron Man")
    @guest3 = Guest.new("Eddie", 100.00, "About the Girl")
    @guest4 = Guest.new("Luca", 80.00, "Whisky in the Jar")
    list = [@song1, @song2, @song3, @song4]
     guests = [@guest1, @guest2, @guest3, @guest4]
      @room = Room.new("RockBar", guests, list)
      @song5 = Song.new("Whisky in the Jar", "Mettalica")
      @guest5 = Guest.new("Zita", 70.00, "BlaBla")
      @guest6 = Guest.new("Bob", 70.00, "BlaBla")
      guests2 = [@guest1, @guest2, @guest3, @guest4, @guest5, @guest6]
      # @room2 = Room.new("BarTwo", guest2, 8, list2)
      # list2 = [@song1, @song2, @song3, @song4]
  end

  def test_room_has_name
    assert_equal("RockBar", @room.name())
  end

  def test_room_has_guest
    assert_equal(4, @room.guests.length())
  end
  def test_room_length
    assert_equal(4, @room.guests.length())
  end

  def test_room_has_fee
    assert_equal(10, @room.fee())
  end

    def test_has_list()
      assert_equal([@song1, @song2, @song3, @song4], @room.list())
    end
  #
  def test_number_of_songs()
    @room.list.length
   assert_equal(4, @room.list.length)
  end

 def test_add_song()
  @room.add_song(@song5)
  assert_equal(5, @room.list.length)
end



# def test_room_full__returns_false
#   assert_equal(false, @room.guest.length())
# end
# def test_full_room
# assert_equal(30, @room.size.length)
# end

def test_add_guest()
 @room.add_guest(@guest5)
 assert_equal(5, @room.guests.length)
end

def test_guest_leave_room()
   @room.guests.delete(@guest5)
  assert_equal(4, @room.guests.length())
end
def test_room_full__returns_true
  @room.add_guest(@guest6)
  @room.add_guest(@guest7)
  @room.add_guest(@guest8)
 assert_equal(true, @room.room_full?)
end

def test_room_full__returns_false
  @room.guests.delete(@guest3)
  @room.guests.delete(@guest2)
  @room.guests.delete(@guest1)

 assert_equal(false, @room.room_full?)
end

# def test_guest_can_pay_fee?()
# assert_equal(true, guest_can_pay_fee(@guest1))
# end


def test_guest_can_enter?()
  @room.add_guest(@guest6)
  assert_equal(true, @room.guest_can_enter?(@guest1, @room))
end

def test_guest_can_enter_false?()
  @room.add_guest(@guest6)
  @room.add_guest(@guest7)
  @room.add_guest(@guest8)
  @room.add_guest(@guest9)
  assert_equal(false, @room.guest_can_enter?(@guest1, @room))
end

# def test_guest_leave_room()
#   @room.leave_room(@guest5)
#   assert_equal(4, @room.guest.length())
# end
# def test_room_full__returns_true
#   @room.add_guest(@guest6)
#   room_full(guest)
#   assert_equal(true, @room.guest.length)
# end


end
