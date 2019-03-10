require("minitest/autorun")
require('minitest/rg')
require_relative("../caraokeroom")
require_relative("../room")
require_relative("../song")
require_relative("../guest")

class CaraokeroomTest < MiniTest::Test

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
    @caraokeroom = Caraokeroom.new("RockBar", guests, 10, list)
    @song5 = Song.new("Whisky in the Jar", "Mettalica")
    @guest5 = Guest.new("Zita", 70.00, "BlaBla", 27)
    @guest6 = Guest.new("Bob", 70.00, "BlaBla", 28)
    guests2 = [@guest1, @guest2, @guest3, @guest4, @guest5, @guest6]

  end

  def test_room_has_name
    assert_equal("RockBar", @caraokeroom.name())
  end

  def test_room_has_guest
    assert_equal(4, @caraokeroom.guests.length())
  end
  def test_room_length
    assert_equal(4, @caraokeroom.guests.length())
  end

  def test_room_has_fee
    assert_equal(10, @caraokeroom.fee())
  end
#
    def test_has_list()
      assert_equal([@song1, @song2, @song3, @song4], @caraokeroom.list())
    end
#   #
  def test_number_of_songs()
    @caraokeroom.list.length
   assert_equal(4, @caraokeroom.list.length)
  end
#
 def test_add_song()
  @caraokeroom.add_song(@song5)
  assert_equal(5, @caraokeroom.list.length)
end

def test_add_guest()
 @caraokeroom.add_guest(@guest5)
 assert_equal(5, @caraokeroom.guests.length)
end

def test_guest_leave_room()
   @caraokeroom.guests.delete(@guest5)
  assert_equal(4, @caraokeroom.guests.length())
end
def test_room_full__returns_true
  @caraokeroom.add_guest(@guest6)
  @caraokeroom.add_guest(@guest7)
  @caraokeroom.add_guest(@guest8)
 assert_equal(true, @caraokeroom.room_full?)
end

def test_room_full__returns_false
  @caraokeroom.guests.delete(@guest3)
  @caraokeroom.guests.delete(@guest2)
  @caraokeroom.guests.delete(@guest1)

 assert_equal(false, @caraokeroom.room_full?)
end

def test_guest_can_pay_fee?()
# caraokeroom = Caraokeroom.new("Bar!", [], 10, [])
assert_equal(true, @guest1.guest_can_pay_fee?(@caraokeroom))
end

def test_guest_can_enter?()
  @caraokeroom.add_guest(@guest6)
  assert_equal(true, @caraokeroom.guest_can_enter?(@guest1, @caraokeroom))
end

def test_guest_can_enter_false?()
  @caraokeroom.add_guest(@guest6)
  @caraokeroom.add_guest(@guest7)
  @caraokeroom.add_guest(@guest8)
  @caraokeroom.add_guest(@guest9)
  assert_equal(false, @caraokeroom.guest_can_enter?(@guest1, @caraokeroom))
end

def test_has_fav_song__true()

  result = @caraokeroom.has_fav_song(@guest1)
  assert_equal(true, result)
end

def test_has_fav_song__false()

  result = @caraokeroom.has_fav_song(@guest6)
  assert_equal(false, result)
end

#
def test_play_song_returns_song
   @caraokeroom.has_fav_song(@guest1)
   input = @guest1.fav_song
  result =  @caraokeroom.play_song(@guest1, input)
  assert_equal(@guest1.fav_song, result)
end
#
# def test_play_song__no_song
#    @caraokeroom.has_fav_song(@guest6)
#    input = @guest6.fav_song
#   result =  @caraokeroom.play_song(@guest6, input)
#   assert_equal(false, result)
# end

end
