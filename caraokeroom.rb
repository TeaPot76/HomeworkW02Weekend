require_relative("./room")
class Caraokeroom < Room

  attr_reader :name, :guests, :fee, :list
  def initialize(name, guests, fee, list)
    super(name, guests)
    @list = list
    @fee = fee
  end

  def number_of_songs()
    return @list.length
  end
 #
  def add_song(song)
    @list << song
  end


  def guest_can_enter?(guest, caraokeroom)
    if (!room_full? &&
      guest.guest_can_pay_fee?(caraokeroom))
        add_guest(guest)
        puts "Welcome to #{caraokeroom.name}"
        return true
     else
      puts "You can choose room2"
      return false
    end
  end

  def play_fav_song(guest)

        @list.find{|song| song == guest.fav_song}
   end

end
