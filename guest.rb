class Guest
  attr_reader :name, :money, :age, :fav_song
  attr_accessor :fav_drink
  def initialize(name, money, fav_song, age)
    @name = name
    @money = money
    @age = age
    @fav_song = fav_song
    @fav_drink = nil
  end

def guest_can_pay_fee?(caraokeroom)
  return @money >= caraokeroom.fee
  end


end
