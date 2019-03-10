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
        return false
    end
      puts "Perhaps you could wait in bar"
  end

  def has_fav_song(guest)
  for song in @list
    if song.title == guest.fav_song
      return true
    end
  end
  return false
end


   def play_song(guest, input)
      print "Please enter song name: "
            input = gets.chomp
        if input == guest.fav_song && has_fav_song(guest)

        print "The next song is #{guest.fav_song}"
        return guest.fav_song

        else print "Don't have song"
          return false
      end
    end


   end
