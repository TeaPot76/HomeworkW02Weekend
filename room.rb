class Room
  attr_reader :name, :guests, :fee, :list
  def initialize(name, guests, list)
    @name = name
    @guests = guests
    @list = list
    @fee = 10
  end
  #
  def number_of_songs()
    return @list.length
  end

  def add_song(song)
    @list << song
  end

  def guests_length
    returns @guests_length
  end
 #

  def add_guest(guest)
    @guests << guest
  end


   def leave_room(guest)
     result = @guests.delete(guest)
     return result
   end


  def room_full?
     return @guests.length >= 7
  end

  def guest_can_enter?(guest, room)
    if (!room_full? &&
      guest.guest_can_pay_fee?(room))
        add_guest(guest)
        puts "Welcome to #{room.name}"
        return true
     else
      
      return false
    end
  end



end
