class Guest
  attr_reader :name, :money, :age, :fav_song, :bladder_fulness
  attr_accessor :fav_drink
  def initialize(name, money, fav_song, age)
    @name = name
    @money = money
    @age = age
    @fav_song = fav_song
    @fav_drink = []
    @bladder_fulness = 0
  end

def guest_can_pay_fee?(caraokeroom)
    @money >= caraokeroom.fee
  end

 def guest_can_afford_drink?(drink)
     @money >= drink.price
 end

  def buy_drink(drink)
    if guest_can_afford_drink?(drink)
      @money -= drink.price()
      @bladder_fulness += drink.quantity()
    end
  end

end
