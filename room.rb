class Room
  attr_reader :name
  def initialize(name, guests)
    @name = name
    @guests = guests
  end

  def number_of_guests
    return @guests.length
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
