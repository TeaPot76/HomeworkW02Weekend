class Room
  attr_reader :name, :guests, :fee, :list
  def initialize(name, guests)
    @name = name
    @guests = guests

  end

  def guests_length
    returns @guests_length
  end

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

  end
