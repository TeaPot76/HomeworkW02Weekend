require_relative("./room")
class Barroom < Room

  attr_reader :name, :guests, :drunkness, :drinking_age, :till
  attr_accessor :drinks
  def initialize(name, guests, drinks)
    super(name, guests)
    @drinks = drinks
    @till = 200.00
    @drunkness = 15
    @drinking_age = 18
  end

  def amount_of_drinks
    return @drinks.length
  end


  def serve_drink(drink, guest)
    if guest.age >= @drinking_age
      if guest.guest_can_afford_drink?(drink)
        if @drinks.include?(drink)
          guest.buy_drink(drink)
          @till += drink.price()
        end
      end
    end
  end

 def guest_leave_room_full_bladder(guest)
   if guest.bladder_fulness >= 25
     print "I am off to loo"
     leave_room(guest)
   end
 end

end
