require("minitest/autorun")
require('minitest/rg')
require_relative("../room")
require_relative("../song")
require_relative("../guest")
require_relative("../caraokeroom")

class RoomTest < MiniTest::Test

  def setup

    @song1 = Song.new("Would?", "Alice in Chains")
    @song2 = Song.new("Iron Man", "Black Sabbath")
    @song3 = Song.new("Run to the Hills", "Iron Maiden")
    @song4 = Song.new("About the Girl", "Alice in Chains")
    @guest1 = Guest.new("Dan", 50.00, "Would?", 22)
    @guest2 = Guest.new("Bob", 40.00, "Iron Man", 23)
    @guest3 = Guest.new("Eddie", 100.00, "About the Girl", 24)
    @guest4 = Guest.new("Luca", 80.00, "Whisky in the Jar", 25)
    list = [@song1, @song2, @song3, @song4]
    guests = [@guest1, @guest2, @guest3, @guest4]
    @room = Room.new("RockBar", guests)
    @room2 = Room.new("Bar", guests)
    @song5 = Song.new("Whisky in the Jar", "Mettalica")
    @guest5 = Guest.new("Zita", 70.00, "BlaBla", 27)
    @guest6 = Guest.new("Bob", 70.00, "BlaBla", 26)
    guests2 = [@guest1, @guest2, @guest3, @guest4, @guest5, @guest6]

  end

  def test_room_has_name
    assert_equal("Bar", @room2.name())
  end

  def test_room_has_guest
    assert_equal(4, @room2.guests.length())
  end
  def test_room_length
    assert_equal(4, @room2.guests.length())
  end

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

def test_guest_leave_room()
  @room.leave_room(@guest5)
  assert_equal(4, @room.guests.length())
end


end
