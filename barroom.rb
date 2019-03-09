require_relative("./room")
class Barroom < Room

  attr_reader :name, :guests, :drinks, :drunkness, :drinking_age, :till
  def initialize(name, guests, drinks)
    super(name, guests)
    # @name = name
    # @guests = guests
    @drinks = drinks
    @till = 200
    @drunkness = 15
    @drinking_age = 18

  end

  def amount_of_drinks
    return @drinks.length
  end

  def serve_drink(drink, guest)

        @drinks.find{|drink| drink == guest.fav_drink}
   end

end
