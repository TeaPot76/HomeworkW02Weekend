class Guest
  attr_reader :name, :money, :fav_song
  def initialize(name, money, fav_song)
    @name = name
    @money = money
    @fav_song = fav_song
  end

def guest_can_pay_fee?(room)
  return @money >= room.fee
  end

end
